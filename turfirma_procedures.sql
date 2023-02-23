call dbms_output.enable();
-- Процедура выводящая фио туриста по его id 

create or replace procedure print_tourist(
    in_tourist_id Number   
)
IS
    r_fio VARCHAR2(100);
begin 
    select fio
    into r_fio
    from tourist
    where tourist_id = in_tourist_id;

DBMS_OUTPUT.PUT_LINE(r_fio);
EXCEPTION 
    WHEN OTHERS THEN 
        dbms_output.put_line( SQLERRM );
END;

EXEC print_tourist(3);

-- Вывести всех туристов старше определенного возраста

create or replace procedure print_touris_older(
    in_year_num Number   
)
IS
    CURSOR curs_tourist_fio IS 
    SELECT fio
    from tourist
    where trunc(months_between(sysdate, birthday_date)/12) > in_year_num;
begin 
    for fio in curs_tourist_fio LOOP
    EXIT WHEN curs_tourist_fio%notfound;
    DBMS_OUTPUT.PUT_LINE(fio.fio);
END LOOP;
EXCEPTION 
    WHEN OTHERS THEN 
        dbms_output.put_line( SQLERRM );
END;

EXEC print_touris_older(40);
