# Overview

Easily set up Chainlink Node on AWS Cloud.

Built on [AWS Fargate](https://aws.amazon.com/fargate/?nc1=h_ls) using docker ECS integration.

## Prerequisites

1.Download and install the latest version of Docker Desktop.

2.Ensure you have an AWS account.

## Requirements

- **docker ecs cscontext** - Docker context for ECS integration
- **Postgres DB** - Connection info to the DB
- **ETH Node URL** - Infra or Alchemy or etc

## Development

### 0. Setup

- IAM credentail with [appropriate permissions](https://docs.docker.com/cloud/ecs-integration/#requirements) -> `.env`

- Replace the your information to create a Docker image -> `Dockerfile`,`.env `

  - Docker image name
  - Eth node url
  - Database url

- Constructor settings for ChainlinkNode

```
$ mkdir data
$ touch data/.api&&touch data/.password
```

- `data/.api` file should contain the email address and password for loggin the chainlink node

```> .api
<your email>
<your password>
```

- `data/.password` Set EOA passwords for files.

```
<EOA password>
```

> The folder structure should look like the following.

```
 ├── .env
 ├── .env-sample
 ├── .gitignore
 ├── Dockerfile
 ├── Makefile
 ├── Readme.md
 ├── data
 │   ├── .api
 │   ├── .password
 └── docker-compose.yml
```

### 1. Build image & Deploy to ECS

```sh
$ make build
$ make login
$ make tag
# replace the image to docker-compose.yml
$ make push

# Change to ECS context
$ docker compose up
```
