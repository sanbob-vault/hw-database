
-- # Задание
-- 1. Составьте запросы на обновление данных в таблице клиентов (clients.sql):
--     1. Найдите клиентов Gary Harrison, Michael Atwood, Amy Majors, Katherine Smith и обновите дату их рождения до 21.10.1930, 12.04.1934, 01.08.1975, 22.09.1959 соответственно.
--     2. Найдите клиентов с годом рождения ранее 1933 года и удалите номер телефона.
--     3. Исправьте ошибку клиента John Ohara, его настоящее имя Johanna Ohara, не забудьте поправить и пол клиента.
--     4. Замените номера телефонов Humberto Hoosier, Irene Schreiber, Donna Wallace на произвольные значения (для каждого свои).
--     5. Удалите клиентов с ID 215, 340, 449, 470, 607.
--     6. Удалите клиентов мужского пола с датой рождения в период с 01.01.1941 по 30.04.1941 и с 10.09.1972 по 15.09.1972
-- 2. Произведите обновление данных в своей таблице из предыдущего задания. Не менее 5 запросов.
-- По каждому из запросов предварительно найдите записи, подлежащие обновлению, запишите количество таких записей. Используйте LIMIT для каждого запроса на обновление.
-- По завершению каждого запроса запишите количество обновленных строк.

-- ### 1. Работа с `clients`

-- 1. Найдите клиентов Gary Harrison, Michael Atwood, Amy Majors, Katherine Smith и обновите дату их рождения до 21.10.1930, 12.04.1934, 01.08.1975, 22.09.1959 соответственно.
SELECT *
FROM `clients`
WHERE CONCAT(`name`, ' ', `lastname`)
IN ('Gary Harrison', 'Michael Atwood', 'Amy Majors', 'Katherine Smith')
LIMIT 100;

UPDATE `clients`
SET `dbirth` = CASE 
    CONCAT(`name`, ' ', `lastname`)
    WHEN 'Gary Harrison'    THEN '1930-10-21'
    WHEN 'Michael Atwood'   THEN '1934-04-12'
    WHEN 'Amy Majors'       THEN '1975-08-01'
    WHEN 'Katherine Smith'  THEN '1959-09-22'
END
WHERE CONCAT(`name`, ' ', `lastname`)
IN ('Gary Harrison', 'Michael Atwood', 'Amy Majors', 'Katherine Smith')
LIMIT 4;
-- 4 записи найдено, 4 записи обновлено


-- 2. Найдите клиентов с годом рождения ранее 1933 года и удалите номер телефона.
SELECT *
FROM `clients`
WHERE `dbirth` < '1933-01-01'
LIMIT 100;

UPDATE `clients`
SET `phone` = NULL
WHERE `dbirth` < '1933-01-01'
LIMIT 13;
-- 13 записей найдено. 13 записией обновлено


-- 3. Исправьте ошибку клиента John Ohara, его настоящее имя Johanna Ohara, не забудьте поправить и пол клиента.
SELECT *
FROM `clients`
WHERE CONCAT(`name`, ' ', `lastname`) = 'John Ohara'
LIMIT 100;

UPDATE `clients`
SET `name` = 'Johanna', `gender` = 'F'
WHERE CONCAT(`name`, ' ', `lastname`) = 'John Ohara';

SELECT *
FROM `clients`
WHERE CONCAT(`name`, ' ', `lastname`) = 'Johanna Ohara'
LIMIT 100;
-- 1 запись найдена, 1 запись обновлена


-- 4. Замените номера телефонов Humberto Hoosier, Irene Schreiber, Donna Wallace на произвольные значения (для каждого свои).
SELECT *
FROM `clients`
WHERE CONCAT(`name`, ' ', `lastname`)
IN ('Humberto Hoosier', 'Irene Schreiber', 'Donna Wallace')
LIMIT 100;

UPDATE `clients`
SET `phone` = CASE 
    CONCAT(`name`, ' ', `lastname`)
    WHEN 'Humberto Hoosier'  THEN '11234567'
    WHEN 'Irene Schreiber'   THEN '19660107'
    WHEN 'Donna Wallace'     THEN '88005553535'
END
WHERE CONCAT(`name`, ' ', `lastname`)
IN ('Humberto Hoosier', 'Irene Schreiber', 'Donna Wallace');
-- 3 записи найдено, 3 записи обновлено


-- 5. Удалите клиентов с ID 215, 340, 449, 470, 607.
SELECT *
FROM `clients`
WHERE `id` IN (215, 340, 449, 470, 607);

DELETE
FROM `clients`
WHERE `id` IN (215, 340, 449, 607) -- 470 айди и так уже нет в базе данных
LIMIT 4;

SELECT *
FROM `clients`
WHERE `id` IN (215, 340, 449, 607);
-- 4 записи найдено, 4 записи удалено


-- 6. Удалите клиентов мужского пола с датой рождения в период с 01.01.1941 по 30.04.1941 и с 10.09.1972 по 15.09.1972
SELECT *
FROM `clients`
WHERE `gender` = 'M' AND (
    (`dbirth` BETWEEN '1941-01-01' AND '1941-04-30') 
    OR (`dbirth` BETWEEN '1972-09-10' AND '1972-09-15')
)
LIMIT 100;

DELETE
FROM `clients`
WHERE `gender` = 'M' AND (
    (`dbirth` BETWEEN '1941-01-01' AND '1941-04-30') 
    OR (`dbirth` BETWEEN '1972-09-10' AND '1972-09-15')
)
LIMIT 2;
-- 2 записи найдено, 2 записи удалено


### Работа с `songs` из прошлой дз

SELECT * FROM songs WHERE rating = 5.0;

UPDATE songs 
SET rating = 10.0 
WHERE rating = 5.0 
LIMIT 6;

SELECT * FROM songs WHERE rating = 10.0;
-- 6 записей найдено, 6 записей обновлено


SELECT * FROM songs WHERE language IS NULL;

UPDATE songs 
SET language = 'Инструментал' 
WHERE language IS NULL 
LIMIT 8;
-- 8 найдено, 8 обновлено

SELECT * FROM songs WHERE is_favorite = 0 AND release_year IN (2018, 2021);

UPDATE songs 
SET is_favorite = 1, rating = rating + 0.3 
WHERE is_favorite = 0 AND release_year IN (2018, 2021) 
LIMIT 2;
-- 2 найдено, 2 обновлено

SELECT * FROM songs WHERE artist = 'Toby Fox' AND genre = 'Chiptune / Video game music';

UPDATE songs 
SET genre = 'Chiptune' 
WHERE artist = 'Toby Fox' AND genre = 'Chiptune / Video game music' 
LIMIT 4;
-- 4 найдено, 4 обновлено

SELECT * FROM songs WHERE release_year < 2015 AND duration > '00:04:00';

UPDATE songs 
SET added_date = CURRENT_DATE 
WHERE release_year < 2015 AND duration > '00:04:00' 
LIMIT 2;
-- 2 найдено, 2 обновлено