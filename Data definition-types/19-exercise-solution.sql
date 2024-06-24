-- Task 1 : Creat db;

-- create database online_shop;

-- Task 2 : create and configure table

-- create table products(
--     name varchar(200),
--     price NUMERIC(10,2),
--     description TEXT,
--     amount_in_stock SMALLINT,
--     image_path varchar(500)
-- )

-- Task 4: insert dummy data

-- insert into products(name, price, description, amount_in_stock, image_path)
-- values ('Apple', 1.99, 'A fruit that keeps the doctor away', 100, 'aupload/imgaes/products/a pple.jpg'),
-- ('Banana', 0.99, 'A fruit that monkeys love', 200, 'upload/imgaes/products/banana.jpg'),
-- ('Orange', 1.49, 'A fruit that is orange', 150, 'upload/imgaes/products/orange.jpg'),
-- ('Pineapple', 2.99, 'A fruit that is spiky', 50, 'upload/imgaes/products/pineapple.jpg'),
-- ('Mango', 3.99, 'A fruit that is tropical', 75, 'upload/imgaes/products/mango.jpg'),
-- ('Grapes', 4.99, 'A fruit that is in bunches', 25, 'upload/imgaes/products/grapes.jpg'),
-- ('Strawberry', 5.99, 'A fruit that is red', 125, 'upload/imgaes/products/strawberry.jpg'),
-- ('Blueberry', 6.99, 'A fruit that is blue', 175, 'upload/imgaes/products/blueberry.jpg'),
-- ('Raspberry', 7.99, 'A fruit that is raspberry', 225, 'upload/imgaes/products/raspberry.jpg'),
-- ('Blackberry', 8.99, 'A fruit that is black', 275, 'upload/imgaes/products/blackberry.jpg');

-- ALTER TABLE products 
-- ALTER COLUMN name SET NOT NULL,
-- ALTER COLUMN price SET NOT NULL,
-- ALTER COLUMN description SET NOT NULL,
-- ADD CONSTRAINT price_positive CHECK(price > 0),
-- ADD CONSTRAINT amount_in_stock_positive CHECK(amount_in_stock  > 0);

--Task 6 add id

ALTER TABLE products
ADD COLUMN id SERIAL PRIMARY KEY;
