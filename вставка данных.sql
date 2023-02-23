-- Insert data into tables

-- City table

INSERT INTO city(city_id,city_name) 
SELECT city_seq.nextval,'Roma'
FROM dual;

INSERT INTO city(city_id,city_name) 
SELECT city_seq.nextval,'Milano'
FROM dual;

INSERT INTO city(city_id,city_name) 
SELECT city_seq.nextval,'Florence'
FROM dual;

INSERT INTO city(city_id,city_name) 
SELECT city_seq.nextval,'Venice'
FROM dual;

INSERT INTO city(city_id,city_name) 
SELECT city_seq.nextval,'Naples'
FROM dual;

COMMIT;
-- Hotel

INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'Milton Roma',1);
INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'Occidental Aran Park',1);
INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'Collini Rooms',2);
INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'Cozy Attic',2);
INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'Ostello del Castello di Santa Severa',3);
INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'Ping Pong ',3);
INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'Carlton',4);
INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'Dei Dragomanni',4);
INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'PC Boutique H',5);
INSERT INTO hotel(hotel_id,hotel_name,CITY_ID) 
VALUES (hotel_seq.nextval,'Salotto Toledo',5);

COMMIT;

-- Room type table 

INSERT INTO room_type(room_type_id,room_type_name) 
VALUES (room_type_seq.nextval,'1-местный',1);
INSERT INTO room_type(room_type_id,room_type_name) 
VALUES (room_type_seq.nextval,'2-местный',2);
INSERT INTO room_type(room_type_id,room_type_name) 
VALUES (room_type_seq.nextval,'3-местный',3);
INSERT INTO room_type(room_type_id,room_type_name) 
VALUES (room_type_seq.nextval,'4-местный',4);
INSERT INTO room_type(room_type_id,room_type_name) 
VALUES (room_type_seq.nextval,'Пентхаус',3);

-- Hotel room table

INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,1,1,15);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,1,2,20);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,1,3,25);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,1,4,35);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,1,5,60);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,2,1,30);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,2,2,40);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,2,3,50);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,2,4,60);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,2,5,70);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,3,1,35);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,3,2,45);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,3,3,55);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,3,4,65);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,3,5,80);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,4,1,30);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,4,2,40);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,4,3,50);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,4,4,60);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,4,5,70);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,5,1,10);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,5,2,15);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,5,3,20);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,5,4,25);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,5,5,40);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,6,1,18);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,6,2,33);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,6,3,41);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,6,4,54);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,6,5,76);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,7,1,23);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,7,2,30);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,7,3,39);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,7,4,52);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,7,5,65);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,8,1,12);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,8,2,18);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,8,3,24);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,8,4,30);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,8,5,40);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,9,1,7);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,9,2,12);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,9,3,18);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,9,4,25);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,9,5,34);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,10,1,50);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,10,2,70);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,10,3,90);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,10,4,110);
INSERT INTO hotel_room(room_id,hotel_id,room_type_id,day_cost) 
VALUES (hotel_room_seq.nextval,10,5,140);

COMMIT;

-- Tourist category
INSERT INTO tourist_category(tourist_category_id,category_name) 
VALUES (tourist_category_seq.nextval,'shopping');
INSERT INTO tourist_category(tourist_category_id,category_name) 
VALUES (tourist_category_seq.nextval,'excursion');

COMMIT;

-- group
INSERT INTO "group"(group_id,CITY_ID,START_DATE,END_DATE,TOUR_COST) 
VALUES (group_seq.nextval,1,TO_DATE('31-01-2023','DD-MM-YYYY'),TO_DATE('08-02-2023','DD-MM-YYYY'),1000);
INSERT INTO "group"(group_id,CITY_ID,START_DATE,END_DATE,TOUR_COST) 
VALUES (group_seq.nextval,2,TO_DATE('14-02-2023','DD-MM-YYYY'),TO_DATE('28-02-2023','DD-MM-YYYY'),2000);
INSERT INTO "group"(group_id,CITY_ID,START_DATE,END_DATE,TOUR_COST) 
VALUES (group_seq.nextval,3,TO_DATE('4-03-2023','DD-MM-YYYY'),TO_DATE('10-03-2023','DD-MM-YYYY'),800);
INSERT INTO "group"(group_id,CITY_ID,START_DATE,END_DATE,TOUR_COST) 
VALUES (group_seq.nextval,4,TO_DATE('02-02-2023','DD-MM-YYYY'),TO_DATE('12-02-2023','DD-MM-YYYY'),1300);
INSERT INTO "group"(group_id,CITY_ID,START_DATE,END_DATE,TOUR_COST) 
VALUES (group_seq.nextval,5,TO_DATE('26-02-2023','DD-MM-YYYY'),TO_DATE('09-03-2023','DD-MM-YYYY'),1500);

