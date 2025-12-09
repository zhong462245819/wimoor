FROM openjdk:8u342-slim-buster
WORKDIR /app
COPY target/*.jar admin.jar
EXPOSE 8100
ENTRYPOINT ["java", "-jar", "/app/admin.jar"]
