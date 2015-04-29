# FROM debian:8
# ENV DISTRO debian/jessie
FROM ubuntu:14.04
ENV DISTRO ubuntu/trusty

MAINTAINER Joseph Anthony Pasquale Holsten <joseph@josephholsten.com>

ENV DEBIAN_FRONTEND noninteractive
ENV PACKAGECLOUD_TOKEN 12c9500d93d4336ebe61b39ddc9f7690027376026b98e414

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get -q update \
&&  apt-get -qy --no-install-recommends install \
			build-essential \
			bundler \
			git \
			golang \
			rake \
			ruby-dev \
&&  gem install --no-rdoc --no-ri \
			fpm \
			package_cloud \
&&  apt-get -qy clean autoclean autoremove \
&&  rm -rf /var/lib/{apt,dpkg,cache,log}/ \
&&  mkdir -p /go

ENV GOPATH /go

VOLUME /opt/src
WORKDIR /opt/src

CMD ["push"]
ENTRYPOINT ["rake"]
