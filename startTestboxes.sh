sudo weave launch
sudo weave run 10.0.1.1/22 -p 8500:8500 -h consul -e DC=west --name consul --volumes-from basefilebox sirile/consulbox
sudo weave run 10.0.1.2/22 --volumes-from basefilebox --volumes-from nodefilebox -e DC=west --link consul:consul -h nodebox --name nodebox --dns 127.0.0.1 -p 80:80 sirile/nodejstestbox
sudo weave run 10.0.1.3/22 --volumes-from basefilebox --volumes-from java8filebox --volumes-from jettyfilebox -e DC=west --link consul:consul -h jettybox --name jettybox --dns 127.0.0.1 -p 81:80 sirile/jettytestbox
sudo weave run 10.0.1.4/22 --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8080:8080 --name=cadvisor google/cadvisor:latest
