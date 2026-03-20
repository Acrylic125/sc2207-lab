FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=YourStrong!Passw0rd

# Copy SQL files
COPY create-table.sql /scripts/create-table.sql
COPY seed-table.sql /scripts/seed-table.sql
COPY entrypoint.sh /entrypoint.sh

# Give permission
USER root
RUN chmod +x /entrypoint.sh

# Switch back to mssql user
USER mssql

ENTRYPOINT ["/entrypoint.sh"]
