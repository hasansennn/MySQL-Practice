use sys;

/* ======================== EXISTS CONDITION ===========================
EXISTS Condition subquery'ler ile kullanilir. IN ifadesinin kullanimina
benzer olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen 
degerlerin icerisinde bir degerin olmasi veya olmamasi durumunda islem 
yapilmasini saglar.
======================================================================*/
CREATE TABLE mayis_satislar10
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO mayis_satislar10 VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar10 VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar10 VALUES (20, 'John', 'Toyota');
INSERT INTO mayis_satislar10 VALUES (30, 'Amy', 'Ford');
INSERT INTO mayis_satislar10 VALUES (20, 'Mark', 'Toyota');
INSERT INTO mayis_satislar10 VALUES (10, 'Adem', 'Honda');
INSERT INTO mayis_satislar10 VALUES (40, 'John', 'Hyundai');
INSERT INTO mayis_satislar10 VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan_satislar10
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO nisan_satislar10 VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar10 VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar10 VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar10 VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar10 VALUES (20, 'Mine', 'Toyota');


select*from mayis_satislar10;
select*from nisan_satislar10;

/*----------------------------------------------------------------
SORU 1 : Her iki ayda da ayni id ile satilan urunlerin urun_id'lerini
ve urunleri mayis ayinda alanlarin isimlerini getiren bir query yaziniz.
----------------------------------------------------------------*/ 

select urun_id,musteri_isim
from mayis_satislar10
where urun_id in(select urun_id from nisan_satislar10 where mayis_satislar10.urun_id=nisan_satislar10.urun_id);

select urun_id,musteri_isim
from mayis_satislar10
where exists(select urun_id from nisan_satislar10 where mayis_satislar10.urun_id=nisan_satislar10.urun_id);

/*----------------------------------------------------------------
SORU 2 : Her iki ayda da satilan urun_isimleri ayni urunlerin,
urun_isim'ini ve urunleri nisan ayinda alan musterilerin isimlerini 
getiren bir Query yaziniz.
----------------------------------------------------------------*/ 

select urun_isim,musteri_isim
from nisan_satislar10
where urun_isim in (select urun_isim from mayis_satislar10 where mayis_satislar10.urun_isim=nisan_satislar10.urun_isim);

select urun_isim,musteri_isim
from nisan_satislar10
where exists (select urun_isim from mayis_satislar10 where mayis_satislar10.urun_isim=nisan_satislar10.urun_isim);

/*----------------------------------------------------------------
SORU 3 : Nisan ayinda satilip mayis ayinda satilmayan urun ismini ve
satin alan kisiyi listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
select urun_isim,musteri_isim
from nisan_satislar10
where  not exists (select urun_isim from mayis_satislar10 where nisan_satislar10.urun_isim=mayis_satislar10.urun_isim);

/*----------------------------------------------------------------
SORU 4 : Mayis ayinda satilip nisan ayinda satilmayan urun id ve
satin alan kisiyi listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/

select urun_id,urun_isim
from mayis_satislar10
where not exists (select urun_id from nisan_satislar10 where nisan_satislar10.urun_isim=mayis_satislar10.urun_isim);

-- delete from mayis_satislar10;
-- delete from nisan_satislar10;

/* ======================== IS NULL CONDITION ===========================
    Arama yapilan field'da NULL degeri almis kayitlari getirir.
======================================================================*/
CREATE TABLE insanlar10
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar10 VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar10 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar10 VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar10 (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar10 (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar10;

-- Ismi null olan kayitlari listeleyin :

select isim
from insanlar10
where isim is null;
-- Ismi null olan kayitlari 'Isimsiz' olarak guncelleyin :

UPDATE insanlar10
SET isim = 'Isimsiz'
WHERE isim IS NULL;

-- Ismi 'Isimsiz' olan kayitlari silin :

DELETE FROM insanlar10
WHERE isim = 'Isimsiz';

-- Ismi null olan kayitlari silin :

DELETE FROM insanlar10
WHERE isim IS NULL;

/* ======================== ORDER BY ===========================
=> ORDER BY komutu belli bir field'a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir.
=> ORDER BY komutu sadece SELECT komutu ile kullanilir.
=> ORDER BY komutuna ozel olarak, siralama yapacagimiz field ismi yerine 
field sirasini da yazabiliriz.
=> Isimleri natural order'a gore siralamak icin sorgunun sonuna 
 ORDER BY (field_name) yazmak yeterlidir.
=> Isimleri ters siralama ile yazdirmak isterseniz DESC yaziyoruz.
=> Ayni degerde olan kayitlari, tablodaki kayit sirasina gore getirir.
==============================================================*/
CREATE TABLE insanciklar10
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
INSERT INTO insanciklar10 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanciklar10 VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanciklar10 VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanciklar10 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanciklar10 VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanciklar10 VALUES (345678901, 'Ali','Yilmaz', 'Istanbul');

SELECT * FROM insanciklar10;
-- Soru 1: Insanciklar10 tablosundaki datalari adres'e gore siralayin :

	SELECT *
	FROM insanciklar10
	ORDER BY adres;
    
-- Soru 2: Isim' i Mine olanlari soyisim sirali olarak listeleyen Query yaziniz.

select *
from insanciklar10
where isim='Mine'
order by soyisim;

-- Soru 3: Insanciklar tablosundaki soyismi BULUT olanlari isim sirali olarak listeleyin.

select*
from insanciklar10
where soy_isim='Bulut'
order by isim;

-- Soru 4: Insanciklar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin.

select*
from insanciklar10
order by ssn desc;

-- Soru 5: Insanciklar tablosundaki tum kayitlari SSN numarasina gore siralayin.

select*
from insanciklar10
order by ssn;


-- Soru 6: Insanciklar tablosundaki tum kayitlari Soyisimler ters sirali, 
-- isimler Natural sirali olarak listeleyin.

	select *
	from insanciklar10
	order by soyisim desc,isim ;


-- Soru 7: Insanciklar tablosundaki tum kayitlari adresler ters sirali, 
-- isimler ters sirali olarak listeleyin. 
	select *
	from insanciklar10
	order by adres desc,isim desc ;


-- Soru 8: Insanciklar tablosundaki tum kayitlari adresler ters sirali, 
-- isimler ters sirali, soyisimler ters sirali olarak listeleyin.

select*
from insanciklar10
order by adres desc,soyisim desc;
