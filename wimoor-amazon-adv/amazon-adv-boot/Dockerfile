FROM openjdk:8u342-slim-buster
WORKDIR /app
COPY target/*.jar amazon-adv.jar
EXPOSE 8103
ENTRYPOINT ["java", "-jar", "amazon-adv.jar"]
