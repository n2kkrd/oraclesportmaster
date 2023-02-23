-- 1)Сформировать список туристов для таможни в целом и по указанной
--категории.
-- Список всех
SELECT fio,PASSPORT_NUM ,sex,BIRTHDAY_DATE ,PHONE_NUMBER  FROM TOURIST t;
-- По указанной категории
SELECT fio,PASSPORT_NUM ,sex,BIRTHDAY_DATE ,PHONE_NUMBER FROM TOURIST t
INNER JOIN TOURIST_CATEGORY tc ON tc.TOURIST_CATEGORY_ID = t.TOURIST_CATEGORY_ID 
WHERE tc.CATEGORY_NAME = 'shopping';

-- 2) Сформировать списки на расселение по указанным гостиницам в целом
--и указанной категории.
-- Всех
SELECT t.FIO ,h.HOTEL_NAME,rt.ROOM_TYPE_NAME,hr.ROOM_ID  FROM 
TOURIST t INNER JOIN 
TOURIST_HOTEL th ON th.TOURIST_ID = t.TOURIST_ID 
INNER JOIN HOTEL_ROOM hr ON hr.ROOM_ID  = th.ROOM_ID  
INNER JOIN ROOM_TYPE rt ON rt.ROOM_TYPE_ID = hr.ROOM_TYPE_ID 
INNER JOIN HOTEL h ON h.HOTEL_ID = hr.HOTEL_ID ;
-- По указанной категории
SELECT t.FIO ,h.HOTEL_NAME,rt.ROOM_TYPE_NAME,hr.ROOM_ID  FROM 
TOURIST t INNER JOIN 
TOURIST_HOTEL th ON th.TOURIST_ID = t.TOURIST_ID 
INNER JOIN HOTEL_ROOM hr ON hr.ROOM_ID  = th.ROOM_ID  
INNER JOIN ROOM_TYPE rt ON rt.ROOM_TYPE_ID = hr.ROOM_TYPE_ID 
INNER JOIN HOTEL h ON h.HOTEL_ID = hr.HOTEL_ID 
INNER JOIN TOURIST_CATEGORY tc ON tc.TOURIST_CATEGORY_ID = t.TOURIST_CATEGORY_ID 
WHERE tc.CATEGORY_NAME = 'excursion';

-- Получить количество туристов, побывавших в стране за определенный
--период в целом и по определенной категории.

SELECT count(*) AS "number of tourists"
FROM TOURIST t 
INNER JOIN "group" g 
ON t.GROUP_ID = g.GROUP_ID 
WHERE g.START_DATE BETWEEN TO_DATE('13-02-2023','DD-MM-YYYY') AND TO_DATE('28-02-2023','DD-MM-YYYY') OR 
g.END_DATE BETWEEN TO_DATE('13-02-2023','DD-MM-YYYY') AND TO_DATE('28-02-2023','DD-MM-YYYY');

-- Получить сведения о конкретном туристе: сколько раз был в стране,
--даты прилета/отлета, в каких гостиницах останавливался, какие экскурсии и в
--каких агентствах заказывал, какой груз сдавал.

SELECT t.FIO ,g.START_DATE , g.END_DATE , h.HOTEL_NAME , e.PLACE , a.AGENCY_NAME 
FROM TOURIST t INNER JOIN "group" g 
ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN HOTEL h ON h.HOTEL_ID = t.HOTEL_ID 
INNER JOIN EXCURSION_INFO ei ON ei.TOURIST_ID = t.TOURIST_ID 
INNER JOIN EXCURSIONS e ON e.EXCURSION_ID = ei.EXCURSION_ID 
INNER JOIN AGENCY a ON a.AGENCY_ID = e.AGENCY_ID 
WHERE t.PASSPORT_NUM = '423578554'
 
SELECT 'Количество посещений страны:',count(g.GROUP_ID) AS "number"
FROM TOURIST t2 
INNER JOIN "group" g ON t2.TOURIST_ID = g.GROUP_ID 
WHERE t2.PASSPORT_NUM  = '423578554'
GROUP BY g.GROUP_ID 

