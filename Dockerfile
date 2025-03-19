FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/revshop-0.0.1-SNAPSHOT.jar app/revshop.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "revshop.jar"]
