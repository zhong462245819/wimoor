FROM openjdk:8u342-slim-buster
WORKDIR /app
COPY target/*.jar data.jar
EXPOSE 8104
ENTRYPOINT ["java", "-jar", "data.jar"]
