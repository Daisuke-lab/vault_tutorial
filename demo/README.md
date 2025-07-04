## Run Application
```
mvn spring-boot:run
```

## Build Docker
```
docker build . -f Dockerfile -t vault-demo-java
```

## Push to Docker Hub
```
docker image tag <IMAGE-ID> daisukezr/vault-demo-java:latest
docker push daisukezr/vault-demo-java:latest
```