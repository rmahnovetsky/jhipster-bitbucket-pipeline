# jhipster-bitbucket-pipeline
## Bitbucket JHipster pipeline Docker image Dockerfile

Example usage in bitbucket-pipelines.yml file:

```
image: bluefloyd/jhipster-bitbucket-pipeline

pipelines:
  default:
    - step:
        script:
          - ./gradlew clean bootRepackage
```

Docker image info: https://hub.docker.com/r/monojetski/jhipster-bitbucket

To test the docker image locally

first build it
```
docker build -t monojetski/jhipster-bitbucket:16-apr-2024 .
```

Run it and use bash shell

```
docker run -it monojetski/jhipster-bitbucket:16-apr-2024 bash
```

Add tag if forgotten in previous step
```
docker tag monojetski/jhipster-bitbucket:latest monojetski/jhipster-bitbucket:16-apr-2024
```
To push to docker hub

```
docker login registry.hub.docker.com
docker push monojetski/jhipster-bitbucket:16-apr-2024
```

To test
```
docker run -it -v /home/<local folder to mount>:/home monojetski/jhipster-bitbucket:1-may-2024 bash
```