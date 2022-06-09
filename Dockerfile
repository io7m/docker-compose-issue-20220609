FROM debian:11
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install tinyscheme
