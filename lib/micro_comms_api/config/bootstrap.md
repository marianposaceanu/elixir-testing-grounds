psql:

CREATE DATABASE testdatabase;
\c testdatabase

CREATE TABLE comments(
   id int primary key      not null,
   user_name      char(50) not null,
   body           text     not null,
   created_at timestamp without time zone default (now() at time zone 'utc')
);

INSERT INTO comments (id,user_name,body) VALUES (1, 'Marian', 'Just a comment');


debug: 

iex -S mix
