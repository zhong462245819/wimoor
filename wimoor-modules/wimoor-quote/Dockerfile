FROM openjdk:8u342-slim-buster
WORKDIR /app
COPY target/*.jar quote.jar
EXPOSE 8105
ENTRYPOINT ["java", "-jar", "quote.jar"]
