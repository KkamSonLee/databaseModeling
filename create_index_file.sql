
-- movie_attributes
CREATE INDEX movie_attributes_index ON movie_attributes(title_id);

-- movie_type
CREATE INDEX movie_type_index ON movie_type(title_id);

-- movie_main
CREATE INDEX movie_main_index ON movie_main(title_id);

-- directors
CREATE INDEX directors_title_id_index ON directors(title_id);
CREATE INDEX directors_name_id_index ON directors(name_id);

-- title_episode
CREATE INDEX title_episode_ep_title_id_index ON title_episode(episode_title_id);
CREATE INDEX title_episode_show_title_id_index ON title_episode(parent_tv_show_title_id);

-- movie_job
CREATE INDEX movie_job_title_id_index ON movie_job(title_id);
CREATE INDEX movie_job_name_id_index ON movie_job(name_id);

-- who_movie
CREATE INDEX who_movie_index ON who_movie(name_id);

-- people_job
CREATE INDEX people_job_index ON people_job(profession);

-- people_main_
CREATE INDEX people_main_index ON people_main(name_id);

CREATE INDEX people_name_index ON people_main(name_);

-- principals
CREATE INDEX principals_index ON principals(title_id);
CREATE INDEX principals_category_movie_attributesindex ON principals(job_category);

-- title_genres
CREATE INDEX title_genres_title_id_index ON title_genres(title_id);
CREATE INDEX title_genres_genre_index ON title_genres(genre);

-- rating_data
CREATE INDEX rating_data_index ON rating_data(title_id);

-- title_main
CREATE INDEX title_main_index ON title_main(title_id);
CREATE INDEX title_main_ori_index ON title_main(original_title(255));
CREATE INDEX title_main_pri_index ON title_main(primary_title(255));
CREATE INDEX title_main_year_index ON title_main(start_year);

-- writers
CREATE INDEX writers_title_id_index ON writers(title_id);
CREATE INDEX writers_name_id_index ON writers(name_id);