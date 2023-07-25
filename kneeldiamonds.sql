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
    `price` NUMERIC(5,2) NOT NULL
);

CREATE TABLE `Metals`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `metal` VARCHAR(160) NOT NULL,
    `price` NUMERIC(5,2) NOT NULL
);

CREATE TABLE `Orders`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `metal_id` INTEGER NOT NULL,
    `style_id` INTEGER NOT NULL,
    `size_id` INTEGER NOT NULL,
    `time_stamp` NUMERIC NOT NULL,
    FOREIGN KEY(`metal_id`) REFERENCES `Metals`(`id`) 
    FOREIGN KEY(`style_id`) REFERENCES `Styles`(`id`)
    FOREIGN KEY(`size_id`) REFERENCES `Sizes`(`id`)
);



