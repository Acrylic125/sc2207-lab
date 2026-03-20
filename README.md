# SC2207 Lab

## Using Docker
1. Build the image `docker build . -t sc2207:1.0`
1. Create container with image, `docker run -p 1433:1433 sc2207:1.0`
1. Run `docker ps` and copy the container id
1. Run `docker exec -it <container_id> /bin/bash` to access the container
1. Once inside, run `/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -C`
1. Run your query.

Example:
```sql
SELECT * FROM SUPPLY;
GO
```
