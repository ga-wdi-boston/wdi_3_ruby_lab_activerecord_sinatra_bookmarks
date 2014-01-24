DROP TABLE IF EXISTS bookmarks;

CREATE TABLE bookmarks (
	id SERIAL PRIMARY KEY,
	category TEXT,
	url TEXT
);
