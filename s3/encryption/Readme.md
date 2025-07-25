## Create a bucket
```sh
aws s3 mb s3://dngan-encryption
```
## Create a file
```sh
echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://dngan-encryption
```
## Put Object with encryption of 
### Create KMS key
list all keys
```sh
aws kms list-keys
```
create a key
```sh
aws kms create-key
```

```sh
aws s3api put-object \
  --bucket dngan-encryption \
  --key hello-1.txt \
  --body hello.txt \
  --server-side-encryption aws:kms \
  --sse-kms-key-id arn:aws:kms:ap-southeast-1:861276091613:key/041a138b-c309-4dd5-9d9e-37097b11f385
```

### Put Object with SEE-C
```sh
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY
export MD5_VALUE=$(echo -n $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64)
echo $MD5_VALUE
aws s3api put-object \
  --bucket dngan-encryption \
  --key hello-2.txt \
  --body hello.txt \
  --sse-customer-algorithm AES256 \
  --sse-customer-key $BASE64_ENCODED_KEY \
  --sse-customer-key-md5 $MD5_VALUE

```

### Put Object with SEE-C via aws s3

```sh
openssl rand -out ssec.key 32
aws s3 cp hello.txt s3://dngan-encryption/hello-3.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key
aws s3 cp s3://dngan-encryption/hello-3.txt hello-3.txt --sse-c AES256 --sse-c-key fileb://ssec.key
```
