## Create a new bucket

```sh
aws s3api create-bucket --bucket acl-example-ab-12 --regian us-east-1
```

## Turn of Block Public for ACL
```sh
aws s3api put-public-access-block \
--bucket acl-example-ab-12
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestricPublicBuckets=false"
```
```sh
aws s3api get-public-access-block 
```

## Change Bucket ownership

```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-example-ab-12\
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow for a user
```sh
aws s3api put-bucket-acl
--bucket acl-example-ab-12
--grant-full-control nganngan0365@gmail.com 
--grand-read uri=http://acs.amazonaws.com/groups/global/AllUsers"
```

## Access Bucket from other account

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://acl-example-ab-12
aws s3 ls s3://acl-example-ab-12
```

## Clean up
```sh
aws rm s3://acl-example-ab-12/bootcamp.txt
aws rb s3://acl-example-ab-12
```