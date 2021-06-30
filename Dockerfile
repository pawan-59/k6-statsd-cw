FROM centos:latest

RUN yum install https://s3.amazonaws.com/amazoncloudwatch-agent/redhat/amd64/latest/amazon-cloudwatch-agent.rpm -y

RUN yum install https://dl.k6.io/rpm/repo.rpm -y
RUN yum install k6 -y


COPY script.js .

ENV RUN_IN_CONTAINER="True"
ADD start.sh .
RUN chmod +x start.sh
ENTRYPOINT [ "/bin/bash", "start.sh" ]
CMD [ "script.js" ]
