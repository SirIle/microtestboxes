docker run -p 8500:8500 -h consul -d --name consul --volumes-from basefilebox sirile/consulbox
docker run --volumes-from basefilebox -d --volumes-from nodefilebox --link consul:consul -h nodebox --name nodebox --dns 127.0.0.1 -p 80:80 sirile/nodeboxtest
docker run --volumes-from basefilebox -d --volumes-from java8filebox --volumes-from jettyfilebox -e DC=west --link consul:consul -h jettybox --name jettybox --dns 127.0.0.1 -p 81:80 sirile/jettyboxtest
docker run --volume=/:/rootfs:ro -d --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8080:8080 --detach=true --name=cadvisor google/cadvisor:latest
