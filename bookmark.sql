DROP TABLE IF EXISTS bookmark;

CREATE TABLE bookmark
(
  id SERIAL PRIMARY KEY,
  site_name TEXT,
  url TEXT
);

INSERT INTO bookmark (site_name, url) VALUES ('Google', 'http://www.google.com');