COMMIT;

-- Tourist
INSERT INTO tourist(tourist_id,fio,passport_num,sex,birthday_date,phone_number,hotel_id,group_id,tourist_category_id) 
VALUES (tourist_seq.nextval,'Zhukov Alexey Maksimovich','1104056000','Male',TO_DATE('18-05-2001','DD-MM-YYYY'),
'74265578599',1,1,1);

INSERT INTO tourist(tourist_id,fio,passport_num,sex,birthday_date,phone_number,hotel_id,group_id,tourist_category_id) 
VALUES (tourist_seq.nextval,'Samoilova Anna Valentinovna','1244160780','Female',TO_DATE('23-08-1976','DD-MM-YYYY'),
'74268095743',2,1,2);

INSERT INTO tourist(tourist_id,fio,passport_num,sex,birthday_date,phone_number,hotel_id,group_id,tourist_category_id) 
VALUES (tourist_seq.nextval,'Losya Elena Evgenievna','1567890010','Female',TO_DATE('22-04-2006','DD-MM-YYYY'),
'74263458541',3,2,2);

INSERT INTO tourist(tourist_id,fio,passport_num,sex,birthday_date,phone_number,hotel_id,group_id,tourist_category_id) 
VALUES (tourist_seq.nextval,'Losya Evgeniy Ivanovich','1238001340','Male',TO_DATE('01-03-1978','DD-MM-YYYY'),
'74261263126',3,2,2);

INSERT INTO tourist(tourist_id,fio,passport_num,sex,birthday_date,phone_number,hotel_id,group_id,tourist_category_id) 
VALUES (tourist_seq.nextval,'Adushkevich Artem valerievich','3478288990','Male',TO_DATE('06-04-2000','DD-MM-YYYY'),
'74262341566',5,3,1);
INSERT INTO tourist(tourist_id,fio,passport_num,sex,birthday_date,phone_number,hotel_id,group_id,tourist_category_id) 
VALUES (tourist_seq.nextval,'Tishenko Maksim Sergeevich','4235785540','Male',TO_DATE('19-01-2001','DD-MM-YYYY'),
'74262341566',6,3,2);

INSERT INTO tourist(tourist_id,fio,passport_num,sex,birthday_date,phone_number,hotel_id,group_id,tourist_category_id) 
VALUES (tourist_seq.nextval,'Buhlak Vladislav Dmitrievich','1233455490','Male',TO_DATE('12-06-2001','DD-MM-YYYY'),
'74262341566',9,4,1);

INSERT INTO tourist(tourist_id,fio,passport_num,sex,birthday_date,phone_number,hotel_id,group_id,tourist_category_id) 
VALUES (tourist_seq.nextval,'Stolyarov Igor Nikolaevich','1239365320','Male',TO_DATE('21-09-1983','DD-MM-YYYY'),
'74262341566',10,5,2);

INSERT INTO tourist(tourist_id,fio,passport_num,sex,birthday_date,phone_number,hotel_id,group_id,tourist_category_id) 
VALUES (tourist_seq.nextval,'Stolyarova Anastasiya Igorevna','1239365320','Male',TO_DATE('18-11-2008','DD-MM-YYYY'),
'74262341566',10,5,2);

COMMIT;

-- children
INSERT INTO children(tourist_id,companion_id) 
VALUES (3,4);
INSERT INTO children(tourist_id,companion_id) 
VALUES (9,8);

COMMIT;

