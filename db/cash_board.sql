DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE tags
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE merchants
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE transactions
(
  id SERIAL8 PRIMARY KEY,
  amount INT8,
  spend_date DATE,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE
);
