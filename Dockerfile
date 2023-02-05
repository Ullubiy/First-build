FROM ubuntu:latest
RUN sudo apt install default-jdk
RUN sudo apt install tomcat9
RUN sudo apt install maven
RUN sudo mvn package
COPY  *.war /var/lib/tomcat9/webapps/
EXPOSE 8080