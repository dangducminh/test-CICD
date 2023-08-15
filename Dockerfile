# Use a base image with Java 11 (OpenJDK 11)
FROM java:openjdk-8u111

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build directory to the container
COPY target/test-CICD-0.0.1-SNAPSHOT.jar test-CICD-0.0.1-SNAPSHOT.jar

# Install necessary tools and dependencies
RUN apt-get update && \
    apt-get install -y curl

# Install Docker inside the container
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh

# Cleanup
RUN rm get-docker.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Run Docker commands
CMD ["docker", "--version"]

# Expose the port that your Spring Boot application runs on
EXPOSE 8080

# Run the Spring Boot application when the container starts
CMD ["java", "-jar", "test-CICD-0.0.1-SNAPSHOT.jar"]
