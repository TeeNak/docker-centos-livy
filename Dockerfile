FROM teenak/centos-cdh-spark-client
MAINTAINER Taishun Nakatani <teenak77@gmail.com>

RUN yum install -y unzip

RUN mkdir -p /opt/cloudera
RUN cd ~
RUN curl -O http://archive.cloudera.com/beta/livy/livy-server-0.2.0.zip
RUN unzip livy-server-0.2.0.zip -d /opt/cloudera
RUN rm -f livy-server-0.2.0.zip
RUN cd /opt/cloudera && ln -s livy-server-0.2.0 livy-server

ADD log4j.properties /opt/cloudera/livy-server/conf
RUN mkdir -p /var/log/livy

# update boot script
COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

EXPOSE 8998

ENTRYPOINT ["/etc/bootstrap.sh"]
