FROM openjdk:17-jdk-slim

WORKDIR /app

RUN mkdir -p /app && rm -f /app/revshop.jar 

COPY target/revshop-0.0.1-SNAPSHOT.jar revshop.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "revshop.jar"]
