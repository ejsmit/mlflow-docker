
FROM python:3-slim AS builder

RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc libffi-dev

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

ARG MLFLOW_VERSION=1.9.1

RUN pip install \
	mlflow==$MLFLOW_VERSION \
    boto3



FROM python:3-slim
LABEL maintainer "ejsmit"

COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY entrypoint.sh /

EXPOSE 5000
ENTRYPOINT ["/entrypoint.sh"]









