FROM tomcat:10.1.8-jdk17

# Remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy ROOT.war
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Render provides PORT env variable, configure Tomcat to use it
RUN sed -i 's/port="8080"/port="${PORT}"/' /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]
