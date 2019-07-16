FROM centos:7

ARG USER=jenkins
ARG UID=10000
ARG GID=10000
ARG PW=jenkins

RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd

RUN yum -y install epel-release
RUN yum -y install nodejs
RUN yum -y install git
RUN yum -y install initscripts
RUN yum -y install openssh-server

COPY coba.js /home/jenkins/coba.js

ENTRYPOINT ["/usr/sbin/init"]
CMD ["service sshd start"]
CMD ["/usr/sbin/init"]
#USER ${UID}:${GID}
#WORKDIR /home/${USER}
