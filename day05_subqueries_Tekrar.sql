
use sys;

/*================================= SUBQUERY =================================
	Sorgu icinde calisan sorguya SUBQUERY (ALT SORGU) denir.
============================================================================*/

CREATE TABLE personel20
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel20 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO personel20 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO personel20 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO personel20 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO personel20 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO personel20 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO personel20 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');



CREATE TABLE sirketler20
(
sirket_id int,
sirket varchar(20),
personel_sayisi int
);
INSERT INTO sirketler20 VALUES(100, 'Honda', 12000);
INSERT INTO sirketler20 VALUES(101, 'Ford', 18000);
INSERT INTO sirketler20 VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler20 VALUES(103, 'Toyota', 21000);


SELECT * FROM personel20;
SELECT * FROM sirketler20;

-- ======================== WHERE ile SUBQUERY ===========================
/*----------------------------------------------------------------
 1) Personel sayisi 15.000'den cok olan sirketlerin isimlerini
 ve bu sirkette calisan personelin isimlerini listeleyin
----------------------------------------------------------------*/

-- 1. Adim: Personel sayisi 15000'den buyuk olan sirketleri listeleyiniz

select sirket
from sirketler20
where personel_sayisi>15000;


-- 2. Adim: Ford ve Toyota da calisan personeli listeleyiniz
select isim
from personel20
where sirket in('Toyata','Ford');

-- 3. Adim: Personel sayisi 15000 'den fazla olan sirketleri ve bu sirketlerde calisan personeli listeleyiniz.

select isim,sirket
from personel20
where sirket in (select sirket from sirketler20 where personel_sayisi>15000) ;



-- Honda sirketinin personel sayisini 16000 'e cikaralim.

update sirketler20
set personel_sayisi=16000
where sirket='Honda';

/*----------------------------------------------------------------
 2) Sirket_id'si 101'den buyuk olan sirketlerin 
 maaslarini ve sehirlerini listeleyiniz
----------------------------------------------------------------*/

select maas,sehir,sirket
from personel20
where sirket in(select sirket from sirketler20 where sirket_id>101);


/*----------------------------------------------------------------                
  3) Ankara'daki sirketlerin sirket id ve personel 
  sayilarini listeleyiniz.
----------------------------------------------------------------*/
select sirket_id,personel_sayisi
from sirketler20
where sirket in(select sirket from personel20 where sehir='Ankara');



/*----------------------------------------------------------------                
  4) Veli Yılmaz isimli personelin calistigi sirketlerin sirket ismini ve personel sayilarini listeleyiniz
 
----------------------------------------------------------------*/
select sirket,personel_sayisi
from sirketler20
where sirket in (select sirket from personel20 where isim='Veli Yilmaz');
	

/* ======================== SELECT ile SUBQUERY ===========================
  SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sütunlar(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlar(record) getirsin
  
 * Yazdigimiz QUERY'lerde SELECT satirinda field isimleri kullaniyoruz.
  Dolayisiyla eger SELECT satirinda bir SUBQUERY yazacaksak sonucun
  tek bir field donmesi gerekir.
  
  * SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir.
=> Interview Question : Subquery'i Select satirinda kullanirsaniz ne ile 
kullanmaniz gerekir?
=========================================================================*/

/*----------------------------------------------------------------
 SORU 1- Her sirketin ismini, personel sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
select sirket,personel_sayisi,(select avg(maas)from personel20 where sirketler20.sirket=personel20.sirket)
from sirketler20;

/*----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

select sirket,(select max(maas)from personel20 where personel20.sirket=sirketler20.sirket)
from sirketler20;

-- SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde
-- bulundugunu listeleyen bir QUERY yaziniz.

select sirket_id,sirket,(select count(sehir)from personel20 where personel20.sirket=sirketler20.sirket )toplam_sehir
from sirketler20;

-- SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve 
-- toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.

select sirket_id,sirket,(select count(sehir)from personel20 where personel20.sirket=sirketler20.sirket)toplam_sehir
from sirketler20
where sirket_id>101;

select sirket_id,sirket,(select count(sehir) from personel20 where sirketler20.sirket=personel20.sirket)toplam_sehir
from sirketler20
where sirket_id>101;

-- SORU 5- Her sirketin ismini,personel sayisini ve personelin 
-- aldigi max. ve min. maasi listeleyen bir QUERY yazin.
select sirket,personel_sayisi,(select max(maas)from personel20 where sirketler20.sirket=personel20.sirket) max_maas,
							  (select min(maas)from personel20 where sirketler20.sirket=personel20.sirket )min_maas
from sirketler20;



/*----------------------------------------------------------------
SORU 6- Her sirketin ismini ve personel sayisini ve iscilere
odedigi toplam maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
select sirket,personel_sayisi,(select sum(maas)from personel20 where sirketler20.sirket=personel20.sirket)top_maas
from sirketler20;
-- Ismi Veli Yılmaz olan personelin toplam maasi nekadar 

select*,(select sum(maas)from personel20 where isim='Ali Seker' )top_maas
from personel20
where isim='Ali Seker';

