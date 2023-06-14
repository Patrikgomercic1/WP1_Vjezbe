use master;
drop database if exists fakultet;
go
create database fakultet;
go
use fakultet;


create table student(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	kolegij int
);

create table kolegij(
	sifra int not null primary key identity(1,1),
	naziv varchar(30),
	trajanje time
);

create table rok(
	sifra int not null primary key identity(1,1),
	datum datetime
);

create table student_rok(
	student int,
	rok int
);


alter table student_rok add foreign key (student) references student(sifra);
alter table student_rok add foreign key (rok) references rok(sifra);
alter table student add foreign key (kolegij) references kolegij(sifra);


insert into kolegij(sifra,naziv,trajanje)
values
	(1,'Diplomski studij francuskog jezika i književnosti', null),
	(2,'Diplomski studij francuskog jezika i književnosti, smjer prevoditeljski',null),
	(3,'Diplomski studij francuskog jezika i književnosti',null);

insert into student(sifra,ime,prezime,oib,kolegij)
values
	(1,'Luka','Damijanoviæ','07133009293','Terminologija','1'),
	(2,'Matea','Ljubièiæ','81793066166','Francuski jezik VIII ','2'),
	(3,'Lana','Brkiæ','93480161331','Europske institucije i meðunarodne organizacije','3')


update student set prezime='Ravliæ' where sifra=2

--drop database if exists fakultet;
