# Docker Compose sample to back up rotated-log files to Amazon S3

## How to run

1. clone this repo
2. copy credentials.txt.dist to credential.txt in docker/s3_backup/config/aws
3. set your AWS credential in credential.txt
4. change S3 bucket name in docker/s3_backup/config/
5. docker-compose build
6. docker-compose up

Check your S3 bucket on AWS console.