-- Tourist hotel table
INSERT INTO tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) 
VALUES (1,1,TO_DATE('01-02-2023','DD-MM-YYYY'),TO_DATE('07-02-2023','DD-MM-YYYY'),105);
INSERT INTO tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) 
VALUES (2,6,TO_DATE('01-02-2023','DD-MM-YYYY'),TO_DATE('07-02-2023','DD-MM-YYYY'),210);
INSERT INTO tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) 
VALUES (3,12,TO_DATE('15-02-2023','DD-MM-YYYY'),TO_DATE('27-02-2023','DD-MM-YYYY'),585);
INSERT INTO tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) 
VALUES (4,12,TO_DATE('15-02-2023','DD-MM-YYYY'),TO_DATE('27-02-2023','DD-MM-YYYY'),585);
INSERT INTO tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) 
VALUES (5,30,TO_DATE('5-03-2023','DD-MM-YYYY'),TO_DATE('09-03-2023','DD-MM-YYYY'),200);
INSERT INTO tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) 
VALUES (6,33,TO_DATE('5-03-2023','DD-MM-YYYY'),TO_DATE('09-03-2023','DD-MM-YYYY'),205);
INSERT INTO tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) 
VALUES (7,50,TO_DATE('03-02-2023','DD-MM-YYYY'),TO_DATE('11-02-2023','DD-MM-YYYY'),306);
INSERT INTO tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) 
VALUES (8,54,TO_DATE('27-02-2023','DD-MM-YYYY'),TO_DATE('08-03-2023','DD-MM-YYYY'),210);
INSERT INTO tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) 
VALUES (9,54,TO_DATE('27-02-2023','DD-MM-YYYY'),TO_DATE('08-03-2023','DD-MM-YYYY'),990);

COMMIT;

-- agency

INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Future',1.2,1);
INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Legendary',1.4,1);
INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Picha',1.3,2);
INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Maestro',1.25,2);
INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Pizza',1.1,3);
INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Pasta',1.5,3);
INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Meed',1.35,4);
INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Krasto',1.4,4);
INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Kaef',1.2,5);
INSERT INTO agency(agency_id,AGENCY_NAME,cost_coefficient,city_id) 
VALUES (agency_seq.nextval,'Laan',1.1,5);

COMMIT;

-- excursion 
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Coliseum',1,50);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Coliseum',2,45);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Vatican',1,60);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Vatican',2,34);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Duomo',3,34);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Duomo',4,30);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'The Last Supper',3,45);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'The Last Supper',4,40);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'duomo cathedral',5,15);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'duomo cathedral',6,20);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'renaissance art',5,30);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'renaissance art',6,40);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Venice canals',7,45);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Venice canals',8,50);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'st marks square',7,40);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'st marks square',8,26);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Cavargio',9,36);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Cavargio',10,47);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Chapel',9,18);
INSERT INTO excursions(excursion_id,place,agency_id,cost) 
VALUES (excursion_seq.nextval,'Chapel',10,15);

COMMIT;
-- excursion_info table

INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,2,2,TO_DATE('03-02-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,2,3,TO_DATE('04-02-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,3,6,TO_DATE('20-02-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,3,8,TO_DATE('24-02-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,4,8,TO_DATE('24-02-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,4,6,TO_DATE('20-02-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,6,11,TO_DATE('07-03-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,6,9,TO_DATE('08-03-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,8,18,TO_DATE('03-03-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,8,19,TO_DATE('02-03-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,9,18,TO_DATE('03-03-2023','DD-MM-YYYY'));
INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date) 
VALUES (excursion_info_seq.nextval,9,19,TO_DATE('02-03-2023','DD-MM-YYYY'));

COMMIT;
-- Race type table

INSERT INTO race_type(race_type_id,type_name) 
VALUES (race_type_seq.nextval,'cargo');
INSERT INTO race_type(race_type_id,type_name) 
VALUES (race_type_seq.nextval,'cargo-passenger');

COMMIT;

-- flight schedule table

INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Moscow-Tallin',TO_DATE('31-01-2023 12:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('31-01-2023 16:34:00','DD-MM-YYYY HH24:MI:SS'),2,100);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Tallin-Roma',TO_DATE('31-01-2023 18:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('31-01-2023 20:47:00','DD-MM-YYYY HH24:MI:SS'),2,150);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Roma-Tallin',TO_DATE('08-02-2023 13:30:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('08-02-2023 16:17:00','DD-MM-YYYY HH24:MI:SS'),2,100);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Tallin-Moscow',TO_DATE('08-02-2023 18:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('08-02-2023 22:34:00','DD-MM-YYYY HH24:MI:SS'),2,150);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Moscow-Milano',TO_DATE('14-02-2023 13:30:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('14-02-2023 16:17:00','DD-MM-YYYY HH24:MI:SS'),2,250);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Milano-Moscow',TO_DATE('28-02-2023 18:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('28-02-2023 22:34:00','DD-MM-YYYY HH24:MI:SS'),2,250);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Moscow-Florence',TO_DATE('04-03-2023 13:30:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('04-03-2023 16:17:00','DD-MM-YYYY HH24:MI:SS'),2,220);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Florence-Moscow',TO_DATE('10-03-2023 18:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('10-03-2023 22:34:00','DD-MM-YYYY HH24:MI:SS'),2,220);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Moscow-Venice',TO_DATE('02-02-2023 13:30:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('02-02-2023 16:17:00','DD-MM-YYYY HH24:MI:SS'),2,300);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Venice-Moscow',TO_DATE('12-02-2023 18:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('12-02-2023 22:34:00','DD-MM-YYYY HH24:MI:SS'),2,300);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Moscow-Naples',TO_DATE('26-02-2023 13:30:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('26-02-2023 16:17:00','DD-MM-YYYY HH24:MI:SS'),2,270);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Naples-Moscow',TO_DATE('09-03-2023 18:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('09-03-2023 22:34:00','DD-MM-YYYY HH24:MI:SS'),2,270);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Venice-Moscow',TO_DATE('12-02-2023 18:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('12-02-2023 22:34:00','DD-MM-YYYY HH24:MI:SS'),1,150);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Florence-Moscow',TO_DATE('10-03-2023 18:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('10-03-2023 22:34:00','DD-MM-YYYY HH24:MI:SS'),1,130);
INSERT INTO flight_schedule(race_id,name,start_date,end_date,race_type_id,cost)
VALUES (flight_shecule_seq.nextval,'Roma-Moscow',TO_DATE('07-02-2023 18:00:00','DD-MM-YYYY HH24:MI:SS'),
TO_DATE('07-02-2023 22:34:00','DD-MM-YYYY HH24:MI:SS'),1,180);

