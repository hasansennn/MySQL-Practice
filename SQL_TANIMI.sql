/*

SQL NEDİR? (Yapılandırılmış Sorgu Dili)

SQL (Structured Query Language), veri tabanı yönetim sistemlerinde kullanılan bir programlama dildir. SQL ile veri tabanındaki verilerin seçilmesi, eklenmesi, güncellenmesi ve silinmesi gibi işlemler yapılabilir. Ayrıca veri tabanı yapısının oluşturulması ve yönetilmesi de SQL komutları ile yapılabilir.
SQL veri tabanı yönetim sistemlerinde kullanılır. Özellikle, çok sayıda verinin saklandığı ve yönetildiği alanlarda, SQL veri tabanı yönetim sistemleri kullanılır. Örnek olarak:
•	İşletmelerde müşteri, ürün, satış ve fatura verilerinin yönetimi
•	E-ticaret sitelerinde ürün, sipariş ve müşteri verilerinin yönetimi
•	Sağlık sektöründe hasta, tedavi, ilaç ve fatura verilerinin yönetimi
•	Finans sektöründe müşteri, hesap, işlem ve rapor verilerinin yönetimi
•	Eğitim sektöründe öğrenci, öğretmen, ders ve not verilerinin yönetimi
ve daha birçok alanda SQL veri tabanı yönetim sistemi kullanılır.
  
Excellden farkı nedir?

Excel ve SQL arasındaki en önemli fark, veri yönetim yöntemleridir. Excel, bir veri tablosu olarak kullanılır ve veriler hücreler içinde saklanır. Veri yönetimi işlemleri genellikle el ile yapılır ve formüller, filtreleme ve sıralama gibi işlemler kullanılır.
SQL ise veri tabanı yönetim sistemleri için tasarlanmış bir programlama dilidir. Veriler, tablolarda saklanır ve SQL komutları kullanılarak veri yönetimi işlemleri yapılır. Veri yönetimi işlemleri otomatik olarak yapılabilir ve veriler arasındaki ilişkiler daha iyi anlaşılabilir. SQL ile büyük veri setleri arasında arama ve analiz yapmak daha kolaydır.
Diğer bir fark, Excel verilerinin yerel olarak saklandığı yerde, SQL verileri genellikle bir veri tabanı sunucusunda saklanır. Bu nedenle SQL verileri daha güvenli ve daha kolay yedeklenebilir.

En çok kullanılan KOMUTLAR;

SQL (Structured Query Language) için en çok kullanılan komutlar arasında SELECT, INSERT, UPDATE ve DELETE komutları yer alır.
SELECT komutu veritabanındaki verileri sorgulamak için kullanılır. Örneğin, "SELECT * FROM Customers" komutu tüm müşteri bilgilerini gösterir.
INSERT komutu veritabanına yeni veri eklemek için kullanılır. Örneğin, "INSERT INTO Customers (Name, City, Country) VALUES ('Alfred', 'Berlin', 'Germany')" komutu veritabanına yeni bir müşteri ekler.
UPDATE komutu veritabanındaki mevcut verileri güncellemek için kullanılır. Örneğin, "UPDATE Customers SET City = 'Hamburg' WHERE Country = 'Germany'" komutu Almanya'daki tüm müşterilerin şehir bilgisini Hamburg olarak değiştirir.
DELETE komutu veritabanından veri silmek için kullanılır. Örneğin, "DELETE FROM Customers WHERE Name = 'Alfred'" komutu adı Alfred olan müşteriyi veritabanından siler.

CRUD, veritabanı işlemleri için kullanılan kısaltmalardan biridir ve "Create, Read, Update, and Delete" (Oluştur, Oku, Güncelle ve Sil) anlamına gelir. Bu işlemler veritabanı için temel işlemlerdir ve genellikle SQL dilleri ile gerçekleştirilir.
CREATE: Veritabanına yeni bir veri eklemek için kullanılan SQL komutlarıdır. Örneğin, "INSERT INTO Customers (Name, City, Country) VALUES ('Alfred', 'Berlin', 'Germany')" komutu veritabanına yeni bir müşteri ekler.
READ: Veritabanındaki verileri okumak için kullanılan SQL komutlarıdır. Örneğin, "SELECT * FROM Customers" komutu tüm müşteri bilgilerini gösterir.
UPDATE: Veritabanındaki mevcut verileri güncellemek için kullanılan SQL komutlarıdır. Örneğin, "UPDATE Customers SET City = 'Hamburg' WHERE Country = 'Germany'" komutu Almanya'daki tüm müşterilerin şehir bilgisini Hamburg olarak değiştirir.
DELETE: Veritabanından veri silmek için kullanılan SQL komutlarıdır. Örneğin, "DELETE FROM Customers WHERE Name = 'Alfred'" komutu adı Alfred olan müşteriyi veritabanından siler.









*/
