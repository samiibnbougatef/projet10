FROM openjdk
COPY target/monitoring-0.0.1-SNAPSHOT.jar monitoring-0.0.1-SNAPSHOT.jar
ENTRYPOINT [ "java", "-jar", "monitoring-0.0.1-SNAPSHOT.jar" ]
