# ---- Build Stage ----
FROM gradle:8.5-jdk21 AS build
WORKDIR /app

# Copy build files and source
COPY build.gradle settings.gradle gradle.properties gradlew /app/
COPY gradle /app/gradle
COPY src /app/src

# Copy certificate and import into Java truststore
COPY _.gradle.org.crt /usr/local/share/ca-certificates/my-cert.crt

RUN update-ca-certificates \
 && keytool -importcert -noprompt -trustcacerts \
    -alias customcert \
    -file /usr/local/share/ca-certificates/my-cert.crt \
    -keystore "$JAVA_HOME/lib/security/cacerts" \
    -storepass changeit

# Build the application
RUN ./gradlew build --no-daemon
RUN ./gradlew build --no-daemon && \
    rm -rf ~/.gradle/caches ~/.gradle/wrapper


# ---- Runtime Stage ----
FROM eclipse-temurin:21-jre-alpine
WORKDIR /opt

# Copy the built JAR
COPY --from=build /app/build/libs/*.jar app.jar

# Copy and trust the certificate in runtime image too
COPY _.gradle.org.crt /usr/local/share/ca-certificates/my-cert.crt
RUN update-ca-certificates \
 && keytool -importcert -noprompt -trustcacerts \
    -alias customcert \
    -file /usr/local/share/ca-certificates/my-cert.crt \
    -keystore "$JAVA_HOME/lib/security/cacerts" \
    -storepass changeit

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/app.jar"]
