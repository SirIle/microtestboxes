# Microtestboxes

Microcontainers for testing the functionality provided by sirile/microboxes.

The Jetty-test war has been taken from https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/.

The nodejs example application has been taken from http://expressjs.com/starter/hello-world.html.

## Usage

The included shell scripts can be used to start the testboxes with both Weave
provided networking and without it.

First you need to build the required filebox volume containers:

```bash
./rebuildFileboxes.sh
```

This downloads the filebox images and creates the volume containers.

Then the images can be built locally or be downloaded from docker.io.

### With Weave networking

Example can be started with:

```bash
./startTestboxes.sh
```

This starts Weave, the Consul server container, a nodejs based example container,
a Jetty based example container and cAdvisor container.

### Without Weave networking

Example can be started with:

```bash
./startTestboxesNoWeave.sh
```

This starts the Consul server container, a nodejs based example container, a Jetty
based example container and cAdvisor container.

### Testing

Consul UI can be reached from port 8500 (for example http://10.10.10.30:8500).
cAdvisor UI can be reached from port 8080 (for example http://10.10.10.30:8080).
Nodejs based example app can be reached from port 80 (http://10.10.10.30).
Jetty example can be reached at port 81 (http://10.10.10.30:81/sample).

### Shutting down

The containers and Weave can be shut down with:

```
./stopTestboxes.sh
```

This also deletes the containers.
