FROM xiahoufeng/zookeeper

MAINTAINER xiahoufeng
RUN echo "root:test123456" | chpasswd
RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
