FROM maven:3.8.4-openjdk-11 AS build
#set work dir
WORKDIR /app
# Copy the project files into the container
COPY . .
# Build the Maven project should be configured
RUN mvn clean install
# Use an official Tomcat image as the base image for runtime
FROM tomcat:8-jdk11-openjdk-slim
# Set the working directory in the Tomcat container
WORKDIR /usr/local/tomcat/webapps/
# Copy the WAR file from the build stage to the Tomcat container
COPY --from=build /app/target/*.war ./ROOT.war
# Expose the default Tomcat port
EXPOSE 8080
# Start Tomcat
CMD ["catalina.sh", "run"] 
