FROM eclipse-temurin:11-jre

WORKDIR /app

COPY target/*.jar app.jar

RUN useradd -m appuser

USER appuser

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
