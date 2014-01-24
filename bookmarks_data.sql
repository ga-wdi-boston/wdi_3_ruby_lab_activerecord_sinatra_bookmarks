DROP TABLE IF EXISTS bookmarks;


CREATE TABLE bookmarks

(
	id SERIAL PRIMARY KEY,
	name TEXT,
	url TEXT
);

INSERT INTO bookmarks (name, url) VALUES ('google','https://www.google.com/');



# run this by using this in cmd line
# createdb bookmarks_data
# psql -d bookmarks_data -f bookmarks_data.sql
