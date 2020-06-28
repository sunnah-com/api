#!/bin/bash
# This script requires aws-cli to be installed
# Please visit https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
# After installation use 'aws configure' to setup the credentials and then execute the script
echo -n "Please enter the name for the key: "
read KEYNAME
KEYINFO=`aws apigateway create-api-key --name ${KEYNAME} --enabled`
KEYID=`echo ${KEYINFO} | grep id | cut -d\" -f4`
KEYVALUE=`echo ${KEYINFO} | grep value | cut -d\" -f8`
aws apigateway create-usage-plan-key --usage-plan-id b3rk95 --key-type API_KEY --key-id ${KEYID} > /dev/null
echo "New key successfully created: ${KEYVALUE}"
