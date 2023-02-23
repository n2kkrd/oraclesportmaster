-- триггер который не даёт заселить клиента в день выселения другого

create or replace trigger tourist_rooms_trigger
    before insert on tourist_hotel
    for each row
Declare 
    is_needed_room_exists NUMBER;
    
    cursor curs_is_needed_room_exists IS 
    select 1
    from tourist_hotel
    where room_id = :new.room_id and end_date = :new.start_date;
    err exception;
begin
    open curs_is_needed_room_exists;
    fetch curs_is_needed_room_exists into is_needed_room_exists;
    IF is_needed_room_exists = 1 THEN
    raise err;
    END IF;
EXCEPTION 
    WHEN err THEN
    raise_application_error(-20001, 'Вы не можете заселить клиента в день выселения другого');
END;

insert into tourist_hotel(tourist_id,room_id,start_date,end_date,total_cost) values(7,30,TO_DATE('09-03-2023','DD-MM-YYYY'),TO_DATE('12-03-2023','DD-MM-YYYY'),330);

-- триггер который сам подсчитывает общую сумму клиента за хранение груза

create or replace NONEDITIONABLE trigger total_cost_storage_trigger
    before insert on storage
    for each row
Declare 
    PRAGMA AUTONOMOUS_TRANSACTION;
begin
    :new.total_cost := :new.package_cost + :new.insurance_cost + :new.storage_cost;
END;


insert into storage(storage_id,tourist_id,storage_type_id,weight,package_cost,insurance_cost,storage_cost)
values(storage_seq.nextval,1,1,12,13,14,15);

select * from storage;
