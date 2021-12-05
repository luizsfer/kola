FROM maven:3.6-jdk-8-alpine AS builder

WORKDIR /build
COPY . /build

RUN mvn clean package

FROM openjdk:8-jre-alpine
COPY --from=builder /build/target/*.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar", "-Ddebug", "-Xmx128m"]