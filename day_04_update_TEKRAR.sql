use sys;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- id, isim ve irtibat fieldlarinin oldugu bir toptanci tablosu olusturun.
-- id field'ini Primary Key yapin.

create table tedarikci5(
id char(5) primary key,
isim varchar(25),
irtibat varchar(35)
);
-- tedarikci_id , urun_id , urun_isim , musteri_isim  fieldlari olan urun5
-- tablosu olusturun. Bu tablodaki tedarikci_id fieldini tedarik5 tablosunun
-- PK 'si ile Foreign Key yapin.

create table  urun5
(
tedarikci_id char(5),
urun_id char(5),
urun_isim varchar(25),
musteri_isim varchar(25),
constraint urun5_fk
foreign key (tedarikci_id)
references tedarikci5(id)


);

/*
constraint urun5_fk
foreign key (tedarikci_id)
references tedarikci5(id)
*/


INSERT INTO tedarikci5 VALUES(100, 'IBM', 'Ali Can');
INSERT INTO tedarikci5 VALUES(101, 'APPLE', 'Merve Temiz');
INSERT INTO tedarikci5 VALUES(102, 'SAMSUNG', 'Kemal Can');
INSERT INTO tedarikci5 VALUES(103, 'LG', 'Ali Can');
INSERT INTO urun5 VALUES(100, 1001,'Laptop', 'Suleyman');
INSERT INTO urun5 VALUES(101, 1002,'iPad', 'Fatma');
INSERT INTO urun5 VALUES(102, 1003,'TV', 'Ramazan');
INSERT INTO urun5 VALUES(103, 1004,'Phone', 'Ali Kan');

select*from tedarikci5;
select*from urun5;

drop table tedarikci5;
drop table urun5;
-- Ali Kan'in aldigi urunun ismini Apple olarak degistirin

update urun5
set urun_isim ='Apple'
where musteri_isim='Phone';

-- Irtibat'i Merve Temiz olan kaydin sirket ismini getirin
select isim
from tedarikci5
where irtibat='Merve Temiz';


/*
a) Urun5 tablosundan Ali Kan'in aldigi urunun ismini, 
tedarik5 tablosunda irtibat Merve Temiz olan 
sirketin ismi ile degistirin. */

update urun5
set urun_isim=(select isim from tedarikci5 where irtibat='Merve Temiz')
where musteri_isim='Ali Kan';

select*from tedarikci5;
select*from urun5;


update urun5
set urun_isim=
(select isim from tedarikci5
where irtibat='Merve Temiz')
where musteri_isim='Ali Kan';

/*a) tedarikci5 tablosundan Ali Can'in şirket ismini , 
urun5 tablosunda musteri_isimi Suleyman'in 
urun ismi ile degistirin. */

update tedarikci5
set isim=(select urun_isim from urun5 where musteri_isim='Suleyman')
where musteri_isim='Ali KAN';





update urun5
set urun_isim=(select isim from tedarikci5 where  irtibat='Kemal CAN')
where musteri_isim='Fatma';


update tedarikci5
set isim= (select urun_isim from urun5 where musteri_isim= 'Ramazan')
where irtibat='Merve Temiz';


update urun5
set urun_isim=(select isim from tedarikci5 where irtibat='Kemal Can')
where musteri_isim='Ramazan';


/*-------------------------------------------------------------------------
b) TV satin alan musterinin ismini, 
IBM'in irtibat'i ile degistirin.
-------------------------------------------------------------------------*/
update urun5
set musteri_isim=(select irtibat from tedarikci5 where isim='IBM')
where urun_isim='TV';


update urun5
set musteri_isim=(select irtibat from tedarikci5 where isim='IBM')
where urun_isim='TV';


/*-------------------------------------------------------------------------
1) cocuklar10 tablosu olusturun.
 Icinde id,isim,veli_isim ve grade field'lari olsun. 
 Id field'i Primary Key olsun.
 --------------------------------------------------------------------------*/
 
 
CREATE TABLE cocuklar10(
id INT,
isim VARCHAR(20),
veli_isim VARCHAR(10),
grade DOUBLE,
CONSTRAINT id_pk PRIMARY KEY (id)
);
/*-------------------------------------------------------------------------
 2)  Kayitlari tabloya ekleyin.
 (123, 'Ali Can', 'Hasan',75), 
 (124, 'Merve Gul', 'Ayse',85), 
 (125, 'Kemal Yasa', 'Hasan',85),
 (126, 'Rumeysa Aydin', 'Zeynep',85);
 (127, 'Oguz Karaca', 'Tuncay',85);
 (128, 'Resul Can', 'Tugay',85);
 (129, 'Tugay Kala', 'Osman',45);
 --------------------------------------------------------------------------*/
INSERT INTO cocuklar10 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO cocuklar10 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO cocuklar10 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO cocuklar10 VALUES(126, 'Rumeysa Aydin', 'Zeynep',85);
INSERT INTO cocuklar10 VALUES(127, 'Oguz Karaca', 'Tuncay',85);
INSERT INTO cocuklar10 VALUES(128, 'Resul Can', 'Tugay',85);
INSERT INTO cocuklar10 VALUES(129, 'Tugay Kala', 'Osman',45);
/*-------------------------------------------------------------------------
3)puanlar tablosu olusturun. 
ogrenci_id, ders_adi, yazili_notu field'lari olsun, 
ogrenci_id field'i Foreign Key olsun 
--------------------------------------------------------------------------*/
CREATE TABLE puanlar10(
ogrenci_id INT,
ders_adi VARCHAR(10),
yazili_notu DOUBLE,
CONSTRAINT puanlar10_fk 
FOREIGN KEY (ogrenci_id) 
REFERENCES cocuklar10 (id)
);
/*-------------------------------------------------------------------------
4) puanlar tablosuna kayitlari ekleyin
 ('123','kimya',75), 
 ('124','fizik',65),
 ('125','tarih',90),
 ('126','kimya',87),
 ('127','tarih',69),
 ('128','kimya',93),
 ('129','fizik',25)
--------------------------------------------------------------------------*/
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


