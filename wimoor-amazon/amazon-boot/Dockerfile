FROM openjdk:8u342-slim-buster
WORKDIR /app
COPY target/*.jar amazon.jar
EXPOSE 8102
ENTRYPOINT ["java", "-jar", "amazon.jar"]
