# BUILD
FROM maven:adoptopenjdk as build

WORKDIR /home/lab

COPY pom.xml .
RUN mvn verify -DskipTests --fail-never

COPY src ./src
RUN mvn verify

# RUN
FROM adoptopenjdk:8-jre

ENTRYPOINT ["java", "-Xmx8m", "-Xms8m", "-jar", "/app/words.jar"]
EXPOSE 8080

WORKDIR /app
COPY --from=build /home/lab/target .
