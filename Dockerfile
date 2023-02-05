FROM ubuntu:latest
RUN  apt install default-jdk
RUN  apt install tomcat9
RUN  apt install maven
RUN  mvn package
COPY  *.war /var/lib/tomcat9/webapps/
EXPOSE 8080