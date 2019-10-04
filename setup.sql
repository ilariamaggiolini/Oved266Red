--cleaning--
drop table tickets;
drop table trains;
drop sequence users_seq;
drop sequence trains_seq;
drop sequence tickets_seq;
drop table history_users;
drop trigger name_update;
drop table users;


--creazione users--
create sequence users_seq start with 1 increment by 1;
create table users (
user_id integer 
    constraint user_pk primary key,
first_name varchar2(30)
    constraint user_first_name_nn not null,
last_name varchar2(30)
    constraint user_last_name_nn not null,
born_date date
    constraint user_born_date_nn not null,
email varchar2(50)
    constraint user_email_nn not null,
phone_number integer
    constraint user_phone_number_nn not null,
registration_date date default sysdate,
fiscal_code varchar2(20)
    constraint user_fiscal_code_uq unique);

insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Luciana', 'Uggetti', '18-OTT-94', 'aaaa@aa.it', 0000001232453, 'lcnggt');
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Antonino', 'Scarfone', '01-AGO-91', 'aaaa@aa.it', 0000001232453, 'antsrf');
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Chiara', 'Saporito', '06-LUG-94', 'aaaa@aa.it', 0000001232453, 'sprchr');
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Ilaria', 'Maggiolini', '01-MAR-91', 'aaaa@aa.it', 0000001232453, 'mggllr');
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Paolo', 'Riva', '10-APR-92', 'aaaa@aa.it', 0000001232453, 'plorva');  
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Sergio', 'Evangelista', '17-GEN-94', 'aaaa@aa.it', 0000001232453, 'evnsrg');  
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Edoardo', 'Errani', '17-SET-93', 'aaaa@aa.it', 0000001232453, 'rrnedr');  
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Alessandro', 'Armato', '21-NOV-91', 'aaaa@aa.it', 0000001232453, 'rmtlsn');  
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Zhanao', 'Wu', '11-DIC-90', 'aaaa@aa.it', 0000001232453, 'zhnaowu');  
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Marco', 'Blanco', '13-MAG-92', 'aaaa@aa.it', 0000001232453, 'blcmrc');  
insert into users (user_id, first_name, last_name, born_date, email, phone_number, fiscal_code)
    values (users_seq.nextval, 'Giovanni', 'Maggi', '03-FEB-91', 'aaaa@aa.it', 0000001232453, 'mgggvn');  

--creazione trains--
create sequence trains_seq start with 1000 increment by 100;
create table trains (
    train_id integer primary key,
    capacity integer default 250
        constraint capacity_ck check(capacity > = 0),
    path varchar2 (20)
        constraint path_uq unique,
    firstclass_price integer,
    secondclass_price integer);
    
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Mi_Ro', 70, 50);
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Mi_Fi', 60, 40);
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Mi_Rc', 120, 100);
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Mi_Ba', 100, 80);
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Mi_Ge', 50, 30);
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Ro_Mi', 70, 50);
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Fi_Mi', 60, 40);
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Rc_Mi', 120, 100);
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Ba_Mi', 100, 80);
insert into trains (train_id, path, firstclass_price, secondclass_price) 
    values (trains_seq.nextval, 'Ge_Mi', 50, 30);

---creazione tickets---
create sequence tickets_seq start with 100 increment by 1;
create table tickets (
    ticket_id integer primary key,
    class_ticket integer,
    train_id integer
        constraint ticket_train_id_fk references trains (train_id) on delete cascade,
    user_id integer
        constraint ticket_user_id_fk references users (user_id) on delete cascade
        );
    
insert into tickets values (tickets_seq.nextval, 1 , (select train_id from trains where path = 'Mi_Fi'), (select user_id from users where last_name = 'Maggiolini'));
insert into tickets values (tickets_seq.nextval, 2 , (select train_id from trains where path = 'Mi_Ge'), (select user_id from users where last_name = 'Uggetti'));
insert into tickets values (tickets_seq.nextval, 1 , (select train_id from trains where path = 'Fi_Mi'), (select user_id from users where last_name = 'Maggi'));
insert into tickets values (tickets_seq.nextval, 1 , (select train_id from trains where path = 'Mi_Ro'), (select user_id from users where last_name = 'Saporito'));
insert into tickets values (tickets_seq.nextval, 2 , (select train_id from trains where path = 'Rc_Mi'), (select user_id from users where last_name = 'Armato'));
insert into tickets values (tickets_seq.nextval, 1 , (select train_id from trains where path = 'Mi_Ba'), (select user_id from users where last_name = 'Wu'));
insert into tickets values (tickets_seq.nextval, 1 , (select train_id from trains where path = 'Mi_Rc'), (select user_id from users where last_name = 'Scarfone'));
insert into tickets values (tickets_seq.nextval, 2 , (select train_id from trains where path = 'Ge_Mi'), (select user_id from users where last_name = 'Errani'));
insert into tickets values (tickets_seq.nextval, 1 , (select train_id from trains where path = 'Ro_Mi'), (select user_id from users where last_name = 'Riva'));
insert into tickets values (tickets_seq.nextval, 2 , (select train_id from trains where path = 'Ba_Mi'), (select user_id from users where last_name = 'Evangelista'));

--trigger update--
set serveroutput on;
create table history_users(
    user_id integer references users(user_id),
    old_first_name varchar2(20),
    new_first_name varchar2(20),
    day date);
    
create or replace trigger name_update
before update of first_name on users
for each row
begin
    insert into history_users values(
        :old.user_id, :old.first_name, :new.first_name, sysdate);
end name_update;
/

update users
set first_name = 'Luciano'
where user_id = 1;



--commit--
commit;
