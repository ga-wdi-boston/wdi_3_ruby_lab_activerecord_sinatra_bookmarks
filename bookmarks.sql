DROP TABLE IF EXISTS bookmarks;

CREATE TABLE bookmarks (
	id SERIAL PRIMARY KEY,
	name TEXT,
	address TEXT
);

INSERT INTO bookmarks (name, address) VALUES ('Google', 'http://www.google.com');
