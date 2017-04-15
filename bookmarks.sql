DROP TABLE IF EXISTS bookmarks;

CREATE TABLE bookmarks (
	id SERIAL PRIMARY KEY,
	category TEXT,
	url TEXT
);

ALTER TABLE bookmarks ADD COLUMN name TEXT;
