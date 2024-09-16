FROM openjdk:11-jre-slim
RUN useradd -u 10001 myuser
USER myuser
COPY myapp/target/myapp-*.jar /app.jar
RUN ls -l
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
# CMD ["java", "-jar", "app.jar"]

