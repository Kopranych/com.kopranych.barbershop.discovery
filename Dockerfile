FROM gradle:6.6.0-jdk11 AS build

COPY build.gradle.kts /build/

COPY src /build/src/

WORKDIR /build/

RUN gradle build --no-daemon --stacktrace

FROM adoptopenjdk/openjdk11:latest

WORKDIR /app

COPY --from=build /build/build/libs/*.jar /app/discovery.jar

ENTRYPOINT exec java -Dspring.profiles.active=$PROFILE $JAVA_MEM $JAVA_EXT -jar discovery.jar
