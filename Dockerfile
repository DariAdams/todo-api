# Use OpenJDK 17
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Install Maven and download dependencies
RUN apt-get update && apt-get install -y maven && mvn dependency:go-offline -B

# Build the application
RUN mvn clean package -DskipTests

# Expose the port
EXPOSE 10000

# Run the application
CMD ["java", "-jar", "target/todo-api-1.0.0.jar"]
