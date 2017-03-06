FROM ubuntu:latest
ADD http://dl.ubnt.com/unifi/5.4.11/unifi_sysvinit_all.deb /tmp/
ENV DEBIAN_FRONTEND noninteractive
VOLUME /var/lib/unifi/ /var/log/
# Required --privileged: ufw logging medium && ufw default deny incoming && ufw default reject outgoing && ufw allow out domain,bootps,bootpc,syslog/udp && ufw allow out domain,smtp,smtps,ssmtp,syslog-tls/tcp && ufw allow in snmp,3478/udp && ufw allow in snmp,8080,8443,8880,8843/tcp && ufw enable
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y install binutils jsvc mongodb ufw && dpkg -i /tmp/unifi_sysvinit_all.deb && rm -f /tmp/unifi_sysvinit_all.deb && useradd --system --user-group --create-home unifi
WORKDIR /usr/lib/unifi
COPY unifi-healthcheck /usr/local/bin/
COPY rcS ufw unifi /etc/default/
HEALTHCHECK CMD /usr/local/bin/unifi-healthcheck
EXPOSE 3478 8080 8443 8880 8843
CMD ["/etc/init.d/unifi","start"]
USER unifi
