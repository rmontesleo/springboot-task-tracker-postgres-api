

###
```bash
POSTGRES_USER=postgres_user
POSTGRES_PASSWORD=SuperSecret
POSTGRES_DB=tasksdb

PGADMIN_DEFAULT_EMAIL=user@domain.com
PGADMIN_DEFAULT_PASSWORD=pgadminpassword

TODO_API_VERSION="v1"
APPLICATION_PORT=8080
SPRING_DATASOURCE_USERNAME="postgres_user"
SPRING_DATASOURCE_PASSWORD="SuperSecret"
SPRING_DATASOURCE_URL="jdbc:postgresql://postgres:5432/tasksdb"
IS_FORMAT_SQL=true
IS_SHOW_SQL=true
HOW_ANSI_OUTPUT_IS_ENABLED="ALWAYS"
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


```yaml
version: '3.7'

services:
  postgres:    
    volumes:
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
      - springboot-task-tracker-postgres-docker-db-volume:/var/lib/posgresql/data
    environment:
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
      - POSTGRES_DB=${POSTGRES_DB}
    healthcheck:
      test: [ "CMD", "pg_isready", "-q", "-d", "${POSTGRES_DB}", "-U", "${POSTGRES_USER}" ] 

  pgadmin:    
    volumes:
      - springboot-task-tracker-postgres-docker-pgadmin-volume:/var/lib/pgadmin
    environment:
      - PGADMIN_DEFAULT_EMAIL=${PGADMIN_DEFAULT_EMAIL}
      - PGADMIN_DEFAULT_PASSWORD=${PGADMIN_DEFAULT_PASSWORD}

  api:
    build: 
      context: .
      target: development
    profiles: ["backend"]
    depends_on:
      postgres:
        condition: service_healthy
    env_file:
      - .env
    environment:
      - SOME_API_VAR=SOME_API_VALUE
    volumes:
      - .:/app
    command: sh mvnw spring-boot:run

  repository:
    image: rmontesleo/springboot-task-tracker-postgres-docker:v1
    ports:
      - "9090-9095:8080"
    profiles: [ "repository" ]       
    depends_on:
      postgres:
        condition: service_healthy
    env_file:
      - .env
```