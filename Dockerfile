# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the Maven wrapper and pom.xml files
COPY pom.xml .

# Download dependencies
RUN apt-get update && apt-get install -y maven && mvn dependency:go-offline -B

# Copy the project files
COPY src ./src

# Build the application
RUN mvn clean package

# Expose the application's port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/todo-api-1.0.0.jar"]
