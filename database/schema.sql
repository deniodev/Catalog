-- create database for catalog
CREATE DATABASE IF NOT EXISTS catalog_of_things;

-- Create authors table
CREATE TABLE IF NOT EXISTS authors(
  id serial not null primary key,
  first_name varchar(50),
  last_name varchar(50)
);

-- create games table
CREATE TABLE IF NOT EXISTS games(
  id serial not null primary key,
  multiplayer boolean,
  last_played date,
  publish_date date
)

CREATE TABLE IF NOT EXISTS label(
 id INTEGER GENERATED PRIMARY KEY,
 title VARCHAR(50),
 color VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS book(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(50),
  cover_state VARCHAR(15),
  publish_date DATE,
  archived BOOLEAN,
  label_id  INT,
  FOREIGN KEY (label_id) REFERENCES label(id),
);

CREATE TABLE music_album(
  id SERIAL PRIMARY KEY,
  artist VARCHAR(50),
  genre VARCHAR(50),
  publish_date DATE,
  title VARCHAR(50),
  on_spotify BOOLEAN
);

CREATE TABLE genre(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);
