FROM ubuntu:latest
#WORKDIR /home/app 
RUN  apt-get update
RUN  apt-get install default-jdk -y
RUN  apt install wget -y
RUN  wget -P opt/ https://downloads.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz 
RUN  cd opt/
RUN pwd
RUN ls
RUN  gunzip apache-tomcat-9.0.71.tar.gz
RUN pwd
RUN ls  
RUN  tar -xf apache-tomcat-9.0.71.tar
RUN pwd
RUN ls 
RUN  apt-get install maven -y
RUN  apt-get install git -y
RUN  mvn package --f /First-build/pom.xml
RUN  cp /First-build/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
EXPOSE 8080
CMD ["/opt/apache-tomcat-9.0.71/bin/catalina.sh", "run"]