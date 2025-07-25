## Create a bucket
```sh
aws s3 mb s3://dngan-cors
```
## Change block public access
```sh
aws s3api put-public-access-block \
    --bucket dngan-cors \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket dngan-cors --policy file://s3/cors/policy.json
```
## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket dngan-cors --website-configuration file://s3/cors/website.json
```
## Upload our index.html file and include a resource that would be cross-origin
```sh
aws s3api put-object \
    --bucket dngan-cors \
    --key index.html \
    --body ./s3/cors/index.html \
    --content-type text/html
```

## View the website and see if the index.htmll is there

# Create another website to block external orgin
```sh
aws s3 mb s3://dngan-cors-2
aws s3api get-bucket-website --bucket dngan-cors-2 
aws s3api put-public-access-block \
    --bucket dngan-cors-2 \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
aws s3api put-bucket-policy --bucket dngan-cors-2 --policy file://s3/cors/policy.json
aws s3api put-bucket-website --bucket dngan-cors-2 --website-configuration file://s3/cors/website.json
aws s3api put-object   --bucket dngan-cors-2   --key index.html   --body ./s3/cors/index.html   --content-type text/html
```
## Create API Gateway with mock response and then test the endpoint
curl -X POST -H "Content-Type: application/json" https://csyeomao8e.execute-api.ap-southeast-1.amazonaws.com/test/hello

## Set CORS on our bucket
```sh
aws s3api put-bucket-cors --bucket dngan-cors --cors-configuration file://cors.json
```