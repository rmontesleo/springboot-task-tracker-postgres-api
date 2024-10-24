DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
    id  SERIAL PRIMARY KEY,    
    task_text VARCHAR(200) NOT NULL,
    task_day VARCHAR(200) NOT NULL,
    set_reminder BOOLEAN  DEFAULT false NOT NULL
);
