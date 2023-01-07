# Build stage
FROM --platform=${BUILDPLATFORM} maven:3-amazoncorretto-17 as build
WORKDIR /home/lab

COPY pom.xml .
RUN mvn verify -DskipTests --fail-never

COPY src ./src
RUN mvn verify

# Run stage
FROM --platform=${TARGETPLATFORM} amazoncorretto:17
WORKDIR /app
COPY --from=build /home/lab/target .
ENTRYPOINT ["java", "-Xmx8m", "-Xms8m", "-jar", "/app/words.jar"]
EXPOSE 8080
