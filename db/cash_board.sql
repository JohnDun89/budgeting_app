DROP TABLE transaction;
DROP TABLE tag;
DROP TABLE merchant;

CREATE TABLE tag
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE merchant
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE transaction
(
  id SERIAL8 PRIMARY KEY,
  amount INT8,
  spend_date DATE,
  tag_id INT8 REFERENCES tag(id),
  merchant_id INT8 REFERENCES merchant(id)
);