-- Получить список гостиниц, в которых производится расселение
-- туристов, с указанием количества занимаемых номеров и проживавших в них
-- человек за определенный период.
SELECT h.HOTEL_NAME, count(DISTINCT hr.ROOM_ID) AS "количество занимаемых номеров", count(hr.ROOM_ID) AS "количество проживающих людей"
FROM HOTEL h 
INNER JOIN HOTEL_ROOM hr ON h.HOTEL_ID = hr.HOTEL_ID 
INNER JOIN TOURIST_HOTEL th ON th.ROOM_ID = hr.ROOM_ID 
INNER JOIN ROOM_TYPE rt ON rt.ROOM_TYPE_ID = hr.ROOM_TYPE_ID
WHERE th.START_DATE BETWEEN TO_DATE('13-02-2023','DD-MM-YYYY') AND TO_DATE('28-02-2023','DD-MM-YYYY') OR 
th.END_DATE BETWEEN TO_DATE('13-02-2023','DD-MM-YYYY') AND TO_DATE('28-02-2023','DD-MM-YYYY')
GROUP BY h.HOTEL_NAME 

-- . Получить общее количество туристов, заказавших экскурсии за
--определенный период.

SELECT count(DISTINCT t.TOURIST_ID) AS "количество туристов и экскурсий"
FROM EXCURSION_INFO ei 
INNER JOIN TOURIST t ON ei.TOURIST_ID = t.TOURIST_ID 
WHERE EXCURSION_DATE BETWEEN TO_DATE('13-02-2023','DD-MM-YYYY') AND TO_DATE('28-02-2023','DD-MM-YYYY')

-- Выбрать самые популярные экскурсии и самые качественные
--экскурсионные агентства.

SELECT  e.PLACE , a.AGENCY_NAME  FROM EXCURSION_INFO ei
INNER JOIN EXCURSIONS e ON ei.EXCURSION_ID = e.EXCURSION_ID 
INNER JOIN AGENCY a ON a.AGENCY_ID = e.AGENCY_ID 
GROUP BY (ei.EXCURSION_ID,e.PLACE , a.AGENCY_NAME ) 
HAVING count(ei.EXCURSION_ID) = (SELECT max(count(*)) FROM EXCURSION_INFO ei2 GROUP BY ei2.EXCURSION_ID)
ORDER BY count(ei.EXCURSION_ID)

-- Получить данные о загрузке указанного рейса самолета на
--определенную дату: количество мест, вес груза, объемный вес.

SELECT fs.RACE_ID ,count(t.TOURIST_ID) AS "количество занятых мест",sum(s.WEIGHT) AS "общий вес груз" FROM FLIGHT_SCHEDULE fs 
INNER JOIN GROUP_RACE gr ON gr.RACE_ID = fs.RACE_ID 
INNER JOIN "group" g ON g.GROUP_ID = gr.GROUP_ID 
INNER JOIN TOURIST t ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN RACE_STORAGE rs ON rs.RACE_ID = fs.RACE_ID 
INNER JOIN STORAGE s ON s.STORAGE_ID = rs.STORAGE_ID 
WHERE fs.START_DATE = TO_DATE('2023-02-12 18:00:00','YYYY-MM-DD HH24:MI:SS') AND fs.RACE_ID = 10
GROUP BY fs.RACE_ID ;

-- Получить статистику о грузообороте склада: количество мест и вес
--груза, сданного за определенный период, количество самолетов, вывозивших
--этот груз, сколько из них грузовых, а сколько грузопассажирских.
--SELECT count(s.STORAGE_ID),count(DISTINCT rs.RACE_ID), RANK() OVER (PARTITION BY rs.RACE_ID ORDER BY rt.RACE_TYPE_ID),
--sum(DISTINCT (CASE WHEN rt.RACE_TYPE_ID = 2 THEN 1 ELSE 0 END))
--FROM STORAGE s 
--INNER JOIN RACE_STORAGE rs ON rs.STORAGE_ID = s.STORAGE_ID 
--INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = rs.RACE_ID 
--INNER JOIN RACE_TYPE rt ON rt.RACE_TYPE_ID = fs.RACE_TYPE_ID 
--
--SELECT *
--FROM STORAGE s 
--INNER JOIN RACE_STORAGE rs ON rs.STORAGE_ID = s.STORAGE_ID 
--INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = rs.RACE_ID 
--INNER JOIN RACE_TYPE rt ON rt.RACE_TYPE_ID = fs.RACE_TYPE_ID 


