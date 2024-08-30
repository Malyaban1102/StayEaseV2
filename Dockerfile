# Stage 1: Build the application using Gradle
FROM gradle:8.0.0-jdk17 AS build
WORKDIR /app

# Copy Gradle project files
COPY build.gradle settings.gradle ./
COPY gradle ./gradle
COPY src ./src

# Build the project
RUN gradle build --no-daemon

# Stage 2: Create a minimal image for running the Spring Boot application
FROM eclipse-temurin:17-jre-alpine

# Set working directory
WORKDIR /app

# Copy the built jar file from the previous stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose the port your application will run on
EXPOSE 8081

# Set environment variables for MySQL
ENV MYSQL_URL=jdbc:mysql://localhost:3306/stayease
ENV MYSQL_USERNAME=root
ENV MYSQL_PASSWORD=110220

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
