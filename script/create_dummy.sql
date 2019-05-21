CREATE TABLE IF NOT EXISTS `dummy` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL DEFAULT '',
    `comment` varchar(255) NOT NULL DEFAULT '',
    `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
    `updated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
