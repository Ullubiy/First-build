FROM ubuntu:latest
WORKDIR /home/app 
RUN  apt-get update
RUN  apt-get install default-jdk -y
RUN  apt-get install tomcat9 -y
RUN  apt-get install maven -y
RUN  mvn --f /home/app/pom.xml
COPY  /home/app/target/hello.war /var/lib/tomcat9/webapps/hello.war
EXPOSE 8080
ENTRYPOINT ["java","-war","/var/lib/tomcat9/webapps/hello.war"]