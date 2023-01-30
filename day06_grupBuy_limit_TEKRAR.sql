use sys;

/* ======================== ALIASES ===========================
   Aliases kodu ile tablo yazdirilirken, field isimleri sadece
   o cikti icin degistirilebilir. sutunlar gecici degistirebilir
===============================================================*/
CREATE TABLE employees10
(
employee_id char(9),
employee_name varchar(50),
employee_birth_city varchar(50) 
);
INSERT INTO employees10 VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO employees10 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO employees10 VALUES(345678901, 'Mine Bulut', 'Izmir');


select*from employees10;

select employee_id as id, employee_name as name , employee_birth_city as city
from employees10;


/* ======================== GROUP BY CLAUSE ===========================
   Group By komutu sonuclari bir veya daha fazla sutuna gore
   gruplamak icin SELECT komutuyla birlikte kullanilir.
   
   GROUP BY komutu her grup basina bir satir dondurur.
   
   GROUP BY AGGREGATE fonksiyonlariyla birlikte kullanilir.
======================================================================*/  
CREATE TABLE manav10 (
    isim VARCHAR(50),
    urun_adi VARCHAR(50),
    urun_miktar INT
);

INSERT INTO manav10 VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav10 VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav10 VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav10 VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav10 VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav10 VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav10 VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav10 VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav10 VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav10 VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav10 VALUES( 'Ali', null, 2);
INSERT INTO manav10 VALUES( 'Ayse', 'Armut', 1);
INSERT INTO manav10 VALUES( 'Ayse', 'Elma', 4);
INSERT INTO manav10 VALUES( 'Ayse', null, 3);

select * from manav10;
select * from employees10;

-- 1) İsme gore, alinan urunlerin toplam kilosunu bulup, 
-- isim sirasina gore siralayin
select isim, sum(urun_miktar) as toplam_kg
from manav10
group by isim
order by isim;
-- 2) İsme gore, alinan urunlerin toplam kilosunu bulup, 
-- isim sirasina gore ters siralayin
select isim, sum(urun_miktar) as toplam_kg
from manav10
group by isim
order by isim desc;


-- 3 Bunlari bir de toplam kiloya gore ters sirali yapalim

select isim,sum(urun_miktar) as top_kg
from manav10
group by isim
order by top_kg desc;

-- 4) Urun ismine gore, urunu alan toplam kisi sayisini,
-- kisi sayisina gore siralayiniz.

select urun_adi, count(isim) kisi_sayisi
from manav10
group by urun_adi
order by kisi_sayisi;

-- 5) Alinan kilo miktarina gore musteri sayisini listeleyiniz.

select urun_miktar ,count(isim) musteri_sayisi
from manav10
group by urun_miktar
order by musteri_sayisi;

-- 6) Satilan meyve turune (urun_adi) gore urun alan kisi sayisini
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
select urun_adi ,count(isim) kisi_sayisi
from manav10
where urun_adi is not null
group by urun_adi
order by urun_adi;

-- 7) Satilan meyvenin 4 harfli olmasina  (urun_adi) gore urun alan kisi sayisini
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.

select urun_adi ,count(isim) kisi_sayisi
from manav10
where urun_adi like '____'
group by urun_adi
order by urun_adi;

-- 8) Satilan meyve turune (urun_adi) gore satilan (urun_miktari)
-- MIN ve MAX urun miktarlarini, MAX urun miktarina gore 
--  listeleyen OUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.

select urun_adi, max(urun_miktar)mak_mkt,min(urun_miktar)min_mkt
from manav10
where urun_adi is not null
group by urun_adi;



-- 9) Kisi ismine ve urun_adina gore satilan urunlerin toplamini
-- gruplandiran ve isime gore ters sirada listeleyen QUERY yaziniz.

select isim,urun_adi, sum(urun_miktar) top_kg
from manav10
group by isim,urun_adi
order by isim desc;
