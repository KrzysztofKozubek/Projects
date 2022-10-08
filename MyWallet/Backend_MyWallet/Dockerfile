FROM openjdk:17-jdk-slim-buster
WORKDIR /app
COPY build/libs/kk-wallet.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