SELECT 'количество занятых мест', count(*)
FROM STORAGE s 
INNER JOIN RACE_STORAGE rs ON rs.STORAGE_ID = s.STORAGE_ID 
INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = rs.RACE_ID
WHERE fs.START_DATE BETWEEN TO_DATE('13-01-2023','DD-MM-YYYY') AND TO_DATE('28-03-2023','DD-MM-YYYY')
UNION 
SELECT 'количество вылетевших самолетов', count(DISTINCT rs.RACE_ID)
FROM STORAGE s 
INNER JOIN RACE_STORAGE rs ON rs.STORAGE_ID = s.STORAGE_ID 
INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = rs.RACE_ID
WHERE fs.START_DATE BETWEEN TO_DATE('13-01-2023','DD-MM-YYYY') AND TO_DATE('28-03-2023','DD-MM-YYYY')
UNION 
SELECT 'масса груза', sum(s.WEIGHT)
FROM STORAGE s 
INNER JOIN RACE_STORAGE rs ON rs.STORAGE_ID = s.STORAGE_ID 
INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = rs.RACE_ID
WHERE fs.START_DATE BETWEEN TO_DATE('13-01-2023','DD-MM-YYYY') AND TO_DATE('28-03-2023','DD-MM-YYYY')
UNION 
SELECT 'количество грузовых самолетов', count(DISTINCT rs.RACE_ID)
FROM STORAGE s 
INNER JOIN RACE_STORAGE rs ON rs.STORAGE_ID = s.STORAGE_ID 
INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = rs.RACE_ID
INNER JOIN RACE_TYPE rt ON rt.RACE_TYPE_ID = fs.RACE_TYPE_ID 
WHERE fs.START_DATE BETWEEN TO_DATE('13-01-2023','DD-MM-YYYY') AND TO_DATE('28-03-2023','DD-MM-YYYY') AND 
rt.TYPE_NAME = 'cargo'
UNION 
SELECT 'количество грузо-пассажирских самолетов', count(DISTINCT rs.RACE_ID)
FROM STORAGE s 
INNER JOIN RACE_STORAGE rs ON rs.STORAGE_ID = s.STORAGE_ID 
INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = rs.RACE_ID
INNER JOIN RACE_TYPE rt ON rt.RACE_TYPE_ID = fs.RACE_TYPE_ID 
WHERE fs.START_DATE BETWEEN TO_DATE('13-01-2023','DD-MM-YYYY') AND TO_DATE('28-03-2023','DD-MM-YYYY') AND 
rt.TYPE_NAME = 'cargo-passenger';


-- Получить полный финансовый отчет по указанной группе в целом
-- и для определенной категории туристов.

SELECT 'затраты на экскурсии',sum(e.COST*a.COST_COEFFICIENT) AS "sum"
FROM "group" g 
INNER JOIN TOURIST t 
ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN EXCURSION_INFO ei ON 
ei.TOURIST_ID = t.TOURIST_ID 
INNER JOIN EXCURSIONS e ON e.EXCURSION_ID = ei.EXCURSION_ID 
INNER JOIN AGENCY a ON a.AGENCY_ID = e.AGENCY_ID 
WHERE g.GROUP_ID = 2
GROUP BY g.GROUP_ID 
UNION 
SELECT 'затраты на хранение вещей на складе',sum(s.TOTAL_COST)
FROM "group" g 
INNER JOIN TOURIST t 
ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN STORAGE s ON s.TOURIST_ID = t.TOURIST_ID 
WHERE g.GROUP_ID = 2
GROUP BY g.GROUP_ID 
UNION 
SELECT 'затраты на гостиницу',sum(th.TOTAL_COST)
FROM "group" g 
INNER JOIN TOURIST t 
ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN TOURIST_HOTEL th 
ON th.TOURIST_ID = t.TOURIST_ID 
WHERE g.GROUP_ID = 2
GROUP BY g.GROUP_ID 
UNION 
SELECT 'затраты на на перелеты',sum(fs.COST)
FROM "group" g 
INNER JOIN TOURIST t 
ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN GROUP_RACE gr ON gr.GROUP_ID = g.GROUP_ID 
INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = gr.RACE_ID 
WHERE g.GROUP_ID = 2
GROUP BY g.GROUP_ID 

