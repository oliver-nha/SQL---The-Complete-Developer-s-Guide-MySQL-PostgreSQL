-- PostgreSQL + ENUM => We have to create custom type

 CREATE TYPE employment_status AS ENUM ('employed',  'self-employed', 'unemployed');

CREATE TABLE users(
    full_name VARCHAR(200),
    yearly_salary INT,
   -- current_status ENUM('employed', 'unemployed', 'retired') -- MySQL specific
    current_status employment_status 
) 