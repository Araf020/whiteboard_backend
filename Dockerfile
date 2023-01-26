FROM maven:4.0.0-jdk-16 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#

FROM openjdk:16-jdk-alpine
COPY --from=build /target/whiteboard-lms.jar demo.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","demo.jar"]