-- Финансовый отчет для группы экскурсий
SELECT 'затраты на экскурсии',sum(e.COST*a.COST_COEFFICIENT) AS "sum"
FROM "group" g 
INNER JOIN TOURIST t 
ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN EXCURSION_INFO ei ON 
ei.TOURIST_ID = t.TOURIST_ID 
INNER JOIN EXCURSIONS e ON e.EXCURSION_ID = ei.EXCURSION_ID 
INNER JOIN AGENCY a ON a.AGENCY_ID = e.AGENCY_ID 
WHERE g.GROUP_ID = 2 AND t.TOURIST_CATEGORY_ID = 2
GROUP BY g.GROUP_ID 
UNION 
SELECT 'затраты на хранение вещей на складе',sum(s.TOTAL_COST)
FROM "group" g 
INNER JOIN TOURIST t 
ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN STORAGE s ON s.TOURIST_ID = t.TOURIST_ID 
WHERE g.GROUP_ID = 2 AND t.TOURIST_CATEGORY_ID = 2
GROUP BY g.GROUP_ID 
UNION 
SELECT 'затраты на гостиницу',sum(th.TOTAL_COST)
FROM "group" g 
INNER JOIN TOURIST t 
ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN TOURIST_HOTEL th 
ON th.TOURIST_ID = t.TOURIST_ID 
WHERE g.GROUP_ID = 2 and t.TOURIST_CATEGORY_ID = 2
GROUP BY g.GROUP_ID 
UNION 
SELECT 'затраты на на перелеты',sum(fs.COST)
FROM "group" g 
INNER JOIN TOURIST t 
ON t.GROUP_ID = g.GROUP_ID 
INNER JOIN GROUP_RACE gr ON gr.GROUP_ID = g.GROUP_ID 
INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = gr.RACE_ID 
WHERE g.GROUP_ID = 2 AND t.TOURIST_CATEGORY_ID = 2
GROUP BY g.GROUP_ID 

-- Получить данные о расходах и доходах за определенный период:
--обслуживание самолета, гостиница, экскурсии, визы, расходы
--представительства и т.п.
SELECT (sum(e.COST*a.COST_COEFFICIENT) + sum(s.TOTAL_COST) + sum(fs.COST) + sum(th.TOTAL_COST)) AS "расходы", sum(g.TOUR_COST) AS "доходы"
FROM "group" g 
LEFT JOIN TOURIST t ON t.GROUP_ID = g.GROUP_ID 
LEFT JOIN TOURIST_HOTEL th ON th.TOURIST_ID = t.TOURIST_ID 
LEFT JOIN EXCURSION_INFO ei ON ei.TOURIST_ID = t.TOURIST_ID 
LEFT JOIN EXCURSIONS e ON e.EXCURSION_ID = ei.EXCURSION_ID 
LEFT JOIN AGENCY a ON a.AGENCY_ID = e.AGENCY_ID 
LEFT JOIN STORAGE s ON s.TOURIST_ID = t.TOURIST_ID 
LEFT JOIN GROUP_RACE gr ON gr.GROUP_ID = g.GROUP_ID 
LEFT JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = gr.RACE_ID 
WHERE g.START_DATE BETWEEN TO_DATE('13-01-2023','DD-MM-YYYY') AND TO_DATE('28-03-2023','DD-MM-YYYY') OR 
g.END_DATE BETWEEN TO_DATE('13-01-2023','DD-MM-YYYY') AND TO_DATE('28-03-2023','DD-MM-YYYY')

-- Получить статистику по видам отправляемого груза и удельную
--долю каждого вида в общем грузопотоке
SELECT st.STORAGE_TYPE_NAME ,count(s.STORAGE_TYPE_ID) AS "количество каждого вида", (count(s.STORAGE_TYPE_ID)/sum(count(s.STORAGE_TYPE_ID)) OVER()) * 100
AS "процентное соотношение ко всем грузам"
FROM STORAGE s 
INNER JOIN STORAGE_TYPE st 
ON st.STORAGE_TYPE_ID  = s.STORAGE_TYPE_ID 
GROUP BY st.STORAGE_TYPE_NAME 

