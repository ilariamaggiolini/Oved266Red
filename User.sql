drop table users;
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

    


