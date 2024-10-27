-- Tabel active_pages
CREATE TABLE IF NOT EXISTS `active_pages` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `active_pages` (`id`, `name`, `enabled`) VALUES
(1, 'blog', 1);

-- Tabel blog_posts
CREATE TABLE IF NOT EXISTS `blog_posts` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `time` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel cookie_law
CREATE TABLE IF NOT EXISTS `cookie_law` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link` VARCHAR(255) NOT NULL,
  `theme` VARCHAR(20) NOT NULL,
  `visibility` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel cookie_law_translations
CREATE TABLE IF NOT EXISTS `cookie_law_translations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(255) NOT NULL,
  `button_text` VARCHAR(50) NOT NULL,
  `learn_more` VARCHAR(50) NOT NULL,
  `abbr` VARCHAR(5) NOT NULL,
  `for_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_translation` (`abbr`, `for_id`),
  FOREIGN KEY (`for_id`) REFERENCES `cookie_law`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel textual_pages_translations
CREATE TABLE IF NOT EXISTS `textual_pages_translations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `abbr` VARCHAR(5) NOT NULL,
  `for_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`for_id`) REFERENCES `active_pages`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel history
CREATE TABLE IF NOT EXISTS `history` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity` VARCHAR(255) NOT NULL,
  `username` VARCHAR(50),
  `time` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel languages
CREATE TABLE IF NOT EXISTS `languages` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `abbr` VARCHAR(5) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `currency` VARCHAR(10) NOT NULL,
  `currencyKey` VARCHAR(5) NOT NULL,
  `flag` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `languages` (`id`, `abbr`, `name`, `currency`, `currencyKey`, `flag`) VALUES
(1, 'bg', 'bulgarian', 'лв', 'BGN', 'bg.jpg'),
(2, 'en', 'english', '$', 'USD', 'en.jpg'),
(3, 'gr', 'greece', 'EUR', 'EUR', 'gr.png'),
(4, 'id', 'indonesian', 'RP', 'IDR', 'id.jpg'),
(5, 'fr', 'francais', 'EUR', 'EUR', 'fr.jpg');

-- Tabel orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `user_id` INT(10) UNSIGNED,
  `products` TEXT NOT NULL,
  `date` INT(10) UNSIGNED NOT NULL,
  `referrer` VARCHAR(255) NOT NULL,
  `clean_referrer` VARCHAR(255) NOT NULL,
  `payment_type` VARCHAR(255) NOT NULL,
  `paypal_status` VARCHAR(10),
  `processed` TINYINT(1) NOT NULL DEFAULT '0',
  `viewed` TINYINT(1) NOT NULL DEFAULT '0',
  `confirmed` TINYINT(1) NOT NULL DEFAULT '0',
  `discount_code` VARCHAR(20),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users_public`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel users_public
CREATE TABLE IF NOT EXISTS `users_public` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(100) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel products
CREATE TABLE IF NOT EXISTS `products` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `folder` INT(10) UNSIGNED,
  `image` VARCHAR(255) NOT NULL,
  `time` INT(10) UNSIGNED NOT NULL,
  `time_update` INT(10) UNSIGNED NOT NULL,
  `visibility` TINYINT(1) NOT NULL DEFAULT '1',
  `shop_categorie` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL DEFAULT '0',
  `procurement` INT(10) UNSIGNED NOT NULL,
  `in_slider` TINYINT(1) NOT NULL DEFAULT '0',
  `url` VARCHAR(255) NOT NULL,
  `brand_id` INT(5),
  `position` INT(10) UNSIGNED NOT NULL,
  `vendor_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`vendor_id`) REFERENCES `vendors`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel vendors
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `url` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel discount_codes
CREATE TABLE IF NOT EXISTS `discount_codes` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(10) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `amount` VARCHAR(20) NOT NULL,
  `valid_from_date` INT(10) UNSIGNED NOT NULL,
  `valid_to_date` INT(10) UNSIGNED NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabel users
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `notify` TINYINT(1) NOT NULL DEFAULT '0',
  `last_login` INT(10) UNSIGNED,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data dummy untuk users
INSERT INTO `users` (`id`, `username`, `password`, `email`, `notify`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'dindamymy123123@gmail.com', 0);