-- Вычислить рентабельность представительства (соотношение
-- доходов и расходов).

SELECT ROUND("поступления"/"расходы"*100,2) AS "рентабельность %"
FROM (
SELECT (sum(e.COST*a.COST_COEFFICIENT) + sum(s.TOTAL_COST) + sum(fs.COST) + sum(th.TOTAL_COST)) AS "расходы", sum(g.TOUR_COST) AS "поступления"
FROM "group" g 
LEFT JOIN TOURIST t ON t.GROUP_ID = g.GROUP_ID 
LEFT JOIN TOURIST_HOTEL th ON th.TOURIST_ID = t.TOURIST_ID 
LEFT JOIN EXCURSION_INFO ei ON ei.TOURIST_ID = t.TOURIST_ID 
LEFT JOIN EXCURSIONS e ON e.EXCURSION_ID = ei.EXCURSION_ID 
LEFT JOIN AGENCY a ON a.AGENCY_ID = e.AGENCY_ID 
LEFT JOIN STORAGE s ON s.TOURIST_ID = t.TOURIST_ID 
LEFT JOIN GROUP_RACE gr ON gr.GROUP_ID = g.GROUP_ID 
LEFT JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = gr.RACE_ID ) tab

-- Определить процентное отношение отдыхающих туристов к
--туристам shop-туров в целом и за указанный период (например, в зависимости
--от времени года).

-- В общем случае
SELECT (sum(CASE WHEN t.TOURIST_CATEGORY_ID = 2 THEN 1 ELSE 0 END)/sum(CASE WHEN t.TOURIST_CATEGORY_ID = 1 THEN 1 ELSE 0 END)) * 100
FROM TOURIST t 
 
-- За определенный период
SELECT (sum(CASE WHEN t.TOURIST_CATEGORY_ID = 2 THEN 1 ELSE 0 END)/sum(CASE WHEN t.TOURIST_CATEGORY_ID = 1 THEN 1 ELSE 0 END)) * 100
FROM TOURIST t 
INNER JOIN "group" g ON g.GROUP_ID = t.GROUP_ID 
WHERE g.START_DATE BETWEEN TO_DATE('13-01-2023','DD-MM-YYYY') AND TO_DATE('28-03-2023','DD-MM-YYYY') OR 
g.END_DATE BETWEEN TO_DATE('13-01-2023','DD-MM-YYYY') AND TO_DATE('28-03-2023','DD-MM-YYYY');

--Получить сведения о туристах указанного рейса: список группы,
--гостиницы, груз, бирки, маркировка.
SELECT t.FIO AS "FIO" , g.GROUP_ID AS "Group Number" , h.HOTEL_NAME AS "Hotel_name", st.STORAGE_TYPE_NAME AS "Cargo type", s.WEIGHT, s.STORAGE_ID AS "Docs number" 
FROM TOURIST t 
INNER JOIN "group" g ON g.GROUP_ID = t.GROUP_ID 
INNER JOIN GROUP_RACE gr ON gr.GROUP_ID = g.GROUP_ID 
INNER JOIN FLIGHT_SCHEDULE fs ON fs.RACE_ID = gr.RACE_ID
LEFT JOIN RACE_STORAGE rs ON rs.RACE_ID = fs.RACE_ID 
INNER JOIN STORAGE s ON rs.STORAGE_ID = s.STORAGE_ID 
INNER JOIN TOURIST_HOTEL th ON th.TOURIST_ID = t.TOURIST_ID 
INNER JOIN HOTEL_ROOM hr ON hr.ROOM_ID = th.ROOM_ID 
INNER JOIN HOTEL h ON h.HOTEL_ID = hr.HOTEL_ID 
INNER JOIN STORAGE_TYPE st ON st.STORAGE_TYPE_id = s.STORAGE_TYPE_ID 
WHERE fs.RACE_ID = 10;
