
### launch.json
```json
 "env":{
            // Variables for the database                
            "POSTGRES_DB":"tasksdb",
                "POSTGRES_USER": "postgres_user",
                "POSTGRES_PASSWORD": "SuperSecret",
            
            // Variables for api in container
                "TODO_API_VERSION": "v1",
                "APPLICATION_PORT": 8080,
                "SPRING_DATASOURCE_USERNAME": "postgres_user",
                "SPRING_DATASOURCE_PASSWORD": "SuperSecret",
                "SPRING_DATASOURCE_URL": "jdbc:postgresql://localhost:5432/tasksdb",
                "IS_FORMAT_SQL": true,
                "IS_SHOW_SQL": true,
                "HOW_ANSI_OUTPUT_IS_ENABLED":"ALWAYS"
            }
```


### settings.json
```json    
 "maven.terminal.customEnv": [       
        {
            "environmentVariable": "POSTGRES_DB",
            "value": "tasksdb"
        },
        {
            "environmentVariable": "POSTGRES_USER",
            "value": "postgres_user"
        },
        {
            "environmentVariable": "POSTGRES_PASSWORD",
            "value": "SuperSecret"
        },        
        {
            "environmentVariable": "TODO_API_VERSION",
            "value": "v1"
        },
        {
            "environmentVariable": "APPLICATION_PORT",
            "value": "8080"
        },
        {
            "environmentVariable": "SPRING_DATASOURCE_USERNAME",
            "value": "postgres_user"
        },
        {
            "environmentVariable": "SPRING_DATASOURCE_PASSWORD",
            "value": "SuperSecret"
        },
        {
            "environmentVariable": "SPRING_DATASOURCE_URL",
            "value": "jdbc:postgresql://localhost:5432/tasksdb"
        },
        {
            "environmentVariable": "IS_FORMAT_SQL",
            "value": "true"
        },
        {
            "environmentVariable": "IS_SHOW_SQL",
            "value": "true"
        },
        {
            "environmentVariable": "HOW_ANSI_OUTPUT_IS_ENABLED",
            "value": "ALWAYS"
        }        
    ]
```