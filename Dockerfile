# (C) by Alisa Shilkova, 2023

# Кэш (для быстроты перезапуска сборки)

FROM openjdk:latest as deps

WORKDIR /opt/app

COPY mvnw mvnw
COPY pom.xml pom.xml
COPY .mvn .mvn

COPY api-doc/pom.xml api-doc/pom.xml
COPY event-logger/pom.xml event-logger/pom.xml
COPY integration-tests/pom.xml integration-tests/pom.xml
COPY service/pom.xml service/pom.xml
COPY websocket-resources/pom.xml   websocket-resources/pom.xml

RUN ./mvnw -B -e org.apache.maven.plugins:maven-dependency-plugin:3.5.0:go-offline

# Сборка проекта

FROM openjdk:latest as builder

WORKDIR /opt/app

COPY --from=deps /opt/app /opt/app

COPY api-doc/src/ /opt/app/api-doc/src/
COPY event-logger/src/ /opt/app/event-logger/src/
COPY integration-tests/src/ /opt/app/integration-tests/src/
COPY service/src/ /opt/app/service/src/
COPY websocket-resources/src/ /opt/app/websocket-resources/src/

RUN ./mvnw -B -e package -DskipTests=true

# Копирование .jar файла приложения, полученного в ходе сборки, в /opt/app контейнера

FROM openjdk:latest
WORKDIR /opt/app
COPY --from=builder /opt/app/service/target/TextSecureServer-0.0.0-NOT_A_GIT_REPOSITORY.jar .

EXPOSE 8080

# ENTRYPOINT [ "sleep", "1000" ]
ENTRYPOINT [ "executable" ] [ "java", "-jar", "/opt/app/TextSecureServer-0.0.0-NOT_A_GIT_REPOSITORY.jar" ]
