use sys;
/*================================== DELETE ============================================
DELETE FROM table_name komutu tablodaki tum recordlari siler.
Eger tum kayitlar silindikten sonra tabloyu gormek isterseniz size sadece bos bir tablo
gosterir. 
DELETE komutu sadece datalari siler, tabloyu silmez.
=======================================================================================*/

delete from mart_satislar10;

select*from mart_satislar10;

/*===============================================================================================
-- DELETE FROM tablo_adi;  Tablonun tum icerigini siler.
-- Bu komut bir DML komutudur. Dolayisiyla devaminda WHERE gibi cumlecikler
-- kullanilabilir.
    
    -- DELETE FROM tablo_adi
    -- WHERE field = veri;
    
--    DELETE FROM ogrenciler;     -- Tum verileri sil.
--    SAVEPOINT ABC;     -- Verilen konuma kodlari kaydeder.
--    ROLLBACK TO  ABC;  -- Silinen Verileri geri getir.
-- Bilgileri geri getirirken sikinti yasamamak icin ayarlar sql execution auto commit tiki kaldir
==================================================================================================*/ 

CREATE TABLE cucuklar10
(
id char(3),
isim varchar(50),
veli_isim varchar(50),
yazili_notu int,
CONSTRAINT cocuklar10_pk
PRIMARY KEY (id)
);
INSERT INTO cucuklar10 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO cucuklar10 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO cucuklar10 VALUES(125, 'Kemal Yasa', 'Ali',85);

SELECT * FROM cucuklar10;

-- Veli Ismi Ali ya da Ayse olan kaydi siliniz

delete from cucuklar10
where veli_isim='Ali' or veli_isim='Ayse';

delete from cucuklar10
where veli_isim in ('Ali','Ayse');

-- Yazili notu 84'ten buyuk olan cocuklari silin

delete from cucuklar10
where yazili_notu>84;

-- Yazili notu 85'ten farkli olan cocuklari silin

delete from cucuklar10
where not yazili_notu=85;

delete from cucuklar10
where  yazili_notu != 85;

delete from cucuklar10
where  yazili_notu <> 85;

drop table  cucuklar10;


-- ***************************************************************************

CREATE TABLE cocuk10
    (
        id CHAR(3),
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int
    );
    INSERT INTO cocuk10 VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO cocuk10 VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO cocuk10 VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO cocuk10 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO cocuk10 VALUES(127, 'Mustafa Bak', 'Can',99);

savepoint cicek; -- Bu satirda olusturdugumuz yeni bir alana bilgileri kaydediyoruz

select*from cocuk10;
-- id si 124 den buyuk olan kayitlari silin:

delete from cocuk10
where id>124; -- Bu satirda belli sartlari saglayan verileri sildik.
rollback to cicek; -- Bu satirda ise sildigimiz verileri kaydettigimiz alandan geri cagirdik.
