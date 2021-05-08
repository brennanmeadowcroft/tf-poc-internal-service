## Terraform POC: Internal Service
This is part of a Terraform POC.

The internal service is a standalone application with downstream dependencies.

### /Terraform
The `/terraform` folder contains the infrastructure to support the actual application.  It relies heavily on values in AWS Parameter Store and modules provided by a centralized infrastructure team (see: tf-poc-modules)

### /src
The source code for the application.

### /bin
Contains a build script to package the application into a zip file to be uploaded.