FROM ubuntu:14.04

MAINTAINER Piotr Mroczek <Piotr.Mroczek@ocelotit.pl>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&  apt-get install -y curl 
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && sudo apt-get install -y nodejs
RUN apt-get install -y python
RUN apt-get install -y build-essential
RUN sudo npm install -g browser-sync

VOLUME ["/root/www"]

COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

EXPOSE 3001
EXPOSE 3000


ENTRYPOINT ["/root/entrypoint.sh"]
