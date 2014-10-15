FROM wurstmeister/base

MAINTAINER xiahoufeng

RUN echo "root:test123456" | chpasswd
ENV http_proxy http://m1-imci-dev00.m1:3128
ENV https_proxy https://m1-imci-dev00.m1:3128

RUN wget -q -O - http://people.apache.org/~ptgoetz/apache-storm-0.9.3-rc1/apache-storm-0.9.3-rc1.tar.gz | tar -xzf - -C /opt
ENV STORM_HOME /opt/apache-storm-0.9.3-rc1
RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN apt-get clean

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
