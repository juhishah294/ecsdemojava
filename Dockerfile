FROM tomcat:8
# Take the war and copy to webapps of tomcat version 8
COPY target/*.war /usr/local/tomcat/webapps/dockeransible.war
