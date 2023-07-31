use master;
drop database if exists Kolokvij_vjezba_5;
go
create database Kolokvij_vjezba_5;
go
use Kolokvij_vjezba_5;



-- 0 --
create table zarucnik(
	sifra int not null primary key identity(1,1),
	jmbag char(11),
	lipa decimal(12,8),
	indiferentno bit not null
);

create table mladic(
	sifra int not null primary key identity(1,1),
	kratkamajica varchar(48) not null,
	haljina varchar(30) not null,
	asocijalno bit,
	zarucnik int
);

create table cura(
	sifra int not null primary key identity(1,1),
	carape varchar(41) not null,
	maraka decimal(17,10) not null,
	asocijalno bit,
	vesta varchar(47) not null
);

create table svekar(
	sifra int not null primary key identity(1,1),
	bojakose varchar(33),
	majica varchar(31),
	carape varchar(31) not null,
	haljina varchar(43),
	narukvica int,
	eura decimal(14,5) not null
);

create table svekar_cura(
	sifra int not null primary key identity(1,1),
	svekar int not null,
	cura int not null
);

create table punac(
	sifra int not null primary key identity(1,1),
	dukserica varchar(33),
	prviputa datetime not null,
	majica varchar(36),
	svekar int not null
);

create table punica(
	sifra int not null primary key identity(1,1),
	hlace varchar(43) not null,
	nausnica int not null,
	ogrlica int,
	vesta varchar(49) not null,
	modelnaocala varchar(31) not null,
	treciputa datetime not null,
	punac int not null
);

create table ostavljena(
	sifra int not null primary key identity(1,1),
	majica varchar(33),
	ogrlica int not null,
	carape varchar(44),
	stilfrizura varchar(42),
	punica int not null
);

alter table mladic add foreign key(zarucnik) references zarucnik(sifra);
alter table ostavljena add foreign key(punica) references punica(sifra);
alter table punica add foreign key(punac) references punac(sifra);
alter table punac add foreign key(svekar) references svekar(sifra);
alter table svekar_cura add foreign key(svekar) references svekar(sifra);
alter table svekar_cura add foreign key(cura) references cura(sifra);

-- 1 --
insert into svekar(carape,eura)
values  
('Crne', 19.99),
('Crvene', 10.92),
('Smedje', 63.20);

insert into punac(prviputa,svekar)
values 
('2010-01-05', 1),
('2011-02-01', 2),
('2012-03-05', 3);

insert into svekar_cura(svekar,cura)
values 
(1, 3),
(2, 2),
(3, 1);

-- 2 --
update mladic set haljina = 'Osijek';

-- 3 --
delete from ostavljena where ogrlica = 17; 

-- 4 --
select majica from punac where prviputa is null;

-- 5 --
select a.asocijalno , f.stilfrizura , e.nausnica 
from cura a
inner join svekar_cura     b on a.sifra      = b.cura
inner join svekar          c on b.svekar     = c.sifra
inner join punac           d on c.sifra      = d.svekar
inner join punica          e on d.sifra      = e.punac
inner join ostavljena      f on e. sifra     = f.punica
where d.prviputa is not null and c.majica like '%ba%'
order by e.nausnica desc;

-- 6 --
select	a.majica , a.carape 
from	svekar a left join svekar_cura b on a.sifra = b.svekar
where	b.svekar is null;