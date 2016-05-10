drop database if exists shopping;
create database shopping;
use shopping;
drop table if exists MovieInfo;
create table MovieInfo(
id int primary key  auto_increment not null,
file varchar(20) not null unique,
price float not null,
intro varchar(300) not null,
day varchar(30) not null
);
drop table if exists User;
create table User(
id int primary key  auto_increment not null,
name varchar(100) not null,
email varchar(100) not null,
password varchar(100) not null,
real_name varchar(100) not null,
real_address varchar(200)not null,
real_postcode varchar(100)not null,
real_phone varchar(100) not  null
);

insert into MovieInfo(file,price,intro,day)
            values('001 (1).jpg','89.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (2).jpg','99.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (3).jpg','109.9','this very good','2015-11-26');
 insert into MovieInfo(file,price,intro,day)
            values('001 (4).jpg','89.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (5).jpg','99.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (6).jpg','109.9','this very good','2015-11-26'); 
insert into MovieInfo(file,price,intro,day)
            values('001 (7).jpg','89.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (8).jpg','99.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (9).jpg','109.9','this very good','2015-11-26');
 insert into MovieInfo(file,price,intro,day)
            values('001 (10).jpg','89.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (11).jpg','99.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (12).jpg','109.9','this very good','2015-11-26');  
 insert into MovieInfo(file,price,intro,day)
            values('001 (13).jpg','109.9','this very good','2015-11-26');
 insert into MovieInfo(file,price,intro,day)
            values('001 (14).jpg','89.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (15).jpg','99.9','this very good','2015-11-26');
insert into MovieInfo(file,price,intro,day)
            values('001 (16).jpg','109.9','this very good','2015-11-26');  
            
 
            
            
            
