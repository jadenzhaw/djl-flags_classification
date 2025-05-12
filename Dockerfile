# Usage
# docker build -t tutti112/djl-flags-classification .
# docker run --name djl-flags-classification -p 8080:8080 -d tutti112/djl-flags-classification

FROM openjdk:21-jdk-slim

# Copy Files
WORKDIR /usr/src/app

COPY models models
COPY src src
COPY .mvn .mvn
COPY pom.xml mvnw ./

# Fix Windows line endings and make mvnw executable
RUN sed -i 's/\r$//' mvnw
RUN chmod +x mvnw

# Build the JAR
RUN ./mvnw -Dmaven.test.skip=true package

# Run the application
EXPOSE 8080
CMD ["java", "-jar", "/usr/src/app/target/playground-0.0.1-SNAPSHOT.jar"]
