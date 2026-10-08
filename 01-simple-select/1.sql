-- Найти записи пользователей с определенными именами
SELECT `id`, `name` FROM `clients` WHERE `name` = 'Robert' LIMIT 100;
SELECT `id`, `name` FROM `clients` WHERE `name` = 'Jeffrey' LIMIT 100;
SELECT `id`, `name` FROM `clients` WHERE `name` = 'John' LIMIT 100;
SELECT `id`, `name` FROM `clients` WHERE `name` = 'Richard' LIMIT 100;
SELECT `id`, `name` FROM `clients` WHERE `name` = 'David' LIMIT 100;

-- Найти записи пользователей с именами из списка
SELECT `id`, `name` FROM `clients` WHERE `name` IN ('Robert', 'Jeffrey', 'John', 'Richard', 'David')  LIMIT 100;