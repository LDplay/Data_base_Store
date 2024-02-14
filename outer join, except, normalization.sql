---1.
SELECT Product.Name AS Название_товара, Producer.Name AS Производитель
FROM Product
LEFT OUTER JOIN Producer ON Product.id_producer = Producer.id;

---2.
SELECT Category.Name AS Название_категории
FROM Category
LEFT OUTER JOIN Product ON Category.id = Product.id_category
WHERE Product.id_category IS NULL;

---3.
SELECT Region.name AS Название_области
FROM Region
LEFT JOIN (
    SELECT DISTINCT City.id_region
    FROM City
    JOIN Address ON City.id = Address.id_city
    JOIN Producer ON Address.id = Producer.id_address
) AS ProducersByRegion ON Region.id = ProducersByRegion.id_region
WHERE ProducersByRegion.id_region IS NULL

EXCEPT

SELECT Region.name
FROM Region
JOIN City ON Region.id = City.id_region
JOIN Address ON City.id = Address.id_city
JOIN Producer ON Address.id = Producer.id_address;



---4.
SELECT Name AS Название_категории
FROM Category

EXCEPT

SELECT Category.Name
FROM Product
JOIN Producer ON Product.id_producer = Producer.id
JOIN Category ON Category.id = Product.id_category
WHERE Producer.Name = 'Солнечный';
