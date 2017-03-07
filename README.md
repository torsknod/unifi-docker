# unifi-docker
Ubiquiti Networks (UBNT) UniFi Controller for Ubuntu Linux Docker Container

This [docker](http://www.docker.com) container is currently work in progress and my docker learning curve is still very steep.
So I am very open to patches and pull requests to improve the docker-compose.yml and Dockerfile.
Currently you will have to create the initial content of the data and log directory from a non-docker/ normal installation.
Please also check the open issues.

To use the docker container, check out the directory and run:
```bash
mkdir data log
docker-compose up
```
