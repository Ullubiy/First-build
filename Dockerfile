FROM ubuntu:latest
#WORKDIR /home/app 
RUN  apt-get update
RUN  apt-get install default-jdk -y
RUN  apt-get install tomcat9 -y
RUN  apt-get install maven -y
RUN  apt-get install git -y
RUN  git clone https://github.com/Ullubiy/First-build.git
RUN  mvn package --f /First-build/pom.xml
#COPY  /First-build/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
RUN cp /First-build/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
EXPOSE 8080
ENTRYPOINT ["java","-war","/var/lib/tomcat9/webapps/hello.war"]