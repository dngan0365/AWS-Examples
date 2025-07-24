## Create a bucket
```sh
aws s3 mb s3://bucket-policy-12
```

## Create bucket policy
```sh
aws s3api put-bucket-policy --bucket bucket-policy-12 --policy file://policy.json
```
## In the other account access the bucket

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-12
aws s3 ls s3://bucket-policy-12
```

## Clean up