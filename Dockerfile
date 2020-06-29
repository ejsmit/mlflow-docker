
FROM python:3-slim

LABEL maintainer "ejsmit"

ENV MLFLOW_VERSION 1.9.1
RUN pip install \
	mlflow==$MLFLOW_VERSION \
    boto3

WORKDIR /app
COPY entrypoint.sh /

EXPOSE 5000
ENTRYPOINT ["/entrypoint.sh"]

