-- DDL Data Definition Language
CREATE TABLE songs (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL, -- Обязательное поле
    `artist` VARCHAR(255) NOT NULL, -- Обязательное поле
    `album` VARCHAR(255) NULL,
    `release_year` YEAR NULL,
    `genre` VARCHAR(255) NULL,
    `duration` TIME NULL,
    `language` VARCHAR(255) DEFAULT NULL, -- NULL для инструментальных треков
    `rating` DECIMAL(3,1), -- Оценка от 1.0 до 10.0
    `is_favorite` BOOLEAN NULL,
    `added_date` DATE DEFAULT (CURRENT_DATE)
);

-- DML Data Manipulation Langugage
INSERT INTO songs (`title`, `artist`, `album`, `release_year`, `genre`, `duration`, `language`, `rating`, `is_favorite`, `added_date`) VALUES
('Пятница', 'Пицца', 'На всю планету Земля', 2016, 'Инди-поп', '00:03:35', 'Русский', 5.0, 1, '2024-01-15'),
('Вторник', 'Пицца', 'На всю планету Земля', 2016, 'Инди-поп', '00:03:22', 'Русский', 4.5, 1, '2024-01-15'),
('На всю планету Земля', 'Пицца', 'На всю планету Земля', 2016, 'Инди-поп', '00:03:45', 'Русский', 4.8, 1, '2024-01-16'),
('Фары', 'Пицца', 'Оружие', 2018, 'Инди-поп', '00:03:29', 'Русский', 4.7, 1, '2024-01-17'),
('Оружие', 'Пицца', 'Оружие', 2018, 'Инди-поп', '00:03:47', 'Русский', 4.6, 0, '2024-01-17'),
('Город под подошвой', 'Oxxxymiron', 'Горгород', 2015, 'Хип-хоп', '00:03:36', 'Русский', 5.0, 1, '2024-02-01'),
('Йети и дети', 'Oxxxymiron', 'Йети и дети', 2019, 'Хип-хоп', '00:03:14', 'Русский', 4.7, 1, '2024-02-02'),
('День физкультурника', 'Oxxxymiron', 'Горгород', 2015, 'Хип-хоп', '00:03:11', 'Русский', 4.9, 1, '2024-02-03'),
('Инородная музыка', 'Oxxxymiron', 'Красота и уродство', 2021, 'Хип-хоп', '00:03:28', 'Русский', 4.6, 0, '2024-02-04'),
('Переплетено', 'Oxxxymiron', 'Красота и уродство', 2021, 'Хип-хоп', '00:04:12', 'Русский', 5.0, 1, '2024-02-05'),
('Shop', 'Toby Fox', 'Undertale Soundtrack', 2015, 'Chiptune / Video game music', '00:00:50', NULL, 4.5, 1, '2024-03-01'),
('Snowy', 'Toby Fox', 'Undertale Soundtrack', 2015, 'Chiptune / Video game music', '00:00:58', NULL, 4.5, 1, '2024-03-01'),
('Bonetrousle', 'Toby Fox', 'Undertale Soundtrack', 2015, 'Chiptune / Video game music', '00:00:57', NULL, 5.0, 1, '2024-03-01'),
('Megalovania', 'Toby Fox', 'Undertale Soundtrack', 2015, 'Chiptune / Video game music', '00:02:36', NULL, 5.0, 1, '2024-03-01'),
('Hydrogen', 'M.O.O.N.', 'Hotline Miami Soundtrack', 2012, 'Electronic / Synthwave', '00:04:49', NULL, 5.0, 1, '2024-03-10'),
('Paris', 'M.O.O.N.', 'Hotline Miami Soundtrack', 2012, 'Electronic / Synthwave', '00:04:31', NULL, 4.8, 1, '2024-03-10'),
('Knock Knock', 'Scattle', 'Hotline Miami Soundtrack', 2012, 'Electronic / Synthwave', '00:04:00', NULL, 4.7, 1, '2024-03-10'),
('Miami Disco', 'Perturbator', 'Hotline Miami Soundtrack', 2012, 'Electronic / Synthwave', '00:04:00', NULL, 4.6, 0, '2024-03-10');
