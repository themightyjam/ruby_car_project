DROP TABLE cars;
DROP TABLE manufacturers;

CREATE TABLE cars (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  year_made INT,
  buying_cost INT,
  selling_price INT,
  stock INT,
  manufacturer_id INT REFERENCES
);

CREATE TABLE manufacturers (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),
  year_formed INT
);



)
