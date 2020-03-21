DROP TABLE cars;
DROP TABLE manufacturers;

CREATE TABLE car (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  year_made INT,
  buying_cost INT,
  selling_price INT,
  stock INT,
  manufacturer_id INT REFERENCES
);

CREATE TABLE manufacturer (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),
  year_formed INT
);
