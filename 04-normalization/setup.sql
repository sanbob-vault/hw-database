-- Создание исходной таблицы
CREATE TABLE `raw_product` (
    `product_id` INT,
    `product_name` VARCHAR(255),
    `part_id` INT,
    `quantity` INT
);

INSERT INTO `raw_product` (`product_id`, `product_name`, `part_id`, `quantity`) 
VALUES
(1, 'Table', 101, 4),
(1, 'Table', 102, 1),
(2, 'Chair', 101, 4),
(2, 'Chair', 103, 1),
(2, 'Chair', 104, 1),
(3, 'Crate', 103, 6),
(3, 'Crate', 105, 2);