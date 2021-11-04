'use strict';
const AWS = require('aws-sdk');
AWS.config.update({ region: process.env.AWS_REGION });

exports.handler = async (event) => {
    const docClient = new AWS.DynamoDB.DocumentClient();
    const params = {
        TableName: "coffee_grinders",
    };

    try {
        console.log(`Fetching items with params: ${JSON.stringify(params)}`);
        const data = await docClient.scan(params).promise();
        console.log(`Count: ${data.Count}, Scanned Count: ${data.ScannedCount}`);
        return data.Items;
    } catch (error) {
        console.error(error.stack);
        return error;
    }
}
