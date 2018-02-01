FROM tomcat
MAINTAINER sd1620597
ADD target/ShiyanlouPhoto-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/test.war
CMD ["catalina.sh", "run"]
