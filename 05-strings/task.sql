-- 1. Сделайте выборку id и имен клиентов, приведенных: 
--     а) к верхнему регистру, 
--     б) к нижнему регистру.

SELECT
    `id`,
    UPPER(`name`),
    LOWER(`name`)
FROM `clients`
LIMIT 20;


-- 2. Выведите по каждому клиенту фамилию и имя в одном столбце, а в другом номер
-- телефона в сокращенном виде: первые три и последнюю одну цифру в открытом виде, 
-- остальные символы закрыть знаком x, * или # (например, должно получиться так: 
-- 977***4). Первому столбцу дайте имя full_name, второму phone_number.

SELECT
    CONCAT_WS(' ', `lastname`, `name`) as `full_name`,
    CONCAT(
        LEFT(CAST(`phone` AS CHAR), 3),
        REPEAT('*', CHAR_LENGTH(CAST(`phone` AS CHAR)) - 4),
        RIGHT(CAST(`phone` AS CHAR), 1)
    ) AS `phone_number`
FROM `clients`
LIMIT 20;


-- 3. Выведите по каждому клиенту, в фамилии которого есть такие вхождения строк
-- tt, ss, ll, имя и фамилию приведите к формату, где имя будет сокращено до 1
-- символа с точкой (например: J. Wiliams).

SELECT
    CONCAT_WS('', LEFT(`lastname`, 1), '. ', `name`) as `full_name`
FROM `clients`
WHERE 
    POSITION('tt' IN `lastname`) OR
    POSITION('ss' IN `lastname`) OR
    POSITION('ll' IN `lastname`)
LIMIT 100;

-- 4. Найдите все записи, в которых телефонные номера: 
--     а) начинаются на 586, 
--     б) содержат 657, 
--     в) заканчиваются на 707.
--     Составьте запросы из всех возможных вариантов, поиска таких подстрок.

SELECT * FROM `clients` WHERE LEFT(`phone`, 3) = '586';
SELECT * FROM `clients` WHERE SUBSTRING(`phone` FROM 1 FOR 3) = '586';
SELECT * FROM `clients` WHERE POSITION('586' IN `phone`) = 1;
SELECT * FROM `clients` WHERE `phone` LIKE '586%';

SELECT * FROM `clients` WHERE POSITION('657' IN `phone`) > 0;
SELECT * FROM `clients` WHERE `phone` LIKE '%657%';

SELECT * FROM `clients` WHERE RIGHT(`phone`, 3) = '707';
SELECT * FROM `clients` WHERE SUBSTRING(`phone`, -3) = '707';
SELECT * FROM `clients` WHERE LOCATE('707', `phone`, CHAR_LENGTH(`phone`) - 2) > 0;
SELECT * FROM `clients` WHERE `phone` LIKE '%707';
