-- процедура для jobs которая добавляет строку в таблицу EXCURSION INFO
create or replace procedure insert_values_for_jobs IS
BEGIN
    INSERT INTO excursion_info(id,tourist_id,excursion_id,excursion_date)
    VALUES (excursion_info_seq.nextval,1,1,TO_DATE('12-01-2023','DD-MM-YYYY'));
    COMMIT;
END;

exec insert_values_for_jobs;

-- Создание простого jobs для примера, который каждую минуту добавляет строку в таблицу
begin
    dbms_scheduler.create_schedule(
        schedule_name => 'simple_schedule',
        start_date => systimestamp,
        repeat_interval => 'FREQ=MINUTELY;INTERVAL=1;'
        );
end;

begin 
dbms_scheduler.create_program (
    program_name => 'simple_program',
    program_type => 'STORED_PROCEDURE',
    program_action => 'insert_values_for_jobs',
    enabled => TRUE
);
END;

BEGIN 
    DBMS_SCHEDULER.CREATE_JOB
    ( job_name => 'example_job',
    program_name => 'simple_program',
    schedule_name => 'simple_schedule',
    Enabled => True);
END;

-- Запуск jobs
begin
DBMS_SCHEDULER.ENABLE('example_job');
end;

-- Спустя три минуты можно заметить, три добавленные одинаковые строки
select * from excursion_info