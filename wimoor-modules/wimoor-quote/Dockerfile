FROM openjdk:8
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8105
ENTRYPOINT ["java", "-jar", "app.jar"]
