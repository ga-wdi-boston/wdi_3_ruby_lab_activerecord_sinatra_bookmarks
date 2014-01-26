DROP TABLE IF EXISTS bookmarks;

CREATE TABLE bookmarks (
	id SERIAL PRIMARY KEY,
	name TEXT,
	url TEXT
	);

INSERT INTO bookmarks (name, url) VALUES ('test', 'goog.com');