# Quick install

## Edit the Potato configuration file

The configuration file is located in `potato/potato.cfg`. Edit this
file according to the comments in the file. The most important options
to set are the SMTP server options. Without these, the server will not
be able to send emails, which are required in order to allow users to
register.

Without email settings you have to manually add all users using the
commands given below.

## Build the docker images

Build the Potato image using the name `potato`.

```
docker build -t potato lokedhs/potato
```

You can now bring up the servers:

```
docker-compose up --build
```

## Test the connectivity

Once the servers are up, you should be able to access the service on
port 80 of the host where the Docker containers are running.

# Creating domains and users

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
docker exec cf47c4774e73 ./cmd.sh 'create-user foo@foo.com "Foo user" "password" false true
```
