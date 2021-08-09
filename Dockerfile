FROM fedora:31
WORKDIR /
MAINTAINER jodyscott

ADD kubernetes.repo /etc/yum.repos.d/kubernetes.repo
RUN chmod 644 /etc/yum.repos.d/kubernetes.repo

RUN dnf -y update
RUN dnf -y install bind-utils jq net-tools procps iproute kubectl

ADD stupid-curl /usr/bin/stupid-curl
RUN chmod +x /usr/bin/stupid-curl

RUN curl -L -o /usr/sbin/stupid-http https://github.com/jodydadescott/stupid-httpd/releases/download/v1-linux/stupid-http
RUN chmod +x /usr/sbin/stupid-http

ADD entrypoint.sh /
RUN chmod 755 /entrypoint.sh

CMD ["/entrypoint.sh"]
