FROM openjdk:17-jdk-alpine
ADD target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 7081
ENTRYPOINT ["java", "-jar", "/demo.jar"]
