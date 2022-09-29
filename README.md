# Attendance Management Project - BITS Pilani - DDA - Semester 1 📋

# What works now ✔
- Both the Spring Boot Server & the MSSQL DB instance run on Docker.  
- Docker-Compose can be used to start a Server-DB stack.  
- MSSQL 2019 DB starts with the sample data provided in the SQL file ([AttendanceDBScript.sql](db/AttendanceDBScript.sql)).  
- A sample endpoint (/attendances) that shows the data in the `Attendance` table.
- A sample Controller, Entity & Model class.
- GitHub Action: Runs mvn test for every commit.
- GitHub Action: Runs docker-compose build for every commit.

# What needs to be implemented 🚧
- Create model (Entity) classes for all the DB Tables.  
- Create Repository Interfaces for all the Entities.  

# How to simply spin up a Server 🏃‍♂️
The following command will create an MSSQL Docker Container with the necessary DB for the project. Then it will start the Spring Boot project, which will be connected to the MSSQL Container instance.

`docker-compose up -d`

# How to restart the Server after making changes 🔁
The following command will delete all of the items related to any old compose and then recreate the whole containers from scratch. This can be used whenever you make a code change to the project.

`docker-compose down && docker-compose build --no-cache && docker-compose up -d`

# Steps to note when setting up a Dev Environment
1. Start the DB first using the compose script:  
`docker-compose up -d db-attendancemanagement-bits-sem-1`  
2. Make sure to add this line to your hosts file so that the Server knows how to contact the DB:  
`127.0.0.1 db-attendancemanagement-bits-sem-1`  
3. Now simply start your application from your favorite IDE.  

# Access the test URL 🔗
Make sure that you have started the instances using the command(s) given above. Then, access the following URL for the Swagger UI:

`http://localhost:8080/swagger-ui/index.html`
