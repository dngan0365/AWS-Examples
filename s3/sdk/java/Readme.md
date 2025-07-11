# Create a new Maven Project

```sh
mvn archetype:generate \
-DgroupId=com.mycompany.app \
-DartifactId=my-app \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DarchetypeVersion=1.4 \
-DinteractiveMode=false
```

```sh
mvn -B archetype:generate \
  -DarchetypeGroupId=software.amazon.awssdk \
  -DarchetypeArtifactId=archetype-lambda \
  -DarchetypeVersion=2.21.29 \
  -Dservice=s3 \
  -Dregion=us-east-1 \
  -DgroupId=com.example.myapp \
  -DartifactId=myapp

``