DROP TABLE IF EXISTS contacts;

CREATE TABLE contact (
	id SERIAL PRIMARY KEY,
	name TEXT,
	phone TEXT,
	email TEXT
);
