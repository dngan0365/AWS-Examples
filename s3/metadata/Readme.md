## Create a bucket

aws s3 mb s3://metadata-fun-ab-1234

### Create a new file

echo "Hello Ngan!" > hello.txt

## Upload file with metadata

aws s3api put-object --bucket metadata-fun-ab-1234 --key hello.txt --body hello.txt --metadata Planet=Mars 

## Get Metadata through head object

aws s3api head-object --bucket metadata-fun-ab-1234 --key hello.txt

## Clean up

aws s3 rm s3://metadata-fun-ab-1234/hello.txt
aws s3 rb s3://metadata-fun-ab-1234