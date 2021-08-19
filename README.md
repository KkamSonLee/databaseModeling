# DatabaseModeling

# Data (IMDB) https://www.imdb.com/interfaces/

# IMDB에서 제공하는 데이터로 구조를 짜보았습니다.
## 제공하는 파일의 데이터 형식

## title.akas.tsv.gz - Contains the following information for titles:

	titleId (string) - a tconst, an alphanumeric unique identifier of the title
	ordering (integer) – a number to uniquely identify rows for a given titleId
	title (string) – the localized title
	region (string) - the region for this version of the title
	language (string) - the language of the title
	types (array) - Enumerated set of attributes for this alternative title. 
	attributes (array) - Additional terms to describe this alternative title, not enumerated
	isOriginalTitle (boolean) – 0: not original title; 1: original title

## title.basics.tsv.gz - Contains the following information for titles:

	tconst (string) - alphanumeric unique identifier of the title
	titleType (string) – the type/format of the title (e.g. movie, short, tvseries, tvepisode, video, etc)
	primaryTitle (string) – the more popular title
	originalTitle (string) - original title, in the original language
	isAdult (boolean) - 0: non-adult title; 1: adult title
	startYear (YYYY) – represents the release year of a title. In the case of TV Series, it is the series start year
	endYear (YYYY) – TV Series end year. ‘\N’ for all other title types
	runtimeMinutes – primary runtime of the title, in minutes
	genres (string array) – includes up to three genres associated with the title

## title.crew.tsv.gz – Contains the director and writer information for all the titles in IMDb. Fields include:

	tconst (string) - alphanumeric unique identifier of the title
	directors (array of nconsts) - director(s) of the given title
	writers (array of nconsts) – writer(s) of the given title

## title.episode.tsv.gz – Contains the tv episode information. Fields include:

	tconst (string) - alphanumeric identifier of episode
	parentTconst (string) - alphanumeric identifier of the parent TV Series
	seasonNumber (integer) – season number the episode belongs to
	episodeNumber (integer) – episode number of the tconst in the TV series

## title.principals.tsv.gz – Contains the principal cast/crew for titles

	tconst (string) - alphanumeric unique identifier of the title
	ordering (integer) – a number to uniquely identify rows for a given titleId
	nconst (string) - alphanumeric unique identifier of the name/person
	category (string) - the category of job that person was in
	job (string) - the specific job title if applicable, else '\N'
	characters (string) - the name of the character played if applicable, else '\N'
	
## title.ratings.tsv.gz – Contains the IMDb rating and votes information for titles

	tconst (string) - alphanumeric unique identifier of the title
	averageRating – weighted average of all the individual user ratings
	numVotes - number of votes the title has received

## name.basics.tsv.gz – Contains the following information for names:

	nconst (string) - alphanumeric unique identifier of the name/person
	primaryName (string)– name by which the person is most often credited
	birthYear – in YYYY format
	deathYear – in YYYY format if applicable, else '\N'
	primaryProfession (array of strings)– the top-3 professions of the person
	knownForTitles (array of tconsts) – titles the person is known for

# E-R Modeling 파일을 분할하여 ER모델링을 만들었음.

![er_modeling](https://user-images.githubusercontent.com/15981307/129408133-6475480d-0a85-423d-9b81-3a4b50be6be8.png)

# Logical Schema 제약조건 및 키 추가하였음 Database 상에서도 해당 구조를 가지고 있음

![logical_schema](https://user-images.githubusercontent.com/15981307/129408431-d27a0517-a9a3-4fb7-a17b-3dd0d260ecc1.png)

## 해당 테이블들로 찾아볼 쿼리문

![quiz_image](https://user-images.githubusercontent.com/15981307/129408473-4cc7ae94-4adf-477b-b5ed-26c239fd7537.png)

## MySQL Workbench에서 실횅한 반응시간(인덱스 제거시 차이)

![reaction_time](https://user-images.githubusercontent.com/15981307/129408476-e3ca06cc-190e-4e42-9df4-8ecc2018d8b8.png)
