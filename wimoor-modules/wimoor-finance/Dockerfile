FROM eclipse-temurin:8u472-b08-jre-ubi9-minimal
WORKDIR /app
COPY target/*.jar finance.jar
EXPOSE 8106
ENTRYPOINT ["java", "-jar", "finance.jar"]
