FROM openjdk:17.0-slim
COPY target/*.jar app-devops.jar
EXPOSE 80
LABEL authors="gdelumeau"

CMD ["java", "-jar", "app-devops.jar", "--server.port=80"]