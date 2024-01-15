## Introduction
This page outlines how to setup a local instance of Oracle 23c using docker to help with testing Liquibase commands.
The initial database setup creates a number of different users, tables, packages and procedures to simulate start with Liquibase on a pre-existing database like MAAT.

## Database Setup

1. Create a `.env` in the `laa-maat-liquibase-prototype/docker/oracle-docker` directory. This file should contain the password to use for the database users.
 ```
 DBPASSWORD=<MY PASSWORD>
 ```
2. Make sure you are in the `laa-maat-liquibase-prototype/docker/oracle-docker` directory.
3. Install Colima to allow the AMD64 docker image to run on Apple Silicon (skip this step if you are on an Intel CPU).
```
brew install colima
```
4. Run the following commands to create the docker database. If the image hasn't already been pulled this can be a long process as the image is ~1GB and the database can take 10+ mins to setup. Note that if you want to recreate the database use the `--force-recreate` option on the docker compose command otherwise the database remain in its previous state.
```
colima start --arch x86_64 --memory 4 --disk 100
docker-compose up --build
```