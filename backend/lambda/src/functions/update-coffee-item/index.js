'use strict';
const AWS = require('aws-sdk');
AWS.config.update({ region: process.env.AWS_REGION });

exports.handler = async (event) => {
    const docClient = new AWS.DynamoDB.DocumentClient();
    const eventBody = JSON.parse(event.body);
    var params = {
        TableName: event.queryStringParameters.table,
        Key: eventBody.key,
        UpdateExpression: "set model = :mod, manufacturer = :manu",
        ExpressionAttributeValues: {
            ":mod": eventBody.model,
            ":manu": eventBody.manufacturer
        },
        ReturnValues: "UPDATED_NEW"
    };

    try {
        console.log(`Updating item with params: ${JSON.stringify(params)}`);
        await docClient.update(params).promise();
        console.log(`Updated item successfully: ${JSON.stringify(params)}`)
        return;
    } catch (error) {
        console.error(error.stack);
        return error;
    }
}