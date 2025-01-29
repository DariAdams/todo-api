FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built JAR file
COPY target/todo-api-1.0.0.jar app.jar

# Expose the correct port
EXPOSE 10000

# Run the application
CMD ["java", "-jar", "app.jar"]
