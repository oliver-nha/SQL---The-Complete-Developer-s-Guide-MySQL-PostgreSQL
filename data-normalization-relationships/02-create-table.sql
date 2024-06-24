create table users(
    id serial primary key,
    first_name varchar(300) not null,
    last_name varchar(300) not null,
    email varchar(300) not null,
    address_id int not null
    -- foreign key (address_id) references addresses(id)
);
create table addresses(
    id serial primary key,
    street varchar(300) not null,
    house_number varchar(300) not null,
    city_id int not null
    -- foreign key (city_id) references cities(id)
   
);
create table cities(
    id serial primary key,
    name varchar(300) not null
);

