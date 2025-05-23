FROM maven AS buildstage
RUN mkdir /opt/Sai-Kiran_mindcircuit15d
WORKDIR /opt/Sai-Kiran_mindcircuit15d
COPY . .
RUN mvn clean install    ## artifact -- .war 

## tomcat deploy stage 
FROM tomcat 
WORKDIR webapps 
COPY --from=buildstage /opt/Sai-Kiran_mindcircuit15d/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
