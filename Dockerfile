FROM ubuntu:latest
#WORKDIR /home/app 
RUN  apt-get update
RUN  apt-get install default-jdk -y
RUN  apt install wget
RUN  apt instal tomcat9
RUN  apt-get install maven -y
RUN  apt-get install git -y
RUN  git clone https://github.com/Ullubiy/First-build.git
RUN  mvn package --f /First-build/pom.xml
RUN cp /First-build/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
RUN service tomcat9 start
EXPOSE 8080
CMD ["usr/share/tomcat9/bin/catalina.sh", "run"]