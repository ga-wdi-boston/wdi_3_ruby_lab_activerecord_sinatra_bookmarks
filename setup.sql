DROP TABLE IF EXISTS bookmarks;

CREATE TABLE bookmarks (
	id SERIAL PRIMARY KEY,
	name TEXT,
	url TEXT,
	tag TEXT
	);

INSERT INTO bookmarks (name, url, tag) VALUES ('Google', 'http://google.com', 'Search');