call dbms_output.enable();

-- Функция которая, подсчитывает количество дней проживания в отелях определенного туриста, за определенный период
create or replace function get_count_of_staying_days(
    in_tourist_id NUMBER,
    from_date date,
    to_date date default sysdate
) RETURN NUMBER IS

    days_lived NUMBER DEFAULT 0;
    CURSOR curs_required_days IS
        SELECT th.start_date, th.end_date
        from tourist t 
        inner join tourist_hotel th
        on th.tourist_id = t.tourist_id
        where t.tourist_id = in_tourist_id ;
        
    needed_days curs_required_days%rowtype;
    err EXCEPTION;
    wrong_interval_err EXCEPTION;
BEGIN
    open curs_required_days;
    fetch curs_required_days INTO needed_days;
    IF curs_required_days%notfound THEN
        RAISE err;
    END IF;
    LOOP
        EXIT when curs_required_days%notfound;
        IF needed_days.start_date < from_date OR needed_days.end_date > to_date THEN 
            RAISE wrong_interval_err;
        END IF;
        
        days_lived := days_lived + (needed_days.end_date - needed_days.start_date);
    FETCH curs_required_days INTO needed_days;
    END LOOP;
    
    RETURN days_lived;
EXCEPTION
        WHEN timeout_on_resource THEN
            raise_application_error(
                                   100,
                                   'Waiting interval exceeded'
            );
        WHEN value_error THEN
            raise_application_error(
                                   -20004,
                                   'Error in the conversion operation or mathematical operation!'
            );
        WHEN err THEN
            dbms_output.put_line('This client didn''t stay at the hotel');
            RETURN NULL;
        WHEN wrong_interval_err THEN
            dbms_output.put_line('This client didn''t stay at the hotel during selected period of time.');
            RETURN NULL;
END get_count_of_staying_days;

select get_count_of_staying_days(2, TO_DATE('31-01-2023 13:23:56','DD-MM-YYYY HH24:MI:SS'),TO_DATE('31-01-2023 11:23:56','DD-MM-YYYY HH24:MI:SS'))
from dual;

-- функция считающая общее время в воздухе(перелетов) определенной группы

create or replace function get_flying_minutes(
    in_group_id NUMBER
) RETURN NUMBER IS

    minutes_flying NUMBER DEFAULT 0;
    CURSOR curs_required_minutes IS
        select fs.start_date,fs.end_date
        from group_race gr
        inner join flight_schedule fs on gr.race_id = fs.race_id
        where gr.group_id = in_group_id;
        
    needed_minutes curs_required_minutes%rowtype;
    err EXCEPTION;
BEGIN
    open curs_required_minutes;
    fetch curs_required_minutes INTO needed_minutes;
    IF curs_required_minutes%notfound THEN
        RAISE err;
    END IF;
    LOOP
        EXIT when curs_required_minutes%notfound;
        
        minutes_flying := minutes_flying + (needed_minutes.end_date - needed_minutes.start_date)*24*60;
    FETCH curs_required_minutes INTO needed_minutes;
    END LOOP;
    
    RETURN minutes_flying;
EXCEPTION
        WHEN timeout_on_resource THEN
            raise_application_error(
                                   100,
                                   'Waiting interval exceeded'
            );
        WHEN value_error THEN
            raise_application_error(
                                   -20004,
                                   'Error in the conversion operation or mathematical operation!'
            );
        WHEN err THEN
            dbms_output.put_line('Group dont fly');
            RETURN NULL;
END get_flying_minutes;

select get_flying_minutes(2) from dual;

