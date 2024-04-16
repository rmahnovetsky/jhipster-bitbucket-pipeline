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

or 

```
image: bluefloyd/jhipster-bitbucket-pipeline

pipelines:
  default:
    - step:
        script:
          - rm -rf node_modules/
          - npm install
          - ./gradlew installGulp
          - ./gradlew clean bootRepackage
```

Note: this Dockerfile is built after each commit to 'master'.

Docker image info: https://hub.docker.com/r/monojetski/jhipster-bitbucket

To test the docker image locally

first build it
```
docker build -t monojetski/jhipster-bitbucket:16-apr-2024 .
```

Run it and use bash shell

```
docker run -it monojetski/jhipster-bitbucket:latest bash
```

Add tag if forgotten in previous step
```
docker tag monojetski/jhipster-bitbucket:latest monojetski/jhipster-bitbucket:16-apr-2024
```
To push to docker hub

```
docker login registry.hub.docker.com
docker push monojetski/jhipster-bitbucket:latest
```