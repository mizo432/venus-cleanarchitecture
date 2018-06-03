#!/bin/bash

BULILDED_JAR=$1
ENV=$2
EB_ENV=$3
APP_NAME=$4

JAR_NAME="application.jar"
ZIP_NAME="application.zip"
PROC_NAME="Procfile"

mkdir ./release

echo "mv ${BULILDED_JAR} ./release/${JAR_NAME}"
cp ${BULILDED_JAR} ./release/${JAR_NAME}

echo "web: java -jar ${JAR_NAME} -Xms1024m -Xmx1024m --spring.profiles.active=${ENV}" > ./release/${PROC_NAME}
cat ./release/${PROC_NAME}

echo "cp -pr ./ebextensions_env/${EB_ENV}/.ebextensions ./release"
cp -pr ./ebextensions_env/${EB_ENV}/.ebextensions ./release

echo "cp -pr ./elasticbeanstalk_app/${EB_ENV}/.elasticbeanstalk ./release"
cp -pr ./elasticbeanstalk_app/${EB_ENV}/.elasticbeanstalk ./release

cd ./release
echo "zip ./${ZIP_NAME} ./${JAR_NAME}"
zip ./${ZIP_NAME} ./${JAR_NAME}
echo "zip ./${ZIP_NAME} ./${PROC_NAME}"
zip ./${ZIP_NAME} ./${PROC_NAME}
echo "zip -r ./${ZIP_NAME} ./.ebextensions"
zip -r ./${ZIP_NAME} ./.ebextensions

pwd
ls -la
zipinfo ${ZIP_NAME}
ls -la .elasticbeanstalk
cat .elasticbeanstalk/*

echo "eb deploy ${EB_ENV}"
DEPLOY_RESULT=$(eb deploy ${EB_ENV})
echo ${DEPLOY_RESULT}

cd ../
rm -rf ./release

if [ "$(echo ${DEPLOY_RESULT} | grep 'ERROR')" ];then
  exit 1
fi

