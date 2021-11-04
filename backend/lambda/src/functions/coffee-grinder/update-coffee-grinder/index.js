'use strict';
const AWS = require('aws-sdk');
AWS.config.update({ region: process.env.AWS_REGION });

exports.handler = async (event) => {
    const docClient = new AWS.DynamoDB.DocumentClient();
    const eventBody = JSON.parse(event.body);
    var params = {
        TableName: process.env.DYNAMODB_TABLE,
        Key: eventBody.key,
        UpdateExpression: "set details = :details",
        ExpressionAttributeValues: {
            ":details": eventBody.details
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