COMMIT;
-- group_race table 
INSERT INTO group_race(group_id,race_id)
VALUES (1,1);
INSERT INTO group_race(group_id,race_id)
VALUES (1,2);
INSERT INTO group_race(group_id,race_id)
VALUES (1,3);
INSERT INTO group_race(group_id,race_id)
VALUES (1,4);
INSERT INTO group_race(group_id,race_id)
VALUES (2,5);
INSERT INTO group_race(group_id,race_id)
VALUES (2,6);
INSERT INTO group_race(group_id,race_id)
VALUES (3,7);
INSERT INTO group_race(group_id,race_id)
VALUES (3,8);
INSERT INTO group_race(group_id,race_id)
VALUES (4,9);
INSERT INTO group_race(group_id,race_id)
VALUES (4,10);
INSERT INTO group_race(group_id,race_id)
VALUES (5,11);
INSERT INTO group_race(group_id,race_id)
VALUES (5,12);

COMMIT;

--storage_type table

INSERT INTO storage_type(storage_type_id,storage_type_name)
VALUES(storage_type_seq.nextval,'Clothes');
INSERT INTO storage_type(storage_type_id,storage_type_name)
VALUES(storage_type_seq.nextval,'Car');
INSERT INTO storage_type(storage_type_id,storage_type_name)
VALUES(storage_type_seq.nextval,'Technique');

COMMIT;

-- storage table

INSERT INTO STORAGE (storage_id,tourist_id,storage_type_id,weight,package_cost,insurance_cost,storage_cost,total_cost)
VALUES (storage_seq.nextval,1,1,12,11,8,90,109);
INSERT INTO STORAGE (storage_id,tourist_id,storage_type_id,weight,package_cost,insurance_cost,storage_cost,total_cost)
VALUES (storage_seq.nextval,1,3,16,15,10,100,125);
INSERT INTO STORAGE (storage_id,tourist_id,storage_type_id,weight,package_cost,insurance_cost,storage_cost,total_cost)
VALUES (storage_seq.nextval,5,1,7,9,6,70,85);
INSERT INTO STORAGE (storage_id,tourist_id,storage_type_id,weight,package_cost,insurance_cost,storage_cost,total_cost)
VALUES (storage_seq.nextval,7,2,1000,90,78,400,568);
INSERT INTO STORAGE (storage_id,tourist_id,storage_type_id,weight,package_cost,insurance_cost,storage_cost,total_cost)
VALUES (storage_seq.nextval,1,1,17,23,16,90,129);

COMMIT;

-- race_storage
INSERT INTO RACE_STORAGE (race_id,STORAGE_ID)
VALUES(15,1);
INSERT INTO RACE_STORAGE (race_id,STORAGE_ID)
VALUES(15,2);
INSERT INTO RACE_STORAGE (race_id,STORAGE_ID)
VALUES(14,3);
INSERT INTO RACE_STORAGE (race_id,STORAGE_ID)
VALUES(13,4);
INSERT INTO RACE_STORAGE (race_id,STORAGE_ID)
VALUES(10,5);


COMMIT;