FROM ubuntu:latest
WORKDIR /opt
RUN  apt-get update
RUN  apt-get install default-jdk -y
RUN  apt install wget -y
RUN  wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz 
RUN  pwd
RUN  ls
RUN  gunzip apache-tomcat-9.0.71.tar.gz
RUN  pwd
RUN  ls  
RUN  tar -xf apache-tomcat-9.0.71.tar
RUN  pwd
RUN  ls 
RUN  apt-get install maven -y
RUN  apt-get install git -y
RUN  git clone https://github.com/Ullubiy/First-build.git
RUN  mvn package --f /opt/First-build/pom.xml
RUN  pwd
RUN  ls
#COPY First-build/target/hello-1.0.war  apache-tomcat-9.0.71/webapps/
RUN cp -avr /opt/First-build/target/hello-1.0.war /opt/apache-tomcat-9.0.71/webapps/
RUN  pwd
RUN  ls
RUN chmod +x apache-tomcat-9.0.71/bin/startup.bat
RUN ls apache-tomcat-9.0.71/webapps/
RUN  /opt/apache-tomcat-9.0.71/bin/startup.bat 
EXPOSE 8080
CMD ["/opt/apache-tomcat-9.0.71/bin/catalina.sh", "run"]