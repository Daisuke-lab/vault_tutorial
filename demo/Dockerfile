FROM maven:3.8.3-openjdk-17

RUN mkdir -p /root/workspace/src
RUN mkdir -p /root/deployment
COPY src/ /root/workspace/src/
COPY ./pom.xml /root/workspace/pom.xml
RUN cd /root/workspace && mvn clean install
RUN mv /root/workspace/target/demo*.jar /root/deployment/demo-1.0.0.jar
RUN ls /root/deployment/demo-1.0.0.jar
RUN rm -rf /root/workspace
RUN rm -rf /root/.m2
EXPOSE 8080
CMD cd /root/deployment && java -jar demo-1.0.0.jar