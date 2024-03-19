# Stage 1: Build and test the application
FROM maven:3.6.3-openjdk-11 as builder

#setting the working dir 
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Compile the application and run tests
RUN mvn clean package

# Stage 2: Create the final Docker image
FROM openjdk:11-jre-slim

WORKDIR /app

# Create a non-root user
RUN groupadd -r appuser && useradd --no-log-init -r -g appuser appuser

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Use the non-root user to run the application
USER appuser

# Expose application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
