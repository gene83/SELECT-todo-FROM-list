DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks
(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW() ,
  updated_at TIMESTAMP,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks 
DROP COLUMN completed,
ADD COLUMN completed_at TIMESTAMP DEFAULT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks
VALUES (
  default,
  'Study SQL',
  'Completed this exercise'
);

INSERT INTO tasks
VALUES (
  default, 
  'Study PostgreSQL',
  'Read all the documentation'
);

SELECT title
FROM tasks
WHERE completed_at is NULL;

UPDATE tasks
SET completed_at = NOW()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at = NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks
VALUES 
  (
    default, 
    'mistake 1',
    'a test entry'
  ),
  (
    default, 
    'mistake 2',
    'another test entry'
  ),
  (
    default,
    'third mistake',
    'another test entry'
  )
;

SELECT title
FROM tasks 
WHERE title ~ 'mistake';

DELETE FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks 
WHERE title ~ 'mistake';

DELETE FROM tasks 
WHERE title ~ 'mistake';

SELECT *
FROM tasks
ORDER BY title DESC;











