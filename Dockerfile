# FROM openjdk:11-jdk-slim

# ARG JAR_FILE=myapp/target/myapp-1.0.0.jar

# WORKDIR /myapp


# COPY ${JAR_FILE} app.jar

# USER 1000

# CMD ["java", "-jar", "app.jar"]

# Stage 1: Build Stage
FROM maven:3.8.5-openjdk-11-slim AS builder

# Set the working directory
WORKDIR /myapp

# Copy only the necessary files
COPY myapp/pom.xml ./pom.xml
COPY myapp/src ./src

# Build the application and package it into a .jar file
RUN mvn clean package -DskipTests

# Stage 2: Production Stage
FROM openjdk:11-jdk-slim

# Set a non-root user
USER 1000

# Set the working directory inside the container
WORKDIR /myapp

# Copy only the packaged .jar file from the builder stage
COPY --from=builder /myapp/target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
