'use strict';
const AWS = require('aws-sdk');
AWS.config.update({ region: process.env.AWS_REGION });

exports.handler = async (event) => {
    const docClient = new AWS.DynamoDB.DocumentClient();
    const eventBody = JSON.parse(event.body);
    var params = {
        TableName: "coffee_makers",
        Key: eventBody.key,
    };

    try {
        console.log(`Deleting item with params: ${JSON.stringify(params)}`);
        await docClient.delete(params).promise();
        console.log(`Deleted item successfully: ${JSON.stringify(params)}`)
        return;
    } catch (error) {
        console.error(error.stack);
        return error;
    }
}
