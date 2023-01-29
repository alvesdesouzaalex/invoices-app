FROM openjdk:17-jdk-slim
VOLUME /tpm
ADD target/*.jar app.jar
EXPOSE 9090
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java", "-Dspring.profiles.active=local", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]