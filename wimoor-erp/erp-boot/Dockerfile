FROM openjdk:8u342-slim-buster
WORKDIR /app
COPY target/*.jar erp.jar
EXPOSE 8101
ENTRYPOINT ["java", "-jar", "/app/erp.jar"]
