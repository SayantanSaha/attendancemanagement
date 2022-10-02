# This Dockerfile is to build the Server

# docker build -t anushibin007/server-attendancemanagement-bits-sem-1:latest .
# docker run -itd -p1433:1433 --name server-attendancemanagement-bits-sem-1 anushibin007/server-attendancemanagement-bits-sem-1:latest

### Step 1: Build ###
FROM maven:latest AS stager

WORKDIR /root/mm

COPY . .

RUN mvn package

### Step 2: Deploy ###
FROM openjdk AS main

WORKDIR /root/mm

COPY --from=stager /root/mm/target/attendancemanagement-0.0.1-SNAPSHOT.jar .

CMD java -jar attendancemanagement-0.0.1-SNAPSHOT.jar

EXPOSE 8080

# Add Healthcheck to poll the app every 10 seconds
HEALTHCHECK --interval=10s --timeout=3s --start-period=30s --retries=10 \
CMD curl http://localhost:8080/health