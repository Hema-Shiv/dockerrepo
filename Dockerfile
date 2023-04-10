FROM maven:3.8.4-jdk-8 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn package

FROM tomcat:8.0-alpine

WORKDIR /usr/local/tomcat/webapps

COPY --from=build  /app/target/MyWebApp.war .

EXPOSE 8080

CMD ["catalina.sh", "run"]


