﻿use master;
drop database if exists Kolokvij_vjezba_11;
go
create database Kolokvij_vjezba_11;
go
use Kolokvij_vjezba_11;




-- 0 --
create table neprijatelj(
	sifra int not null primary key identity(1,1),
	narukvica int not null,
	novcica decimal(12,8) not null,
	bojakose varchar(39) not null,
	gustoca decimal(14,10),
	introvertno bit not null,
	asocijalno bit
);

create table muskarac(
	sifra int not null primary key identity(1,1),
	maraka decimal(16,5),
	novcica decimal(13,10),
	nausnica int,
	narukvica int not null,
	gustoca decimal(12,6),
	neprijatelj int not null
);

create table mladic(
	sifra int not null primary key identity(1,1),
	ogrlica int not null,
	stilfrizura varchar(35),
	drugiputa datetime not null,
	hlace varchar(41) not null
);

create table punac(
	sifra int not null primary key identity(1,1),
	jmbag char(11),
	kuna decimal(16,5) not null,
	vesta varchar(45) not null
);

create table punac_mladic(
	sifra int not null primary key identity(1,1),
	punac int not null,
	mladic int not null
);

create table svekrva(
	sifra int not null primary key identity(1,1),
	narukvica int not null,
	carape varchar(39) not null,
	haljina varchar(31),
	punac int not null
);

create table djevojka(
	sifra int not null primary key identity(1,1),
	kratkamajica varchar(45) not null,
	prstena int,
	ekstrovertno bit not null,
	majica varchar(42) not null,
	introvertno bit not null,
	svekrva int
);

create table punica(
	sifra int not null primary key identity(1,1),
	carape varchar(33) not null,
	drugiputa datetime,
	majica varchar(40) not null,
	haljina varchar(30) not null,
	bojakose varchar(37) not null,
	djevojka int not null
);

alter table muskarac add foreign key(neprijatelj) references neprijatelj(sifra);
alter table punica add foreign key(djevojka) references djevojka(sifra);
alter table djevojka add foreign key(svekrva) references svekrva(sifra);
alter table svekrva add foreign key(punac) references punac(sifra);
alter table punac_mladic add foreign key(punac) references punac(sifra);
alter table punac_mladic add foreign key(mladic) references mladic(sifra);

-- 1 --
insert into djevojka(kratkamajica, ekstrovertno, majica, introvertno, svekrva)
values  
	('Crven', 1, 'Zelena', 0, 1),
	('Zuta', 1, 'Plava', 0, 2),
	('Crna', 0, 'Crna', 1, 3);
        
select * from svekrva;
insert into svekrva(narukvica, carape, punac)
values  
	(3, 'Crvene', 1),
	(1, 'Zute', 2),
	(2, 'Crne', 3);
        
select * from punac_mladic;
insert into punac_mladic(punac, mladic)
values  
	(3, 3),
	(2, 2),
	(1, 1);

-- 2 --   
update muskarac set novcica =15.70;

-- 3 --
delete from punica where drugiputa ='2020-04-30';

-- 4 -- 
select haljina from svekrva where carape like '%ana%';

-- 5 --
select a.drugiputa , f.haljina , e.prstena 
from mladic a 
inner join punac_mladic    b on a.sifra     = b. mladic
inner join punac           c on b.punac     = c.sifra
inner join svekrva         d on c.sifra     = d.punac
inner join djevojka        e on d.sifra     = e.svekrva
inner join punica          f on e.sifra     = f.djevojka
where d.carape like 'a%' and c.kuna =21
order by e.prstena desc;

-- 6 --
select	a.kuna, a.vesta 
from	punac a left join punac_mladic b on b.punac = a.sifra 
where	b.punac is null;