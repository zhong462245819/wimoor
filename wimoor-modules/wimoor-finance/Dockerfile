FROM openjdk:8
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8106
ENTRYPOINT ["java", "-jar", "app.jar"]
