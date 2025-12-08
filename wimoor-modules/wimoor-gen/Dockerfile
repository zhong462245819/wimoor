FROM openjdk:8u342-slim-buster
WORKDIR /app
COPY target/*.jar gen.jar
EXPOSE 8107
ENTRYPOINT ["java", "-jar", "gen.jar"]
