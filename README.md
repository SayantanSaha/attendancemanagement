# Attendance Management Project - BITS Pilani - DDA - Semester 1

# What works now:
✔ Both the Spring Boot Server & the MSSQL DB instance run on Docker.  
✔ Docker-Compose can be used to start a Server-DB stack.  
✔ MSSQL 2019 DB starts with the sample data provided in the SQL file ([AttendanceDBScript.sql](db/AttendanceDBScript.sql)).  
✔ A sample endpoint (/attendances) that shows the data in the `Attendance` table.
✔ A sample Controller, Entity & Model class.

# What needs to be implemented:
🚧 Create model (Entity) classes for all the DB Tables.  
🚧 Create Repository Interfaces for all the Entities.  

# How to run:
The following command will create an MSSQL Docker Container with the necessary DB for the project. Then it will start the Spring Boot project, which will be connected to the MSSQL Container instance.

`docker-compose up -d`

# How to restart after making changes:
The following command will delete all of the items related to any old compose and then recreate the whole containers from scratch. This can be used whenever you make a code change to the project.

`docker-compose down && docker-compose up -d`

# Access the test URL:
Make sure that you have started the instances using the command(s) given above. Then, the following test URL will show the entries in the `Attendance` table in the DB:

`http://localhost:8080/attendances`