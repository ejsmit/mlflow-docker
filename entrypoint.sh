#!/bin/sh

set -e


if [ -z $AWS_ACCESS_KEY_ID ]; then
  AWS_ACCESS_KEY_ID='mlflow_accesskey'
fi

if [ -z $AWS_SECRET_ACCESS_KEY ]; then
  AWS_SECRET_ACCESS_KEY='mlflow_secretkey'
fi

if [ -z $BACKEND_STORE_URI ]; then
  BACKEND_STORE_URI='/mlflow/filestore'
fi

if [ -z $DEFAULT_ARTIFACT_ROOT ]; then
  DEFAULT_ARTIFACT_ROOT='s3://mlflow'
fi

echo "using backend store ${BACKEND_STORE_URI}"
echo "using artifact root ${DEFAULT_ARTIFACT_ROOT}"
if [ ! -z $MLFLOW_S3_ENDPOINT_URL ]; then
  echo "using custom s3 endpoint ${MLFLOW_S3_ENDPOINT_URL}"
fi 

mlflow db upgrade

mlflow server \
    --backend-store-uri ${BACKEND_STORE_URI} \
    --default-artifact-root ${DEFAULT_ARTIFACT_ROOT} \
    --host 0.0.0.0 \
    --port 5000


