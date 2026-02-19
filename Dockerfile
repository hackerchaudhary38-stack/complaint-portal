FROM tomcat:10.1.8-jdk17

# Remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy ROOT.war
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Set Tomcat to use Render PORT
ENV CATALINA_OPTS="-Dserver.port=${PORT}"

EXPOSE 8080

CMD ["catalina.sh", "run"]
