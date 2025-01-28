# Use OpenJDK 17 as base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .

# Install Maven and download dependencies
RUN apt-get update && apt-get install -y maven && mvn dependency:go-offline -B

# Copy the entire project source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Expose the port used by Spring Boot
EXPOSE 10000

# Run the application
CMD ["java", "-jar", "target/todo-api-1.0.0-SNAPSHOT.jar"]
