-- 1. Из таблицы clients сделайте по каждому клиенту выборку года рождения;

SELECT
    YEAR(`dbirth`) AS `birth_year`
FROM `clients`
LIMIT 20;

-- 2. Вычислите по каждому клиенту его текущий возраст относительно сегодняшней даты: 
--     а) полных лет, 
--     б) лет до конца текущего года;

SELECT
    TIMESTAMPDIFF(YEAR, `dbirth`, NOW()) AS `age`,
    YEAR(NOW()) - YEAR(`dbirth`) AS `age_end_this_year`
FROM `clients`
LIMIT 20;

-- 3. Подсчитайте сколько было/будет полных лет каждому клиенту на: 
--     а) 8 декабря 1992 года, 
--     б) 15 июля 2024 года;

SELECT
    TIMESTAMPDIFF(YEAR, `dbirth`, '1992-12-08') AS `year1`,
    TIMESTAMPDIFF(YEAR, `dbirth`, '2024-07-15') AS `year2`
FROM `clients`
LIMIT 20;


-- 4. Найдите клиентов, у которых планируется день рождения: 
--     а) в ближайшую неделю, 
--     б) в ближайшие две недели, 
--     в) до конца текущего месяца;

SELECT *
FROM `clients`
WHERE DATE_FORMAT(`dbirth`, '%m-%d') 
      BETWEEN DATE_FORMAT(NOW(), '%m-%d') AND DATE_FORMAT(NOW()
      + INTERVAL 1 WEEK, '%m-%d')
LIMIT 20;

SELECT *
FROM `clients`
WHERE DATE_FORMAT(`dbirth`, '%m-%d') 
      BETWEEN DATE_FORMAT(NOW(), '%m-%d') AND DATE_FORMAT(NOW()
      + INTERVAL 2 WEEK, '%m-%d')
LIMIT 20;


SELECT *
FROM `clients`
WHERE MONTH(`dbirth`) = MONTH(NOW()) AND DAY(`dbirth`) >= DAY(NOW())
LIMIT 20;
