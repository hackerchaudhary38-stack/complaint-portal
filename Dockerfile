FROM tomcat:10.1.8-jdk17

# Remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy WAR
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Fix PORT binding for Render
RUN sed -i 's/port="8080"/port="${PORT}"/' /usr/local/tomcat/conf/server.xml

# CRITICAL FIX: bind to 0.0.0.0
RUN sed -i 's/address="localhost"/address="0.0.0.0"/' /usr/local/tomcat/conf/server.xml || true

EXPOSE 8080

CMD ["catalina.sh", "run"]