INSERT INTO puanlar10 VALUES ('123','kimya',75);
INSERT INTO puanlar10 VALUES ('124','fizik',65);
INSERT INTO puanlar10 VALUES ('125','tarih',90);
INSERT INTO puanlar10 VALUES ('126','kimya',87);
INSERT INTO puanlar10 VALUES ('127','tarih',69);
INSERT INTO puanlar10 VALUES ('128','kimya',93);
INSERT INTO puanlar10 VALUES ('129','fizik',25);

select * from cocuklar10;
select * from puanlar10;
drop  table puanlar10;

/*-------------------------------------------------------------------------
5) Tum cocukların gratelerini puanlar tablosundaki yazılı notu  ile update edin. 
--------------------------------------------------------------------------*/
update cocuklar10
set grade=(select yazili_notu from puanlar10
where cocuklar10.id=puanlar10.ogrenci_id);

/*-------------------------------------------------------------------------
6) Ismi Kemal Yasa olan ogrencinin grade'ini puanlar tablosundaki 
ogrenci id'si 128 olan yazili notu ile update edin. 
--------------------------------------------------------------------------*/
update cocuklar10
set grade=(select yazili_notu from puanlar10 where ogrenci_id=128)
where isim='Kemal Yasa';
select* from cocuklar10;

/*-------------------------------------------------------------------------
7) Ders adi fizik olan kayitlarin yazili notunu Oguz Karaca'nin grade'i
ile update edin. 
--------------------------------------------------------------------------*/
update puanlar10
set yazili_notu=(select grade from cocuklar10 where isim='Oguz Karaca')
where ders_adi='Fizik';

/*-------------------------------------------------------------------------
8) Ali Can'in grade'ini, 124 ogrenci_id'li yazili_notu ile guncelleyin.
--------------------------------------------------------------------------*/
update cocuklar10
set grade=(select yazili_notu
from puanlar10 
where ogrenci_id=124)
where isim ='Ali Can';

/*-------------------------------------------------------------------------
9) Ders adi Kimya olan yazili notlarini Rumeysa Aydin'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/
update puanlar10
set yazili_notu=(select grade from cocuklar10 where isim='Rumeysa Aydin')
where ders_adi='kimya';


/*-------------------------------------------------------------------------
10) Ders adi tarih olan yazili notlarini Resul Can'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/
update puanlar10
set yazili_notu=(select grade from cocuklar10 where isim='Resul Can')
where ders_adi='tarih';


/*------------------------------------------------------------------------
Mart_satislar isimli bir tablo olusturun, 
icinde urun_id, musteri_isim, urun_isim ve urun_fiyat field'lari olsun
1) Ismi hatice olan musterinin urun_id'sini 30,urun_isim'ini Ford yapin 
2) Toyota marka araclara %10 indirim yapin 
3) Ismi Ali olanlarin urun_fiyatlarini %15 artirin 
4) Honda araclarin urun id'sini 50 yapin.
--------------------------------------------------------------------------*/

CREATE TABLE mart_satislar10
(
 urun_id int,
 musteri_isim varchar(20),
 urun_isim varchar(10),
 urun_fiyat int
);
INSERT INTO mart_satislar10 VALUES (10, 'Ali', 'Honda',75000);
INSERT INTO mart_satislar10 VALUES (10, 'Ayse', 'Honda',95200);
INSERT INTO mart_satislar10 VALUES (20, 'Hasan', 'Toyota',107500);
INSERT INTO mart_satislar10 VALUES (30, 'Mehmet', 'Ford', 112500);
INSERT INTO mart_satislar10 VALUES (20, 'Ali', 'Toyota',88000);
INSERT INTO mart_satislar10 VALUES (10, 'Hasan', 'Honda',150000);
INSERT INTO mart_satislar10 VALUES (40, 'Ayse', 'Hyundai',140000);
INSERT INTO mart_satislar10 VALUES (20, 'Hatice', 'Toyota',60000);

select*from mart_satislar10;

-- 1) Ismi Hatice olan musterinin urun_id'sini 30,urun_isim'ini Ford yapin 
	update mart_satislar10
	set urun_isim='Ford', urun_id=30
	where musteri_isim='Hatice';
	
	select * from mart_satislar10;
	drop table mart_satislar10;
    
-- 2) Toyota marka araclara %10 indirim yapin 

update mart_satislar10
set urun_fiyat= urun_fiyat* 0.9
where urun_isim='Toyata';

-- 3) Ismi Ali olanlarin urun_fiyatlarini %15 artirin 
update mart_satislar10
set urun_fiyat=urun_fiyat*1.15
where musteri_isim='Ali';
	

-- 4) Honda araclarin urun id'sini 50 yapin.
	
    update mart_satislar10
    set urun_id=50
    where urun_isim='Honda';
    





