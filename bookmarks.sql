DROP TABLE IF EXISTS bookmarks;

CREATE TABLE bookmarks (
  id SERIAL PRIMARY KEY,
  name TEXT,
  url TEXT
);

-- See table

INSERT INTO bookmarks (name, url)
  VALUES ('Google', 'www.google.com');
