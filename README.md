# mlflow-docker

Simple mlflow tracking server, using a sqlite database and S3 artifact storage.

Accepts the following env vars, which directly maps to the command line parameters 
of `mlflow server`.

- **BACKEND_STORE_URI**: default value `/mlflow/filestore`
- **DEFAULT_ARTIFACT_ROOT**: default value `s3://mlflow`

See <https://www.mlflow.org/docs/latest/tracking.html#mlflow-tracking-servers> for 
a detailed discussion about parameter values.   

*The container contains the required drivers and software for filesystem, sqlite database, 
and S3 storage only.  This is all I currently require.*

The following can also be used when using S3 artifact storage. 

* **AWS_ACCESS_KEY_ID**: default value `mlflow_accesskey`
* **AWS_SECRET_ACCESS_KEY**: default value `mlflow_secretkey`
* **MLFLOW_S3_ENDPOINT_URL**: Useful if using minio instead of amazon s3.  Point mlflow to the minio 
  instance. Not set by default.

Starts up a `mlflow server` on http port 5000.


