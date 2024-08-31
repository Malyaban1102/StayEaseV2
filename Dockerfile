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
ENV MYSQL_DBNAME=defaultdb
ENV MYSQL_USERNAME=avnadmin
ENV MYSQL_PASSWORD=AVNS_MZr_8wtWWAd4T__Uazj
ENV MYSQL_URL=jdbc:mysql://mysql-2cb878c1-stayease.h.aivencloud.com
ENV MYSQL_PORT=12236

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
