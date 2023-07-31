﻿use master;
drop database if exists Kolokvij_vjezba_18;
go
create database Kolokvij_vjezba_18;
go
use Kolokvij_vjezba_18;



-- 0 --
create table ostavljena(
	sifra int not null primary key identity(1,1),
	novcica decimal(18,9),
	drugiputa datetime not null,
	dukserica varchar(35),
	kratkamajica varchar(34),
	djevojka int not null
);

create table djevojka(
	sifra int not null primary key identity(1,1),
	bojaociju varchar(43) not null,
	treciputa datetime not null,
	carape varchar(32) not null
);

create table prijatelj(
	sifra int not null primary key identity(1,1),
	novcica decimal(15,9),
	ekstrovertno bit not null,
	bojakose varchar(30) not null,
	haljina varchar(37),
	narukvica int
);

create table muskarac(
	sifra int not null primary key identity(1,1),
	treciputa datetime,
	nausnica int not null,
	drugiputa datetime not null,
	prstena int not null,
	modelnaocala varchar(34)
);

create table muskarac_prijatelj(
	sifra int not null primary key identity(1,1),
	muskarac int not null,
	prijatelj int not null
);

create table mladic(
	sifra int not null primary key identity(1,1),
	carape varchar(50) not null,
	jmbag char(11),
	hlace varchar(50) not null,
	treciputa datetime,
	drugiputa datetime not null,
	muskarac int
);

create table sestra(
	sifra int not null primary key identity(1,1),
	eura decimal(14,10),
	indiferentno bit,
	maraka decimal(13,8),
	ogrlica int,
	haljina varchar(31) not null,
	introvertno bit,
	mladic int
);

create table zarucnica(
	sifra int not null primary key identity(1,1),
	carape varchar(43),
	treciputa datetime not null,
	eura decimal(16,8),
	sestra int
);

alter table ostavljena add foreign key(djevojka) references djevojka(sifra);
alter table zarucnica add foreign key(sestra) references sestra(sifra);
alter table sestra add foreign key(mladic) references mladic(sifra);
alter table mladic add foreign key(muskarac) references muskarac(sifra);
alter table muskarac_prijatelj add foreign key(muskarac) references muskarac(sifra);
alter table muskarac_prijatelj add foreign key(prijatelj) references prijatelj(sifra);

-- 1 --
insert into sestra(haljina)
values  
	('Zuta'),
	('Crvena'),
	('Zelena');

insert into mladic(carape, hlace, drugiputa)
values  
	('Crne', 'Crne', '2022-06-18'),
	('Zelene', 'Zelene', '2019-08-21'),
	('Crvene', 'Crvene', '2019-10-01');

insert into muskarac_prijatelj(muskarac, prijatelj)
values  
	(2, 3),
	(1, 1),
	(3, 2);

-- 2 --
update ostavljena set drugiputa = '2016-04-07';

-- 3 --
delete from zarucnica where treciputa = '2015-04-18';

-- 4 --
select hlace from mladic where jmbag is null;

-- 5 --
select a.bojakose , f.sestra , e.indiferentno
from prijatelj a
inner join muskarac_prijatelj   b on a.sifra      = b.prijatelj 
inner join muskarac             c on b.muskarac   = c.sifra
inner join mladic               d on c.sifra      = d.muskarac 
inner join sestra               e on d.sifra      = e.mladic
inner join zarucnica            f on e.sifra      = f.sestra
where d.jmbag is null  and c.nausnica = 213
order by e.indiferentno desc;

-- 6 --
select	a.nausnica , a.drugiputa 
from	muskarac a left join muskarac_prijatelj b on b.muskarac = a.sifra
where	b.muskarac is null;