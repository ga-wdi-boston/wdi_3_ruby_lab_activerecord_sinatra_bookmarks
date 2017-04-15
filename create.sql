
CREATE DATABASE bookmarks_db;

\connect bookmarks_db;

CREATE TABLE bookmarks (name text, url text);

INSERT INTO bookmarks (name, url) VALUES ('Google', 'www.google.com');
INSERT INTO bookmarks (name, url) VALUES ('The New York Times', 'www.nytimes.com');