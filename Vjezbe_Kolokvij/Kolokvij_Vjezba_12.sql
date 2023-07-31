﻿use master;
drop database if exists Kolokvij_vjezba_12;
go
create database Kolokvij_vjezba_12;
go
use Kolokvij_vjezba_12;



-- 0 --
create table zena(
	sifra int not null primary key identity(1,1),
	eura decimal(16,6) not null,
	indiferentno bit,
	novcica decimal(15,5)
);

create table decko(
	sifra int not null primary key identity(1,1),
	hlace varchar(46),
	asocijalno bit,
	stilfrizura varchar(43) not null,
	indiferentno bit not null,
	ogrlica int,
	zena int not null
);

create table sestra(
	sifra int not null primary key identity(1,1),
	lipa decimal(15,9),
	ogrlica int,
	kratkamajica varchar(43) not null
);

create table zarucnica(
	sifra int not null primary key identity(1,1),
	hlace varchar(48) not null,
	kratkamajica varchar(46) not null,
	jmbag char(11),
	nausnica int
);

create table zarucnica_sestra(
	sifra int not null primary key identity(1,1),
	zarucnica int not null,
	sestra int not null
);

create table svekrva(
	sifra int not null primary key identity(1,1),
	maraka decimal(14,7),
	kuna decimal(15,8),
	vesta varchar(44),
	asocijalno bit not null,
	ekstrovertno bit,
	zarucnica int
);

create table djevojka(
	sifra int not null primary key identity(1,1),
	modelnaocala varchar(34) not null,
	vesta varchar(40) not null,
	kratkamajica varchar(39) not null,
	suknja varchar(36) not null,
	bojaociju varchar(32) not null,
	prestena int not null,
	svekrva int not null
);

create table prijatelj(
	sifra int not null primary key identity(1,1),
	lipa decimal(16,10),
	asocijalno bit,
	stilfrizura varchar(37),
	kuna decimal(14,6),
	modelnaocala varchar(38),
	djevojka int
);

alter table decko add foreign key(zena) references zena(sifra);
alter table prijatelj add foreign key(djevojka) references djevojka(sifra);
alter table djevojka add foreign key(svekrva) references svekrva(sifra);
alter table svekrva add foreign key(zarucnica) references zarucnica(sifra);
alter table zarucnica_sestra add foreign key(zarucnica) references zarucnica(sifra);
alter table zarucnica_sestra add foreign key(sestra) references sestra(sifra);

-- 1 --
insert into djevojka(modelnaocala, vesta, kratkamajica, suknja, bojaociju, prestena, svekrva)
values  
	('Ray-ban', 'Crvena', 'Crvena', 'Crvena', 'Smedja', 2, 1),
	('Morello', 'Crna', 'Crna', 'Crna', 'Plava', 1, 2),
	('Gucci', 'Plava', 'Zuta', 'Zuta', 'Zelena', 3, 3);
        
insert into svekrva(asocijalno, zarucnica)
values  
	(1, 1),
	(0, 2),
	(0, 3);
        
insert into zarucnica_sestra(zarucnica, sestra)
values  
	(1, 3),
	(2, 2),
	(3, 1);

-- 2 --
update decko set asocijalno = 0; 

-- 3 --
delete from prijatelj where asocijalno = 0;

-- 4 --
select vesta from svekrva where kuna not in(8,13,20,28,35);

-- 5 --
select a.kratkamajica , f.kuna , e.vesta 
from sestra a 
inner join zarucnica_sestra b on a.sifra      =b.sestra 
inner join zarucnica        c on b.zarucnica  =c.sifra 
inner join svekrva          d on c.sifra      =d.zarucnica 
inner join djevojka         e on d.sifra      =e.svekrva 
inner join prijatelj        f on e.sifra      =f.sifra
where d.kuna >87 and c.kratkamajica like '%ba%&'
order by e.vesta desc;

-- 6 --
select	a.kratkamajica , a.jmbag 
from	zarucnica a left join zarucnica_sestra b on b.zarucnica=a.sifra 
where	b.zarucnica = null;