FROM openjdk:17-jdk-slim
COPY target/demo-0.0.1-SNAPSHOT.jar /demo/demo.jar
EXPOSE 7082
ENTRYPOINT ["java", "-jar", "demo.jar"]
