
-- SHOW VARIABLES LIKE "local_infile";
SET GLOBAL local_infile = 1;

-- Load Aliases.tsv into Aliases table
LOAD DATA LOCAL INFILE  'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/movie_main.tsv'
INTO TABLE movie_main
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Alias_attributes.tsv into Alias_attributes table
LOAD DATA LOCAL INFILE  'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/movie_attributes.tsv'
INTO TABLE Alias_attributes
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Alias_types.tsv into Alias_types table
LOAD DATA LOCAL INFILE  'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/movie_type.tsv'
INTO TABLE Alias_types
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Directors.tsv into Directors table
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/directors.tsv'
INTO TABLE Directors
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Writers.tsv into Writers table
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/writers.tsv'
INTO TABLE Writers
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Episode_belongs_to.tsv into Episode_belongs_to table
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/title_episode.tsv'
INTO TABLE Episode_belongs_to
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Names_.tsv into Names_ table
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/people_main.tsv'
INTO TABLE Names_
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Name_worked_as.tsv into Name_worked_as table
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/people_job.tsv'
INTO TABLE Name_worked_as
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Known_for.tsv into Known_for table
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/who_movie.tsv'
INTO TABLE Known_for
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Principals.tsv into Principals table
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/principals.tsv'
INTO TABLE Principals
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Had_role.tsv into Had_role table
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/movie_job.tsv'
INTO TABLE Had_role
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Titles.tsv into Titles table
LOAD DATA LOCAL INFILE 'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/title_main.tsv'
INTO TABLE Titles
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Title_genres.tsv into Title_genres table
LOAD DATA LOCAL INFILE  'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/title_genres.tsv'
INTO TABLE Title_genres
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;

-- Load Title_ratings.tsv into Title_ratings table
LOAD DATA LOCAL INFILE  'C:/Users/ASUS/PycharmProjects/untitled/venv/Scripts/rating_data.tsv'
INTO TABLE Title_ratings
COLUMNS TERMINATED BY '\t'
IGNORE 1 LINES;