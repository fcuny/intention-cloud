-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Sun Apr  5 18:09:11 2009
-- 
SET foreign_key_checks=0;

--
-- Table: `search`
--
CREATE TABLE `search` (
  `id` integer NOT NULL,
  `engine` varchar(255),
  `cloud` blob,
  `date_created` date,
  `query` varchar(255),
  `permalink` varchar(255),
  PRIMARY KEY (`id`)
);

SET foreign_key_checks=1;

