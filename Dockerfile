FROM ubuntu:latest
RUN  apt-get update
RUN  apt-get install default-jdk
RUN  apt-get install tomcat9
RUN  apt-get install maven
RUN  mvn package
COPY  *.war /var/lib/tomcat9/webapps/
EXPOSE 8080