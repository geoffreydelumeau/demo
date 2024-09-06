# Étape 1: Construction
FROM gradle:8.10-jdk17 AS build

WORKDIR /app

# Copiez le fichier de build Gradle et les sources
COPY build.gradle settings.gradle /app/
COPY src /app/src

# Construisez l'application
RUN gradle build --no-daemon

# Étape 2: Création de l'image finale
FROM openjdk:17-jdk-alpine

WORKDIR /app

# Copiez le JAR construit depuis l'étape de construction
COPY --from=build /app/build/libs/*.jar cicd.jar

EXPOSE 80

CMD ["java", "-jar", "cicd.jar", "--server.port=80"]