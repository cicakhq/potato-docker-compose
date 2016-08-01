# Docker configuration for Potato

## Prerequisites

In order to run the Docker configuration, you need to have Docker and
docker-compose installed. Also, the configuration uses version 2 of
the docker-compose format, so you need a recent version.

To install the most recent version of Docker, refer to the official
documentation: https://docs.docker.com/engine/installation/

The documentation on how to install docker-compose can be found here:
https://docs.docker.com/compose/install/

## Installation

### Edit the Potato configuration file

The configuration file is located in `potato/potato.cfg`. Edit this
file according to the comments in the file. The most important options
to set are the SMTP server options. Without these, the server will not
be able to send emails, which are required in order to allow users to
register.

Without email settings you have to manually add all users using the
commands given below.

### Build the docker images

Use the following command to build the configuration:

```
docker-compose build
```

### Starting the servers

The following command will start the servers (it will also rebuild the
configuration so strictly speaking the previous command is not
required):

```
docker-compose up --build
```

### Test the connectivity

Once the servers are up, you should be able to access the service on
port 80 of the host where the Docker containers are running.

## Creating domains and users

First, identify the ID of one of the web containers:

```
$ docker ps | grep web0
cf47c4774e73        potatodockercompose_web0 ...
```

In this case, the string `cf47c4774e73` is the container ID. Use this
in the examples below.

To show help for the Potato server commands:

```
docker exec cf47c4774e73 ./cmd.sh 'help'
```

At the very least you to configure a default domain:

```
docker exec cf47c4774e73 ./cmd.sh 'create-domain Foo true true'
```

To create a new channel under this domain, use the following command.
Use the domain ID that was returned from the previous command.

```
docker exec cf47c4774e73 ./cmd.sh 'create-channel "Example channel" b45d09fb8e4a679107a74dfdc400c0bc'

```

To create a user:

```
docker exec cf47c4774e73 ./cmd.sh 'create-user foo@foo.com "Foo user" "password" false true'
```
