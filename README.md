# Attendance Management Project - BITS Pilani - DDA - Semester 1

# How to run:
The following command will create an MSSQL Docker Container with the necessary DB for the project. Then it will start the Spring Boot project, which will be connected to the MSSQL Container instance.

`docker-compose up -d`

# How to restart after making changes:
The following command will delete all of the items related to any old compose and then recreate the whole containers from scratch. This can be used whenever you make a code change to the project.

`docker-compose down && docker-compose up -d`

# Access the test URL:
Make sure that you have started the instances using the command(s) given above. Then, the following test URL will show the entries in the `Attendance` table in the DB:

`http://localhost:8080/attendances`