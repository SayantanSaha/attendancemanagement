# This Dockerfile is to build the DB

# docker build -t anushibin007/db-attendancemanagement-bits-sem-1:2019-CU4-ubuntu-16.04 .
# docker run -itd -p1433:1433 --name db-attendancemanagement-bits-sem-1 anushibin007/db-attendancemanagement-bits-sem-1:2019-CU4-ubuntu-16.04

# Pull the base MS Docker Image from the official Microsoft repo
FROM mcr.microsoft.com/mssql/server:2019-CU4-ubuntu-16.04

# Let's use the root user to do all our operations.
# Security is the least of our concerns for now.
USER root

# Set a few environment variables
ENV HOME=/root \
    ACCEPT_EULA=Y \
    SA_PASSWORD=Password@123

# Set the root location where the SQL scripts
# need to be stored.
ENV SCRIPTS_HOME=$HOME/sql_scripts

# Set the default shell as BASH
SHELL ["/bin/bash", "-c"]

# Copy the script into the image
COPY AttendanceDBScript.sql $SCRIPTS_HOME/AttendanceDBScript.sql

# Execute the SQL script(s) into one of the layers of the image
RUN /opt/mssql/bin/sqlservr > $HOME/sqlservr.out & \
(tail -f $HOME/sqlservr.out &) | grep -q "SQL Server is now ready" && \
sleep 10 && \
/opt/mssql-tools/bin/sqlcmd -U sa -P Password@123 -i $SCRIPTS_HOME/AttendanceDBScript.sql

# Perform a HEALTHCHECK operation by doing a simple DB query every 10 seconds
HEALTHCHECK --interval=10s --timeout=3s --start-period=10s --retries=10 \
    CMD /opt/mssql-tools/bin/sqlcmd -U sa -P $SA_PASSWORD -Q "SELECT 1" || exit 1
