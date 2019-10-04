drop table users;
set SERVEROUTPUT ON

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

insert into users(user_id,first_name,last_name,born_date,email,phone_number,fiscal_code)
    values(1,'Antonino','Scarfone','01-AGO-91','antoninoscarfone91@gmail.com',3661321710,'qwerty4326asdfgx');
insert into users(user_id,first_name,last_name,born_date,email,phone_number,fiscal_code)
    values(2,'Luciana','Uggetti','18-OTT-94','LucyLucy94@gmail.com',3331528719,'qwerty4326asdfgy');
insert into users(user_id,first_name,last_name,born_date,email,phone_number,fiscal_code)
    values(3,'Ilaria','Maggiolini','01-MAR-91','IlaMaggio1991@gmail.com',3661528000,'qwerty4426asdfgy');
insert into users(user_id,first_name,last_name,born_date,email,phone_number,fiscal_code)
    values(4,'Chiara','Saporito','06-LUG-94','ChiaSapo94@gmail.com',3661538056,'qwerty4ty6a778fgy');


commit;


