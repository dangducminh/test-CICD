# Use a base image with Java 11 (OpenJDK 11)
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build directory to the container
COPY target/test-CICD-0.0.1-SNAPSHOT.jar test-CICD-0.0.1-SNAPSHOT.jar

# Expose the port that your Spring Boot application runs on
EXPOSE 8080

# Run the Spring Boot application when the container starts
CMD ["java", "-jar", "test-CICD-0.0.1-SNAPSHOT.jar"]
