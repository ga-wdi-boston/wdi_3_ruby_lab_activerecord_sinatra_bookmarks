DROP TABLE IF EXISTS bookmarks;

CREATE TABLE bookmarks
(
  id SERIAL PRIMARY KEY,
  name TEXT,
  url TEXT,
  category TEXT
);

INSERT INTO bookmarks (name, url, category)
  VALUES ('Google', 'http://google.com', 'Basics');

INSERT INTO bookmarks (name, url, category)
  VALUES ('Twitter', 'http://twitter.com', 'Social Media');

INSERT INTO bookmarks (name, url, category)
  VALUES ('Reddit', 'http://reddit.com', 'Time Consumption');
