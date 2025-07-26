## Create a user wiht no permissions

We need to create a new user with no permission and generate out access keys
```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
aws configure
```
Then edit credentials file to change away from default profile
```sh
nano ~/.aws/credentials
```
Test who you are:
```sh
aws sts get-caller-identity --profile sts
```
Do you have permission for s3?
```sh
aws s3 ls --profile sts
```

```sh
cd api/sts
chmod u+x bin/deploy
```
## Create a Role

We need to create a role that will access a new resource
(I don't know why I have to be in root that I could create stack in cloudformation, maybe user-name sts-machine haven't had permission yet)
```sh
chmod u+x bin/deploy
./bin/deploy
```

## Use new user credentials and assume role

```sh
aws iam put-user-policy \
    --user-name sts-machine-user \
    --policy-name StsAsumePolicy \
    --policy-document file://user-policy.json
```

```sh
aws sts assume-role \
    --role-arn arn:aws:iam::861276091613:role/my-sts-stack-StsRole-0CAkBPX3ja8f \
    --role-session-name s3-access
    --profile sts
```
```sh
nano ~/.aws/credentials
"""
[assumed]
aws_access_key_id = ASIA4RCAOGTO33FSSFWZ 
aws_secret_access_key = B7Kksjtir59q7yglFcI/>
<THaZIf7wcCYdDnroiNJY9wRVA= 
"""
aws sts get-caller-identity --profile assumed
aws s3 ls --profile assumed
```
## Clean up

Tear down your cloudformation stack via the AWS Management Console

```sh
aws iam delete-access-key \
--access-key-id AKIA4RCAOGTOS5DSNH4B \
--user-name sts-machine-user
aws iam delete-user-policy \
  --user-name sts-machine-user \
  --policy-name StsAsumePolicy
aws iam delete-user --user-name sts-machine-user
```