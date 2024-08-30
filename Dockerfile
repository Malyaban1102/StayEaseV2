# Stage 1: Build the application using Gradle
FROM gradle:7.2.0-jdk17 AS build
WORKDIR /app

# Copy Gradle project files
COPY . .

RUN chmod +x ./gradlew

# Build the project
RUN ./gradlew clean build -x test


# Stage 2: Create a minimal image for running the Spring Boot application
FROM openjdk:17.0.1-jdk-slim

# Set working directory
WORKDIR /app

# Copy the built jar file from the previous stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose the port your application will run on
EXPOSE 8081

# Set environment variables for MySQL
ARG MYSQL_DBNAME
ARG MYSQL_USERNAME
ARG MYSQL_PASSWORD
ARG MYSQL_URL
ARG MySQL_PORT

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
