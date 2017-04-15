-- ******
-- Name of database is 'bookmarks'
-- ******

DROP TABLE IF EXISTS bookmarks;

CREATE TABLE bookmarks (
	id SERIAL PRIMARY KEY,
	name TEXT,
	url TEXT,
	tag TEXT
	);

INSERT INTO bookmarks (name, url, tag) VALUES ('Google', 'http://google.com', 'Search');
INSERT INTO bookmarks (name, url, tag) VALUES ('CNN', 'http://cnn.com', 'News');
INSERT INTO bookmarks (name, url, tag) VALUES ('NY Times', 'http://www.nytimes.com/', 'News');
INSERT INTO bookmarks (name, url, tag) VALUES ('DNS', 'http://www.petekeen.net/dns-the-good-parts', 'Article');