
/* Drop Indexes */

DROP INDEX IF EXISTS index_answer_question;
DROP INDEX IF EXISTS index_point_result_answer;
DROP INDEX IF EXISTS index_project_user;
DROP INDEX IF EXISTS index_question_project;



/* Drop Tables */

DROP TABLE IF EXISTS points;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS images;
DROP TABLE IF EXISTS logs;
DROP TABLE IF EXISTS users;




/* Create Tables */

CREATE TABLE answers
(
	id bigserial NOT NULL,
	name varchar NOT NULL,
	question_id bigint NOT NULL,
	selected_count int NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE images
(
	id bigserial NOT NULL,
	user_id bigint NOT NULL,
	file_name varchar NOT NULL,
	file_stream bytea NOT NULL,
	create_at timestamp NOT NULL,
	update_at timestamp NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE logs
(
	id bigserial NOT NULL,
	user_id bigint NOT NULL,
	description varchar NOT NULL,
	create_at timestamp NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE points
(
	id bigserial NOT NULL,
	result_id bigint NOT NULL,
	answer_id bigint NOT NULL,
	point int NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE projects
(
	id bigserial NOT NULL,
	name varchar NOT NULL,
	user_id bigint NOT NULL,
	image_id bigint,
	description varchar,
	status int NOT NULL,
	start_page text,
	finish_page text,
	create_at timestamp NOT NULL,
	update_at timestamp NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE questions
(
	id bigserial NOT NULL,
	description varchar NOT NULL,
	project_id bigint NOT NULL,
	image_id bigint NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE results
(
	id bigserial NOT NULL,
	project_id bigint NOT NULL,
	image_id bigint,
	name varchar NOT NULL,
	description varchar,
	result_count int NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE users
(
	id bigserial NOT NULL,
	name varchar NOT NULL,
	email varchar NOT NULL UNIQUE,
	password varchar NOT NULL,
	authority int NOT NULL,
	create_at timestamp NOT NULL,
	update_at timestamp NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE points
	ADD FOREIGN KEY (answer_id)
	REFERENCES answers (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE projects
	ADD FOREIGN KEY (image_id)
	REFERENCES images (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE questions
	ADD FOREIGN KEY (image_id)
	REFERENCES images (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE results
	ADD FOREIGN KEY (image_id)
	REFERENCES images (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE questions
	ADD FOREIGN KEY (project_id)
	REFERENCES projects (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE results
	ADD FOREIGN KEY (project_id)
	REFERENCES projects (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE answers
	ADD FOREIGN KEY (question_id)
	REFERENCES questions (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE points
	ADD FOREIGN KEY (result_id)
	REFERENCES results (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE images
	ADD FOREIGN KEY (user_id)
	REFERENCES users (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE logs
	ADD FOREIGN KEY (user_id)
	REFERENCES users (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE projects
	ADD FOREIGN KEY (user_id)
	REFERENCES users (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/* Create Indexes */

CREATE INDEX index_answer_question ON answers (question_id);
CREATE INDEX index_point_result_answer ON points (answer_id, result_id);
CREATE INDEX index_project_user ON projects (user_id);
CREATE INDEX index_question_project ON questions (project_id);



