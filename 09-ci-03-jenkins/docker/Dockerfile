FROM pycontribs/centos:7

RUN yum update -y && yum install -y java-1.8.0-openjdk-devel python3 python3-pip
RUN pip3 install -U pip
RUN pip3 install "ansible<3.0.0"