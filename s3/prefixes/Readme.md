## Create our bucket
```sh
aws s3 mb s3://prefixes-fun-ab-5235
```

## Create our folder
```sh
aws s3 put-object --bucket prefixes-fun-ab-5235 --key="hello/" 
```

## Create many folders
```sh
aws s3 put-object --bucket prefixes-fun-ab-5235 --key="hello/ngan/folder/" --body=""
```

## Create our folder
```sh
aws s3 put-object --bucket prefixes-fun-ab-5235 --key="hello/" --body="hello.txt"
```