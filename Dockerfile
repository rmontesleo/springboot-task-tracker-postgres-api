FROM eclipse-temurin:17-jdk-alpine as base
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw
RUN ./mvnw dependency:resolve
CMD src ./src

FROM base as test
CMD [ "./mvnw", "test" ]

FROM base as development
CMD [ "./mvnw", "spring-boot:run" ]

FROM base as build
RUN ./mvnw clean  -DskipTests=true package


FROM eclipse-temurin:17-jre-alpine as production
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
EXPOSE 8080
COPY --from=build /app/target/springboot-task-tracker-postgres-docker.jar /home/spring/springboot-task-tracker-postgres-docker.jar
ENTRYPOINT [ "java", "-jar", "/home/spring/springboot-task-tracker-postgres-docker.jar" ]


FROM eclipse-temurin:17-jre-alpine as demo
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
EXPOSE 8080
COPY target/springboot-task-tracker-postgres-docker.jar /home/spring/springboot-task-tracker-postgres-docker.jar
ENTRYPOINT [ "java", "-jar", "/home/spring/springboot-task-tracker-postgres-docker.jar" ]

