FROM openjdk:16-jdk-alpine AS build
COPY --from=build /target/whiteboard-lms.jar demo.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","demo.jar"]