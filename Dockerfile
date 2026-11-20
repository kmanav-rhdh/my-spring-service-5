FROM registry.access.redhat.com/ubi8/openjdk-11:1.11

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw && ./mvnw dependency:resolve

COPY src ./src

RUN ./mvnw package -DskipTests

ENV PORT 8080
EXPOSE 8080

CMD ["java", "-jar", "target/spring-boot-app-0.0.1-SNAPSHOT.jar"]
