
create table usak_il(
sira_no int unique,
pbik char(7) unique,
rütbe varchar(20),
isim varchar(20) not null,
maas double
);
select * from usak_il;
drop table usak_il;

insert into usak_il values(1,'2306553', 'Assubay', 'Hasan Sen', '22500.00');
insert into usak_il values(2,'2306564', 'Uzman', 'Mustafa Sagir', '15500.00');
insert into usak_il values(3,'2306575', 'Subay', 'Haluk Bilginer', '16300.00');
insert into usak_il values(4,'2306586', 'Sozlesmeli Er', 'Mehmet Karabacak', '14200.00');
insert into usak_il values(5,'2306597', 'Sivil Memur', 'Erdal Kaynar', '14800.00');
insert into usak_il (isim,sira_no,rütbe,pbik) values('Omer Ak', '6', 'Yarbay', '2401547');
insert into usak_il values(7,'2306599', 'Sivil Memur', 'Erdal Ateş', '14200.00');
insert into usak_il values(8,'2306501', 'Assubay', 'Osman Kara', '14400.00');
insert into usak_il values(10,'2306502', 'Subay', 'Omer Toprak', '10000.00');
insert into usak_il values(9,'2306503', 'Sozlesmeli Er', 'Ali Kara', '11200.00');
insert into usak_il values(12,'2306504', 'Sivil Memur', 'Mehmet Ak', '9000.00');
insert into usak_il values(11,'2306505', 'Sivil Memur', 'Ferdi İnal', '8000.00');


-- Soru 1: usak_il tablosundaki datalari rütbeye göre gore siralayin :

	SELECT rütbe,isim
	FROM usak_il
	ORDER BY rütbe;
    
-- Soru 2: usak_il tablosundaki datalari maasa göre sıralayalım

select *
from usak_il
where maas
order by maas;

CREATE TABLE isciler50
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO isciler50 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO isciler50 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO isciler50 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO isciler50 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO isciler50 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO isciler50 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO isciler50 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');


-- 1) Isme gore toplam maaslari bulun

select isim ,sum(maas) toplam_maas
from isciler50
group by isim;
-- select isim,sum(maas) from isciler group by isim ;

-- 2) Sehre gore toplam isci sayisini bulun
select sehir ,count(isim) isci_sayisi
from isciler50
group by sehir;

-- select sehir,count(id) from isciler group by sehir ;


-- 3) Sirketlere gore maasi 5000 liradan fazla olan isci sayisini bulun

select sirket, count(isim)isci_sayisi
from isciler50
where maas>5000
group by sirket;

-- select sirket,count(id) as isci_sayisi from isciler where maas >5000  group by sirket ;

-- 4) Her sirket icin Min ve Max maasi bulun
select sirket,min(maas)min_maas,max(maas)max_maas
from isciler50
group by sirket;




