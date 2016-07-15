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

Docker image info: https://hub.docker.com/r/bluefloyd/jhipster-bitbucket-pipeline/
