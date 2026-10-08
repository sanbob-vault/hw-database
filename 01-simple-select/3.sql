SELECT `id`, `name`, `phone` FROM `clients` WHERE `lastname` = 'Williams' LIMIT 100;

SELECT `id`, `name`, `phone` FROM `clients` WHERE `lastname` in ('Williams', 'Jones', 'Brown', 'Miller') LIMIT 100;