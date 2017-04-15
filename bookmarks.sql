DROP TABLE IF EXISTS bookmarks;

CREATE TABLE bookmarks (
	id serial primary key,
	name text,
	url text
);

INSERT INTO bookmarks (name, url) VALUES ('Google', 'www.google.com')
