CREATE TABLE `Styles`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `style` VARCHAR(160) NOT NULL,
    `price` NUMERIC(5,2) NOT NULL
);

CREATE TABLE `Sizes`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `carets` NUMERIC(2,1) NOT NULL,
    `price` NUMERIC(6,2) NOT NULL
);

CREATE TABLE `Metals`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `metal` VARCHAR(160) NOT NULL,
    `price` NUMERIC(6,2) NOT NULL
);

CREATE TABLE `Orders`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `metal_id` INTEGER NOT NULL,
    `style_id` INTEGER NOT NULL,
    `size_id` INTEGER NOT NULL,
    FOREIGN KEY(`metal_id`) REFERENCES `Metals`(`id`),
    FOREIGN KEY(`style_id`) REFERENCES `Styles`(`id`),
    FOREIGN KEY(`size_id`) REFERENCES `Sizes`(`id`),
);

INSERT INTO `Styles` VALUES (null, 'Classic', 50000);
INSERT INTO `Styles` VALUES (null, 'Modern', 71000);
INSERT INTO `Styles` VALUES (null, 'Vintage', 95000);

INSERT INTO `Metals` VALUES (null, 'Sterling Silver', 50000);
INSERT INTO `Metals` VALUES (null, '14K Gold', 12420);
INSERT INTO `Metals` VALUES (null, '24K Gold', 73640);
INSERT INTO `Metals` VALUES (null, 'Platinum', 12589);
INSERT INTO `Metals` VALUES (null, 'Palladium', 12410);

INSERT INTO `Sizes` VALUES (null, 0.5, 40500);
INSERT INTO `Sizes` VALUES (null, 0.75, 78200);
INSERT INTO `Sizes` VALUES (null, 1, 147000);
INSERT INTO `Sizes` VALUES (null, 1.5, 199700);
INSERT INTO `Sizes` VALUES (null, 2, 363800);

INSERT INTO `Orders` VALUES (null, 5, 1, 2);
INSERT INTO `Orders` VALUES (null, 1, 2, 3);
INSERT INTO `Orders` VALUES (null, 1, 1, 1);
INSERT INTO `Orders` VALUES (null, 4, 3, 2);

DROP TABLE Metals;
DROP TABLE Styles;
DROP TABLE Sizes;
DROP TABLE Orders;

SELECT * FROM Orders ORDER BY id DESC;


