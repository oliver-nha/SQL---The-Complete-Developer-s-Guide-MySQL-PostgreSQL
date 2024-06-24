DROP TABLE users;
DROP TABLE employers;
DROP TABLE conversations; 

create table users(
    id SERIAL PRIMARY KEY,
  --  first_name VARCHAR(300) NOT NULL,
  --  last_name VARCHAR(300) NOT NULL,
  -- full_name VARCHAR(601) GENERATED ALWAYS AS (concat(first_name, ' ', last_name)) STORED,
    full_name VARCHAR(300) NOT NULL,
    yearly_salary INT CHECK (yearly_salary > 0),
    current_status employment_status 
);

CREATE TABLE employers(
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(300) NOT NULL,
    company_address VARCHAR(300) NOT NULL,
    yearly_revenue FLOAT CHECK (yearly_revenue > 0),
    is_hiring BOOLEAN DEFAULT FALSE 
);

CREATE TABLE conversations(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    employer_id INT REFERENCES employers(id),
    message TEXT NOT NULL,
    date_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
