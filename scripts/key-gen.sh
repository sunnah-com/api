#!/bin/bash
# This script requires aws-cli to be installed
# Please visit https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
# After installation use 'aws configure' to setup the credentials and then execute the script

if [ "$#" -eq 0 ]
then
    echo "This script takes one command-line argument: the name of the key to be created"
    exit 1
fi

KEYNAME=$1
KEYINFO=`aws apigateway create-api-key --name ${KEYNAME} --region us-west-2 --enabled 2>&1`
# KEYVALUE=`aws apigateway get-api-key --api-key ${KEYNAME} --include-value --region us-west-2 | grep value | cut -d\" -f4 2>&1`
echo "Attempting to run command aws apigateway create-api-key --name ${KEYNAME} --region us-west-2 --enabled 2>&1"
# echo "Command returned ${KEYINFO}"
KEYID=`echo ${KEYINFO} | grep id | cut -d\" -f4`
KEYVALUE=`echo ${KEYINFO} | grep value | cut -d\" -f8`
aws apigateway create-usage-plan-key --usage-plan-id b3rk95 --key-type API_KEY --key-id ${KEYID} > /dev/null
echo -e "\nNew key successfully created: ${KEYVALUE}"

