-- 3. 
SELECT product.name, product.price
FROM delivery
JOIN product ON delivery.id_product= product.id
WHERE delivery.date_of_delivery >= DATEADD(month, -1, GETDATE())

-- 4. 
SELECT product.name,  product.price
FROM Product 
JOIN Category ON Category.id = Product.id_category
JOIN Producer ON Producer.id = Product.id_producer
WHERE category.name = '������������' AND producer.name <> '�������'

-- 5.
SELECT *
FROM Product
JOIN Category ON Category.id = Product.id_category
WHERE product.name LIKE '�%' AND category.name LIKE '%�%'

-- 6. 
SELECT *
FROM Product
WHERE name BETWEEN '�%' AND '�%'
ORDER BY name ASC


-- 7. 
SELECT product.name, product.price
FROM delivery
JOIN product ON delivery.id_product= product.id
WHERE product.price < 50 AND date_of_delivery BETWEEN '2023-10-01' AND GETDATE() - 1

-- 8. 
SELECT *
FROM Product 
JOIN Category ON Category.id = Product.id_category
WHERE category.name = '�������' AND quantity > 100

-- 9. 
SELECT *
FROM Product
WHERE price BETWEEN 100 AND 200
ORDER BY price ASC

-- 14.
SELECT name
FROM Product
WHERE name LIKE '%�%�%�%'
AND name NOT LIKE '%�%�%�%�%'

-- 15.
--DELETE FROM Product
--WHERE LEN(name) = 5

-- 17.
SELECT TOP 5 *
FROM Product
ORDER BY price DESC