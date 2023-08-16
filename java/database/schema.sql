BEGIN TRANSACTION;

DROP TABLE IF EXISTS  beers_reviews cascade;
DROP TABLE IF EXISTS  breweries_beers cascade;
DROP TABLE IF EXISTS  reviews cascade;
DROP TABLE IF EXISTS  beers cascade;
DROP TABLE IF EXISTS  breweries cascade;
DROP TABLE IF EXISTS  users cascade;
DROP TABLE IF EXISTS liked cascade;
DROP TABLE IF EXISTS  event cascade;
DROP TABLE IF EXISTS  event_beers cascade;
DROP TABLE IF EXISTS  news cascade;


CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	email_address varchar(250) NOT NULL,
	request BOOLEAN,
	CONSTRAINT PK_user PRIMARY KEY (user_id),
	CONSTRAINT UQ_username UNIQUE (username)
);

CREATE TABLE breweries (
	breweries_id SERIAL,
	brewery_name varchar(250) NOT NULL UNIQUE,
	phone_number varchar(50) NOT NULL,
	email_address varchar(250),
	address varchar (250) NOT NULL,
	brewery_history varchar(1000) NOT NULL,
	operating_hours varchar(50),
	brewery_image varchar(1000),
	longitude varchar(50),
	latitude varchar(50),
	from_third_party BOOLEAN,
	brewer_id int NOT NULL,
	average_rating float NOT NULL,
	CONSTRAINT PK_breweries_id PRIMARY KEY (breweries_id),
	CONSTRAINT UQ_brewery_name UNIQUE (brewery_name),
	CONSTRAINT FK_users_brewer_id FOREIGN KEY (brewer_id) REFERENCES users (user_id)
);


CREATE TABLE beers (
	beer_id SERIAL,
	beer_name varchar(250) NOT NULL UNIQUE,
	description varchar(500) NOT NULL,
	rating int,
	beer_type varchar(250) NOT NULL,
	tasting_notes varchar(250) NOT NULL,
	abv float NOT NULL,
	average_rating float NOT NULL,
	image varchar(1000) NOT NULL,
	CONSTRAINT PK_beers PRIMARY KEY (beer_id),
	CONSTRAINT UQ_beer_name UNIQUE (beer_name)
);

CREATE TABLE reviews (
	review_id SERIAL,
	rating int NOT NULL,
	description varchar(500) NOT NULL,
	user_id int NOT NULL,
	username varchar (100) NOT NULL,
	breweries_id int,
	CONSTRAINT PK_review_id PRIMARY KEY (review_id),
	CONSTRAINT FK_reviews_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT FK_reviews_breweries_id FOREIGN KEY (breweries_id) REFERENCES breweries (breweries_id)
);

CREATE TABLE breweries_beers (
	breweries_id int NOT NULL,
	beer_id int NOT NULL,
	CONSTRAINT FK_breweries_id FOREIGN KEY (breweries_id) REFERENCES breweries (breweries_id),
	CONSTRAINT FK_beer_id FOREIGN KEY (beer_id) REFERENCES beers (beer_id)
);

CREATE TABLE beers_reviews (
	beer_id int NOT NULL,
	review_id int NOT NULL,
	CONSTRAINT FK_beer_id FOREIGN KEY (beer_id) REFERENCES beers (beer_id),
	CONSTRAINT FK_review_id FOREIGN KEY (review_id) REFERENCES reviews (review_id)
);

CREATE TABLE liked(
    user_id int NOT NULL,
	breweries_id int,
	beer_id int,
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT FK_breweries_id FOREIGN KEY (breweries_id) REFERENCES breweries (breweries_id),
	CONSTRAINT FK_beer_id FOREIGN KEY (beer_id) REFERENCES beers (beer_id)
);


CREATE TABLE event (
	event_id SERIAL,
	beer_id int,
	description varchar (3000) NOT NULL,
	title varchar (75) NOT NULL,
	event_date date,
	CONSTRAINT PK_event_id PRIMARY KEY (event_id)

);

-- connect events and beers, allows us to have multiple beers for an event
CREATE TABLE event_beers (
	beer_id int,
	event_id int,
	user_id int,
	breweries_id int,

	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT FK_breweries_id FOREIGN KEY (breweries_id) REFERENCES breweries (breweries_id),
	CONSTRAINT FK_beer_id FOREIGN KEY (beer_id) REFERENCES beers (beer_id),

	--PRIMARY KEY (event_title, beer_id)

	constraint Fk_event_id foreign key (event_id) references event (event_id)
);

CREATE TABLE news(
	news_id SERIAL,
	news_description varchar(100),
	news_date DATE
);



COMMIT TRANSACTION;