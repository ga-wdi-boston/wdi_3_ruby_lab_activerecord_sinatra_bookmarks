CREATE TABLE bookmarks (
	id SERIAL PRIMARY KEY,
	name TEXT,
	link TEXT
);

INSERT INTO bookmarks (name, link)
	VALUES ('Google','http://google.com');

INSERT INTO bookmarks (name, link)
	VALUES ('Twitter','http://twitter.com');
