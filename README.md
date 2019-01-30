# awscli-nkf
Docker image for character code transform on AWS Batch.

## Summary
1. Download text file from AWS S3.
1. Transform character code by nkf.
1. Upload text file to AWS S3.

## How to use

Transform character code to utf-8.

```bash
$ docker run -e "AWS_DEFAULT_REGION=ap-northeast-1" -e "AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE" -e "AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY" -it awscli-nkf sh -c "aws s3 cp s3://bucket/path/to/file .tmp && nkf --guess .tmp && nkf --overwrite -x -w .tmp && nkf --guess .tmp && aws s3 cp .tmp s3://bucket/path/to/file"
```

