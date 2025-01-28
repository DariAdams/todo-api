# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper and pom.xml files
COPY pom.xml .

# Install Maven and download dependencies
RUN apt-get update && apt-get install -y maven && mvn dependency:go-offline -B

# Copy the project files
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Expose the application port
EXPOSE 10000

# Run the application
CMD ["java", "-jar", "target/todo-api-1.0.0-SNAPSHOT.jar"]
