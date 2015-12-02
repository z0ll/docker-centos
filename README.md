Docker CentOS
===
A docker image for CentOS running sshd and Docker

Based on [tutum/centos](https://hub.docker.com/r/tutum/centos/) and [docker:dind](https://hub.docker.com/_/docker/).

Useful when you would like to for example test deploy scripts against a CentOS server utilizing ssh and having your applications running in Docker.

Usage:

```docker run --privileged=true -p 2222:22 -e ROOT_PASS="mypass" sgfinans/centos```

You are now able to ssh into your container like so ```ssh -p 2222 root@<docker-ip>```
