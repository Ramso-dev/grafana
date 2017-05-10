FROM registry.access.redhat.com/rhel7.2:latest
MAINTAINER Matthias Burghardt <matthias.burghardt@cloudwerkstatt.com>

USER root
EXPOSE 3000

ENV GRAFANA_VERSION="4.1.1" \
    GRAFANA_BUILD="1484211277"

ADD root /
ADD custom.ini /etc/grafana/

RUN yum -y install https://grafanarel.s3.amazonaws.com/builds/grafana-"$GRAFANA_VERSION"-"$GRAFANA_BUILD".x86_64.rpm \
    && yum clean all
COPY run.sh /usr/share/grafana/
RUN chmod 755 /usr/bin/fix-permissions && chmod 755 /usr/share/grafana/run.sh
RUN /usr/bin/fix-permissions /usr/share/grafana \
    && /usr/bin/fix-permissions /etc/grafana \
    && /usr/bin/fix-permissions /var/lib/grafana \
    && /usr/bin/fix-permissions /var/log/grafana 

WORKDIR /usr/share/grafana
ENTRYPOINT ["./run.sh"]