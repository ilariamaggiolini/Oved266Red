drop table train_capacity;

set serveroutput on;

create table train_capacity(
train_id integer references trains(train_id),
old_capacity integer,
new_capacity integer);

create or replace trigger capacity_update
after update of capacity on train
for each row
begin
    insert into train_capacity values(
        :old.train_id, :old.capacity, :new.capacity);
end capacity_update;
/


update trains
set capacity = capacity-1;

commit;