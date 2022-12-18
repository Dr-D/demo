# Demo spring for ci/cd pipelines

Uses gradle

```shell
docker run --name=demo-build --mount type=bind,source="$(pwd)",target=/demo -w /demo amazoncorretto:11.0.17 bash -c "/demo/gradlew clean build && cp build/libs/demo*SNAPSHOT.jar . && /demo/gradlew clean"
```

Creates jar file and copies to root ./demo-0.0.1-SNAPSHOT.jar

Remove build folder if required
```shell
docker run --name=demo-clean --rm --mount type=bind,source="$(pwd)",target=/demo -w /demo amazoncorretto:11.0.17 bash -c "rm -rf build"
```
Run the jar file
```shell
docker run --name=demo-run --rm --mount type=bind,source="$(pwd)",target=/demo -p 9000:8080 amazoncorretto:11.0.17 bash -c "java -jar /demo/demo*.jar"
```

Test the jar file
curl localhost:9000/hello 
-> Hello World!
