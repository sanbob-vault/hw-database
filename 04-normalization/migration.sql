-- Создание нормализованных таблиц
-- Изделия
CREATE TABLE `product` (
    `id` INT PRIMARY KEY,
    `product_name` VARCHAR(255)
);
-- Детали
CREATE TABLE `part` (
    `id` INT PRIMARY KEY,
    `part_name` VARCHAR(255)
);
-- Таблица многие ко многим: изделия - детали
CREATE TABLE `product_part` (
    `product_id` INT,
    `part_id` INT,
    -- количество деталей в изделии должно быть больше нуля
    `quantity` INT NOT NULL CHECK (`quantity` > 0),
    -- связку харакетеризует айди изделия и детали
    PRIMARY KEY (`product_id`, `part_id`),
    -- при удалении изделия его связи с деталями пропадают
    FOREIGN KEY (`product_id`) REFERENCES `product`(`id`) ON DELETE CASCADE,
    -- нельзя удалять детали, которые привязаны к продуктам
    FOREIGN KEY (`part_id`) REFERENCES `part`(`id`) ON DELETE RESTRICT
);

-- Перенос данных из ненормализованной таблицы
INSERT INTO `product` (`id`, `product_name`)
SELECT DISTINCT `product_id`, `product_name` FROM `raw_product`;

INSERT INTO `part` (`id`, `part_name`)
SELECT 
    DISTINCT `part_id`, 
    CASE -- до этого детали были не подписаны
        WHEN `part_id` = 101 THEN 'Wooden leg'
        WHEN `part_id` = 102 THEN 'Table board '
        WHEN `part_id` = 103 THEN 'Wooden board'
        WHEN `part_id` = 104 THEN 'Chair back'
        WHEN `part_id` = 105 THEN 'Fastening'
        ELSE NULL
    END AS `part_name`
FROM `raw_product`;

INSERT INTO `product_part` (`product_id`, `part_id`, `quantity`)
SELECT `product_id`, `part_id`, `quantity` FROM `raw_product`;

-- Проверка результата
SELECT * 
FROM `product_part` `pdpt`
LEFT JOIN `product` `pd` ON `pd`.`id` = `pdpt`.`product_id`
LEFT JOIN `part` `pt` ON `pt`.`id` = `pdpt`.`part_id`;

-- В исходной таблице названия изделий дублировались для каждой детали,
-- поэтому я разбил её на три: отдельные справочники изделий (product)
-- и деталей (part), а также связующую таблицу (product_part) для
-- реализации связи "многие ко многим". Это убрало избыточность данных
-- (приведение к 3НФ) теперь имена хранятся в одном месте и не дублируются