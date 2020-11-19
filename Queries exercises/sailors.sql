drop table if exists Sailors;
create table Sailors (
	sid SERIAL primary key,
	name varchar(100),
	rating integer,
	age integer
);

drop table if exists Boats;
create table Boats (
	bid SERIAL primary key,
	name varchar(100),
	color varchar(100)
);

drop table if exists Reserves;
create table Reserves (
	sid integer,
	bid integer,
	day date, 
	foreign key (sid) references Sailors (sid),
	foreign key (bid) references Boats (bid)
);

insert into Sailors (name, rating, age) values ('Jack Sparrow', 10, 40);
insert into Sailors (name, rating, age) values ('Will Turner', 6, 26);
insert into Sailors (name, rating, age) values ('Elizabeth Swann', 7, 24);
insert into Sailors (name, rating, age) values ('Mr. Gibbs', 9, 51);
insert into Sailors (name, rating, age) values ('Davey Jones', 10, 420);

insert into Boats (name, color) values ('Black Pearl', 'black');
insert into Boats (name, color) values ('Queen Annes Revenge', 'brown');
insert into Boats (name, color) values ('Blackbeards Delight', 'black');
insert into Boats (name, color) values ('Redbeards Delight', 'red');
insert into Boats (name, color) values ('Oceans Dagger', 'blue');

insert into Reserves (sid, bid, day) values (1, 1, '1/10/2017');
insert into Reserves (sid, bid, day) values (1, 1, '2/10/2017');
insert into Reserves (sid, bid, day) values (2, 1, '3/10/2017');
insert into Reserves (sid, bid, day) values (2, 4, '4/10/2017');
insert into Reserves (sid, bid, day) values (3, 2, '1/10/2017');
insert into Reserves (sid, bid, day) values (3, 2, '2/10/2017');
insert into Reserves (sid, bid, day) values (3, 2, '2/10/2017');
insert into Reserves (sid, bid, day) values (5, 1, '1/10/2017');
insert into Reserves (sid, bid, day) values (5, 2, '2/10/2017');
insert into Reserves (sid, bid, day) values (5, 3, '3/10/2017');
insert into Reserves (sid, bid, day) values (5, 4, '4/10/2017');
insert into Reserves (sid, bid, day) values (5, 5, '5/10/2017');