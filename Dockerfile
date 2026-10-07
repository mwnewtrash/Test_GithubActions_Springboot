FROM eclipse-temurin:8-jre

WORKDIR /app

RUN useradd --system --uid 10001 --create-home appuser

COPY target/*.jar app.jar

RUN chown appuser:appuser /app/app.jar

USER 10001

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]
