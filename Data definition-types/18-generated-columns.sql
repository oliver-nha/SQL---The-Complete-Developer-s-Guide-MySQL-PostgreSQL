-- First, add the new columns
ALTER TABLE users
    ADD COLUMN first_name VARCHAR(300) NOT NULL,
    ADD COLUMN last_name VARCHAR(300) NOT NULL;

-- Then, populate the full_name column with the concatenated values of first_name and last_name
-- UPDATE users SET full_name = first_name || ' ' || last_name;

-- Now, drop the existing full_name column
ALTER TABLE users DROP COLUMN full_name;

-- Finally, add the full_name column with the correct data type and expression
ALTER TABLE users
    ADD COLUMN full_name VARCHAR(601) GENERATED ALWAYS AS (first_name || ' ' || last_name) STORED;


INSERT into users (first_name, last_name, yearly_salary, current_status) VALUES ('David', 'Doe', 5000, 'unemployed');