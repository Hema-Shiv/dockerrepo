FROM maven:3.8.4-jdk-8

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn package

CMD ["java", "-jar", "/app/target/myapp.jar"]

