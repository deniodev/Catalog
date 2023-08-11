-- create database for catalog
CREATE DATABASE IF NOT EXISTS catalog_of_things;

-- Create authors table
create table authors(
  id serial not null primary key,
  first_name varchar(50),
  last_name varchar(50)
);

-- create games table
create table games(
  id serial not null primary key,
  multiplayer boolean,
  last_played date,
  publish_date date
);