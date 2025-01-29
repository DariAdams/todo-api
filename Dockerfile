# Use OpenJDK 17
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the Maven build JAR file
COPY target/todo-api-1.0.0.jar app.jar

# Expose the correct port
EXPOSE 10000

# Run the application
CMD ["java", "-jar", "app.jar"]
