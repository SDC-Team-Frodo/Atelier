CREATE SCHEMA IF NOT EXISTS reviewsSchema;

DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS characteristics;
DROP TABLE IF EXISTS characteristic_reviews;
DROP TABLE IF EXISTS photos;


CREATE TABLE review (
  id SERIAL UNIQUE PRIMARY KEY,
  product_id INTEGER NULL DEFAULT NULL,
  rating BIGINT NULL DEFAULT NULL,
  date BIGINT NULL DEFAULT NULL,
  summary TEXT NULL DEFAULT NULL,
  body TEXT NULL DEFAULT NULL,
  recommend BOOL NULL DEFAULT NULL,
  reported BOOL NULL DEFAULT NULL,
  reviewer_name TEXT NULL DEFAULT NULL,
  reviewer_email TEXT NULL DEFAULT NULL,
  response TEXT NULL DEFAULT NULL,
  helpfulness INTEGER NULL DEFAULT NULL
);



CREATE TABLE characteristics (
  id SERIAL PRIMARY KEY,
  product_id INTEGER NULL DEFAULT NULL,
  name TEXT NULL DEFAULT NULL
);

ALTER TABLE characteristics ADD FOREIGN KEY (product_id) REFERENCES review (product_id);


CREATE TABLE characteristic_reviews (
  id SERIAL PRIMARY KEY,
  characteristic_id INTEGER NULL DEFAULT NULL,
  review_id INTEGER NULL DEFAULT NULL,
  value INTEGER NULL DEFAULT NULL
);

ALTER TABLE characteristic_reviews ADD FOREIGN KEY (characteristic_id) REFERENCES characteristics(id);
ALTER TABLE characteristic_reviews ADD FOREIGN KEY (review_id) REFERENCES review(id);


CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
	review_id INTEGER NULL DEFAULT NULL,
	url TEXT NULL DEFAULT NULL
);

ALTER TABLE photos ADD FOREIGN KEY (review_id) REFERENCES review(id);

-- INSERT INTO `Product` (`id`) VALUES
-- ('');
-- INSERT INTO `Meta Data` (`id`,`product_id`,`ratings`,`total recommended`,`avg characteristics`) VALUES
-- ('','','','','');
-- INSERT INTO `Review` (`id`,`summary`,`body`,`rating`,`date`,`helpful`,`photos`,`response`,`recommend`,`reviewer_id`,`product_id`) VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO `Reviewer (Post Review)` (`id`,`name`,`email`) VALUES
-- ('','','');
-- INSERT INTO `Characteristics` (`id`,`review_id`,`size`,`width`,`comfort`,`quality`,`length`,`fit`) VALUES
-- ('','','','','','','','');