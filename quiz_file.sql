use university;

#1
select t.primary_title, t.original_title
from title_main t
where t.primary_title = 'My Better Halves' or t.original_title = 'My Better Halves';


#2
select t.original_title, r.average_rating
from principals c, people_main p, title_main t, rating_data r
where c.name_id = p.name_id and  c.title_id = t.title_id and
t.title_id = r.title_id and c.job_category= 'actor' and p.name_ = 'Charles Kayser';


#3
select t.original_title , t.start_year
from title_main t, principals c, people_main p
where t.title_id = c.title_id and c.name_id  = p.name_id and c.job_category = 'director' and p.name_ = 'William Heise'
order by t.start_year;

#4
select t.original_title, t.primary_title, r.num_votes
from title_genres g, title_main t, rating_data r
where g.title_id = t.title_id and t.title_id = r.title_id and g.genre = 'Drama\r'
order by r.num_votes desc;

#5
select t.original_title, t.primary_title, r.average_rating
from title_genres g, title_main t, rating_data r
where g.title_id = t.title_id and t.title_id = r.title_id and g.genre = 'Drama\r'
order by r.average_rating desc;


#tt0000439
#6
select p.name_, j.role_
from people_main p, title_main t, principals c, movie_job j
where p.name_id = c.name_id and t.title_id = c.title_id and j.title_id = t.title_id and j.name_id = p.name_id and c.job_category = 'actor' and t.original_title = 'The Great Train Robbery';

#7
select t.original_title, t.start_year, t.runtime_minutes, r.average_rating, r.num_votes
from title_main t, rating_data r
where t.title_id = r.title_id and r.num_votes >= 1000000
order by r.num_votes desc;


#8
select distinct t.original_title, r.average_rating, r.num_votes, t.title_id
from title_main t, rating_data r
where t.title_id = r.title_id and t.title_type = 'movie' and t.original_title = 'Expansivas';

update rating_data
    set num_votes = 9, average_rating = 6.0
    where title_id = 'tt9344454';
