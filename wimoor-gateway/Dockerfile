FROM openjdk:8u342-slim-buster
WORKDIR /app
COPY target/*.jar gateway.jar
EXPOSE 8099
ENTRYPOINT ["java", "-jar", "gateway.jar"]
