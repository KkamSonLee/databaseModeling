
ALTER TABLE directors
ADD CONSTRAINT directors_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

ALTER TABLE writers
ADD CONSTRAINT writers_pri_key PRIMARY KEY (title_id,name_id);

ALTER TABLE writersmovie_mainmovie_mainmovie_attributes
ADD CONSTRAINT writers_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

ALTER TABLE title_episode
ADD CONSTRAINT title_title_episode_pri_key PRIMARY KEY (episode_title_id);

ALTER TABLE title_episode
ADD CONSTRAINT title_title_episode_ep_title_id_fkey FOREIGN KEY (episode_title_id) REFERENCES title_main(title_id);

ALTER TABLE people_job
ADD CONSTRAINT people_job_pri_key PRIMARY KEY (name_id,profession);

ALTER TABLE people_job
ADD CONSTRAINT people_job_name_id_fkey FOREIGN KEY (name_id) REFERENCES people_main(name_id);

ALTER TABLE who_movie
ADD CONSTRAINT who_movie_pri_key PRIMARY KEY (name_id,title_id);

ALTER TABLE who_movie
ADD CONSTRAINT who_movie_name_id_fkey FOREIGN KEY (name_id) REFERENCES people_main(name_id);

ALTER TABLE principals
ADD CONSTRAINT principals_pri_key PRIMARY KEY (title_id,ordering);


ALTER TABLE movie_job
ADD CONSTRAINT movie_job_pri_key PRIMARY KEY (title_id,name_id,role_(255));

ALTER TABLE title_genres
ADD CONSTRAINT title_genres_pri_key PRIMARY KEY (title_id,genre);

ALTER TABLE title_genres
ADD CONSTRAINT title_genres_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

ALTER TABLE rating_data
ADD CONSTRAINT rating_data_pri_key PRIMARY KEY (title_id);

ALTER TABLE rating_data
ADD CONSTRAINT rating_data_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

SET foreign_key_checks = 0;

ALTER TABLE movie_main
ADD CONSTRAINT movie_main_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

ALTER TABLE movie_attributes
ADD CONSTRAINT movie_attributes_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

ALTER TABLE movie_type
ADD CONSTRAINT movie_type_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

ALTER TABLE title_episode
ADD CONSTRAINT title_episode_show_title_id_fkey FOREIGN KEY (parent_tv_show_title_id) REFERENCES title_main(title_id);

ALTER TABLE who_movie
ADD CONSTRAINT who_movie_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

ALTER TABLE principals
ADD CONSTRAINT principals_name_id_fkey FOREIGN KEY (name_id) REFERENCES people_main(name_id);

ALTER TABLE principals
ADD CONSTRAINT principals_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

ALTER TABLE movie_job
ADD CONSTRAINT movie_job_title_id_fkey FOREIGN KEY (title_id) REFERENCES title_main(title_id);

ALTER TABLE movie_job
ADD CONSTRAINT movie_job_name_id_fkey FOREIGN KEY (name_id) REFERENCES people_main(name_id);

ALTER TABLE directors
ADD CONSTRAINT directors_name_id_fkey FOREIGN KEY (name_id) REFERENCES people_main(name_id);

ALTER TABLE writers
ADD CONSTRAINT writers_name_id_fkey FOREIGN KEY (name_id) REFERENCES people_main(name_id);

SET foreign_key_checks = 1;