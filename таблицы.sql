-- DDL скрипты для таблиц

CREATE TABLE city(
	city_id NUMBER PRIMARY KEY,
	city_name varchar2(100) NOT NULL
);

CREATE TABLE hotel(
	hotel_id NUMBER PRIMARY KEY,
	hotel_name varchar2(100) NOT NULL,
	city_id NUMBER REFERENCES city(city_id)
);

CREATE TABLE room_type(
	room_type_id NUMBER PRIMARY KEY,
	room_type_name varchar2(50) NOT NULL,
	number_places NUMBER NOT NULL
);

CREATE TABLE hotel_room(
	room_id NUMBER PRIMARY KEY,
	hotel_id NUMBER REFERENCES hotel(hotel_id),
	room_type_id NUMBER REFERENCES room_type(room_type_id),
	day_cost NUMBER NOT NULL
);

CREATE TABLE tourist_category(
	tourist_category_id NUMBER PRIMARY KEY,
	category_name varchar2(20) NOT NULL
	CONSTRAINT category_name_cnst CHECK (category_name IN ('excursion','shopping'))
);

CREATE TABLE "group" (
	group_id NUMBER PRIMARY KEY,
	city_id NUMBER REFERENCES city(city_id),
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	tour_cost NUMBER NOT NULL
);


CREATE TABLE tourist(
	tourist_id NUMBER PRIMARY KEY,
	fio varchar2(150) NOT NULL,
	passport_num varchar2(10) NOT NULL,
	sex varchar2(6) NOT NULL ,
	birthday_date DATE NOT NULL,
	phone_number varchar2(11) NOT NULL,
	hotel_id REFERENCES hotel(hotel_id),
	group_id REFERENCES "group"(group_id),
	tourist_category_id NUMBER REFERENCES tourist_category(tourist_category_id),
	CONSTRAINT sex_cnst CHECK (upper(sex) IN ('MALE','FEMALE'))
);

CREATE TABLE children(
	tourist_id NUMBER REFERENCES tourist(tourist_id) UNIQUE,
	companion_id NUMBER REFERENCES tourist(tourist_id)
);

CREATE TABLE tourist_hotel(
	tourist_id NUMBER REFERENCES tourist(tourist_id),
	room_id NUMBER REFERENCES hotel_room(room_id),
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	total_cost NUMBER NOT NULL
);

	CREATE TABLE agency(
		agency_id NUMBER PRIMARY KEY ,
		agency_name varchar2(50) NOT NULL,
		cost_coefficient NUMBER NOT NULL,
		city_id NUMBER REFERENCES city(city_id)
	);
CREATE TABLE excursions(
	excursion_id NUMBER PRIMARY KEY ,
	place varchar2(50) NOT NULL,
	agency_id NUMBER REFERENCES agency(agency_id),
	cost NUMBER NOT NULL
);

CREATE TABLE excursion_info(
	tourist_id NUMBER REFERENCES tourist(tourist_id),
	excursion_id NUMBER REFERENCES excursions(excursion_id),
	excursion_date DATE NOT NULL,
	CONSTRAINT pk_tour_excur PRIMARY KEY(tourist_id,excursion_id)
);

CREATE TABLE race_type(
	race_type_id NUMBER PRIMARY KEY,
	type_name varchar2(50) NOT NULL
	CONSTRAINT type_name_cnst CHECK (type_name IN ('cargo-passenger','cargo'))
);

CREATE TABLE flight_schedule(
	race_id NUMBER PRIMARY KEY,
	name varchar2(100) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	race_type_id NUMBER REFERENCES race_type(race_type_id),
	cost NUMBER NOT NULL
);

CREATE TABLE group_race(
	group_id NUMBER REFERENCES "group"(group_id),
	race_id NUMBER REFERENCES flight_schedule(race_id),
	CONSTRAINT pk_group_race PRIMARY KEY(group_id,race_id)
);

CREATE TABLE storage_type(
	storage_type_id NUMBER PRIMARY KEY,
	storage_type_name varchar2(50) NOT NULL
);

CREATE TABLE storage(
	storage_id NUMBER PRIMARY KEY,
	tourist_id NUMBER REFERENCES tourist(tourist_id),
	storage_type_id NUMBER REFERENCES storage_type(storage_type_id),
	weight NUMBER NOT NULL,
	package_cost NUMBER NOT NULL,
	insurance_cost NUMBER NOT NULL,
	storage_cost NUMBER NOT NULL,
	total_cost NUMBER
);

CREATE TABLE race_storage(
	race_id NUMBER REFERENCES flight_schedule(race_id),
	storage_id NUMBER REFERENCES storage(storage_id)
);

-- Sequences
CREATE SEQUENCE city_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE agency_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE children_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE excursion_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE excursion_info_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE flight_shecule_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE group_race_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
   
CREATE SEQUENCE hotel_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE hotel_room_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE race_storage_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE race_type_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE room_type_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE storage_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE storage_type_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE tourist_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE tourist_category_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE tourist_hotel_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
CREATE SEQUENCE group_seq
    START WITH 1
    INCREMENT BY 1
    CACHE 2
    NOCYCLE;
 
-- Indexes 
CREATE INDEX hotel_city_ix ON hotel(city_id);
CREATE INDEX hotel_room_hotel_ix ON hotel_room (hotel_id);
CREATE INDEX hotel_room_rmtype_ix ON hotel_room (room_type_id);
CREATE INDEX group_city_ix ON "group"(city_id);
CREATE INDEX tourist_hotel_ix ON tourist (hotel_id);
CREATE INDEX tourist_category_ix ON tourist (tourist_category_id);
CREATE INDEX tourist_group_ix ON tourist (group_id);
CREATE INDEX children_tourist_ix ON children (tourist_id);
CREATE INDEX children_companion_ix ON children (companion_id);
CREATE INDEX tourist_hotel_room_ix ON tourist_hotel (room_id);
CREATE INDEX tourist_hotel_tourist_ix ON tourist_hotel (tourist_id);
CREATE INDEX agency_city_ix ON agency (city_id);
CREATE INDEX excursions_agency_ix ON excursions (agency_id);
CREATE INDEX excursion_info_tourist_ix ON excursion_info (tourist_id);
CREATE INDEX excursion_info_excursion_ix ON excursion_info (excursion_id);
CREATE INDEX flight_schedule_race_type_ix ON flight_schedule (race_type_id);
CREATE INDEX group_race_group_ix ON group_race (group_id);
CREATE INDEX group_race_race_ix ON group_race (race_id);
CREATE INDEX storage_storage_type_ix ON storage (storage_type_id);
CREATE INDEX storage_tourist_ix ON storage (tourist_id);
CREATE INDEX race_storage_race_ix ON race_storage (race_id);
CREATE INDEX race_storage_storage_ix ON race_storage (storage_id);


