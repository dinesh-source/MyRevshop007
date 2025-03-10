FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/revshop-0.0.1-SNAPSHOT.jar Revshop.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "Revshop.jar"]
