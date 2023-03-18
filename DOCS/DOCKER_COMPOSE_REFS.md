

###
```bash
POSTGRES_USER=postgres_user
POSTGRES_PASSWORD=SuperSecret
POSTGRES_DB=tasksdb

PGADMIN_DEFAULT_EMAIL=user@domain.com
PGADMIN_DEFAULT_PASSWORD=pgadminpassword
```


###
```yaml
version: '3.7'

services:
  postgres:    
    volumes:
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
      - springboot-task-tracker-postgres-api-db-volume:/var/lib/posgresql/data
    environment:
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
      - POSTGRES_DB=${POSTGRES_DB}
    healthcheck:
      test: [ "CMD", "pg_isready", "-q", "-d", "${POSTGRES_DB}", "-U", "${POSTGRES_USER}" ] 

  pgadmin:    
    volumes:
      - springboot-task-tracker-postgres-api-pgadmin-volume:/var/lib/pgadmin
    environment:
      - PGADMIN_DEFAULT_EMAIL=${PGADMIN_DEFAULT_EMAIL}
      - PGADMIN_DEFAULT_PASSWORD=${PGADMIN_DEFAULT_PASSWORD}


```