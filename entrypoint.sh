#!/bin/bash

/opt/mssql/bin/sqlservr &

echo "Waiting for SQL Server..."

until /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -C -Q "SELECT 1" &> /dev/null
do
  sleep 2
done

echo "Running create-table.sql..."
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -C -i /scripts/create-table.sql

echo "Running seed-table.sql..."
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -C -i /scripts/seed-table.sql

wait
