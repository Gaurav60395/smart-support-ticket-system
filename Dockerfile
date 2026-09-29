# ==============================================================================
# Stage 1: Build Stage
# ==============================================================================
FROM eclipse-temurin:21-jdk-alpine AS builder

WORKDIR /app

# Copy Maven wrapper and POM to leverage Docker layer caching for dependencies
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

# Make Maven wrapper script executable and resolve dependencies offline
RUN chmod +x mvnw && ./mvnw dependency:go-offline -B

# Copy application source code
COPY src ./src

# Build the application executable JAR skipping tests (tests run in prior CI step)
RUN ./mvnw clean package -DskipTests -B

# ==============================================================================
# Stage 2: Runtime Stage
# ==============================================================================
FROM eclipse-temurin:21-jre-alpine AS runtime

WORKDIR /app

# Create a dedicated non-root system group and user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy built JAR artifact from builder stage
COPY --from=builder /app/target/smart-support-ticket-system-*.jar app.jar

# Set correct ownership for non-root runtime user
RUN chown appuser:appgroup app.jar

# Switch to non-root user
USER appuser

# Expose application port (matches server.port=8082 in application.properties)
EXPOSE 8082

# Production-safe container-aware JVM flags
ENV JAVA_OPTS="-XX:+UseG1GC -XX:MaxRAMPercentage=75.0"

# Exec form ENTRYPOINT invoking Java runtime
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
