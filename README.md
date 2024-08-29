# Overview
A RESTful API service built using Spring Boot provides endpoints for mapping users,hottels and bookings while using MySQL to persist the data.

# Features
* Authentication and Authorization : Implemented using Bearer token with three roles: CUSTOMER, MANAGER and ADMIN.
* User management:
  + User registration with email, password (encrypted using BCrypt), first name, last name, and role.
  + User login using email and password.
* Hotel management:
  + Store and manage Hotel details such as name,location,description and available rooms.
  + Create, update and delete hotels.
* Booking management:
  + User will book a hotel with his user details and hotelId.

# Getting Started:
## Prerequisites:
* Java 17 or higher
* MySql
* Postman for API Testing

## Configuration:
1. Open the application.properties file located in src/main/resources directory.
2. Configure the MySQL database connection settings:
   
   spring.datasource.url = jdbc:mysql://localhost:3306/stayease
   
   spring.datasource.username = root
   
   spring.datasource.password = password

   Replace localhost, 3306, root and password with your MySQL host, port, username and password respectively.

   Save the changes to the application.properties file.

## Running the application:
Run the application using Gradle:
./gradlew bootrun

# API Endpoints

You can find the API endpoints and test them using the provided:  https://coder9-3654.postman.co/workspace/malyabans-apis~1b9033c8-103c-46cd-bd0a-3f90064cd0ff/request/36793359-96a9e70f-d740-4829-90c3-09832b553d09?action=share&creator=36793359&ctx=documentation


   
