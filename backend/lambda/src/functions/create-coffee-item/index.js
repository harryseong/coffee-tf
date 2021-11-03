'use strict';
const AWS = require('aws-sdk');
AWS.config.update({ region: process.env.AWS_REGION });

exports.handler = async (event) => {
    const docClient = new AWS.DynamoDB.DocumentClient();
    const params = {
        TableName: event.queryStringParameters.table,
        Item: JSON.parse(event.body)
    };

    try {
        console.log(`Creating new item with params: ${JSON.stringify(params)}`);
        await docClient.put(params).promise();
        console.log(`Created successfully: ${JSON.stringify(params)}`)
        return;
    } catch (error) {
        console.error(error.stack);
        return error;
    }
}
