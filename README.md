# Attendance Management Project - BITS Pilani - DDA - Semester 1 📋

# What works now ✔
- The Spring Boot Server, Angular JS Service & the MSSQL DB instance can now run on Docker.  
- Docker-Compose can be used to start a Server-DB-Frontend stack.  
- MSSQL 2019 DB starts with the sample data provided in the SQL file ([AttendanceDBScript.sql](db/AttendanceDBScript.sql)).  
- GitHub Action: Runs mvn test for every commit.  
- GitHub Action: Runs docker-compose build for every commit.  
- Created model (Entity) classes for all the DB Tables.  
- Created Repository Interfaces for all the Entities.  
- Swagger UI for all the endpoints accessible from the Spring Boot app are available.  

# What needs to be implemented 🚧
- Connect the Frontend to the Backend Server.  

# How to simply spin up the whole Application-Stack 🏃‍♂️
The following command will create an MSSQL Docker Container with the necessary DB for the project. Then it will start the Spring Boot project, which will be connected to the MSSQL Container instance. And finally starts the Angular JS frontend which connects to the Spring Boot backend and fetch the data from the same and show it in the UI.  

`docker-compose up -d`

# How to restart the App-Stack after making changes 🔁
The following command will delete all of the items related to any old compose and then recreate the whole containers from scratch. This can be used whenever you make a code change to the project.  

`docker-compose down && docker-compose build --no-cache && docker-compose up -d`

# How to start individual components 👀  
- To start only the MSSQL Database Server 🗃:  
`docker-compose up -d db-attendancemanagement-bits-sem-1`  
- To start only the Backend Java Spring Server ♨:  
`docker-compose up -d server-attendancemanagement-bits-sem-1`  
- To start only the Frontend Angular JS Server 😇:  
`docker-compose up -d frontend-attendancemanagement-bits-sem-1`  

# Steps to note when setting up a Dev Environment 👨‍🔬
1. Start the DB first using the compose script:  
`docker-compose up -d db-attendancemanagement-bits-sem-1`  
2. Make sure to add this line to your hosts file so that the Server knows how to contact the DB:  
`127.0.0.1 db-attendancemanagement-bits-sem-1`  
3. Now simply start your application (backend server) from your favorite IDE.  
4. You can finally start the frontend server using the `ng server` command.  

# Access the Application 🔗
Make sure that you have started the instances using the command(s) given above. Then, access the following URL for the Swagger UI:

`http://localhost:8080/swagger-ui/index.html`  

The Swagger UI shows a list of all the endpoints that can be accessed from the Spring Backend.  

To access the frontend Angular JS UI, go to the following URL:  

`http://localhost/index.html`