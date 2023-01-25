use sys;
/*================================== DELETE ============================================
DELETE FROM table_name komutu tablodaki tum recordlari siler.
Eger tum kayitlar silindikten sonra tabloyu gormek isterseniz size sadece bos bir tablo
gosterir. 
DELETE komutu sadece datalari siler, tabloyu silmez.
=======================================================================================*/

delete from mart_satislar;

select*from mart_satislari;

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

CREATE TABLE cucuklar
(
id char(3),
isim varchar(50),
veli_isim varchar(50),
yazili_notu int,
CONSTRAINT cocuklar_pk
PRIMARY KEY (id)
);
INSERT INTO cucuklar VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO cucuklar VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO cucuklar VALUES(125, 'Kemal Yasa', 'Ali',85);

SELECT * FROM cucuklar;

-- Veli Ismi Ali ya da Ayse olan kaydi siliniz

delete from cucuklar
where veli_isim='Ali' or veli_isim='Ayse';

delete from cucuklar
where veli_isim in ('Ali','Ayse');

-- Yazili notu 84'ten buyuk olan cocuklari silin

delete from cucuklar
where yazili_notu>84;

-- Yazili notu 85'ten farkli olan cocuklari silin

delete from cucuklar
where not yazili_notu=85;

delete from cucuklar
where  yazili_notu != 85;

delete from cucuklar
where  yazili_notu <> 85;

drop table  cucuklar;


-- ***************************************************************************

CREATE TABLE cocuk
    (
        id CHAR(3),
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int
    );
    INSERT INTO cocuk VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO cocuk VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO cocuk VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO cocuk VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO cocuk VALUES(127, 'Mustafa Bak', 'Can',99);

savepoint cicek; -- Bu satirda olusturdugumuz yeni bir alana bilgileri kaydediyoruz

select*from cocuk;
-- id si 124 den buyuk olan kayitlari silin:

delete from cocuk
where id>124; -- Bu satirda belli sartlari saglayan verileri sildik.
rollback to cicek; -- Bu satirda ise sildigimiz verileri kaydettigimiz alandan geri cagirdik.



