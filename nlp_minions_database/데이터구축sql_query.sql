CREATE TABLE `CODE`
(
 `type_idx`      integer NOT NULL ,
 `type_name`     varchar(45) NOT NULL ,
 `category_type` varchar(45) NOT NULL ,
 `value`         varchar(45) NOT NULL ,

PRIMARY KEY (`type_idx`)
);


CREATE TABLE `INSTA_PROFILE`
(
 `inner_id` integer NOT NULL ,
 `profile`  text NULL ,
 `insta_id` varchar(100) NOT NULL ,

PRIMARY KEY (`inner_id`)
);


CREATE TABLE `TEAM`
(
 `team_idx`   integer NOT NULL ,
 `label_type` varchar(45) NOT NULL ,

PRIMARY KEY (`team_idx`)
);


CREATE TABLE `USER`
(
 `user_idx` integer NOT NULL ,
 `username` varchar(45) NOT NULL ,
 `team_idx` integer NOT NULL ,

PRIMARY KEY (`user_idx`),
KEY `fkIdx_278` (`team_idx`),
CONSTRAINT `FK_278` FOREIGN KEY `fkIdx_278` (`team_idx`) REFERENCES `TEAM` (`team_idx`)
);


CREATE TABLE `POST`
(
 `post_idx`      integer NOT NULL ,
 `hashtag`       varchar(500) NULL ,
 `region_tag`    varchar(45) NULL ,
 `url`           text NOT NULL ,
 `inner_id`      integer NOT NULL ,
 `shortcode`     varchar(50) NOT NULL ,
 `content`       text NULL ,
 `media_url`     text NOT NULL ,
 `crawling_time` datetime NULL ,
 `like_count`    integer NOT NULL ,
 `view_count`    integer NULL ,
 `post_date`     datetime NOT NULL ,
 `version`       integer NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`post_idx`),
KEY `fkIdx_250` (`inner_id`),
CONSTRAINT `FK_250` FOREIGN KEY `fkIdx_250` (`inner_id`) REFERENCES `INSTA_PROFILE` (`inner_id`),
KEY `fkIdx_339` (`team_idx`),
CONSTRAINT `FK_339` FOREIGN KEY `fkIdx_339` (`team_idx`) REFERENCES `TEAM` (`team_idx`)
);


CREATE TABLE `LABEL`
(
 `label_idx` integer NOT NULL ,
 `type_idx`  integer NOT NULL ,
 `user_idx`  integer NOT NULL ,
 `post_idx`  integer NOT NULL ,
 `inner_id`  integer NOT NULL ,
 `state`     integer NOT NULL ,

PRIMARY KEY (`label_idx`),
KEY `fkIdx_263` (`type_idx`),
CONSTRAINT `FK_263` FOREIGN KEY `fkIdx_263` (`type_idx`) REFERENCES `CODE` (`type_idx`),
KEY `fkIdx_266` (`user_idx`),
CONSTRAINT `FK_266` FOREIGN KEY `fkIdx_266` (`user_idx`) REFERENCES `USER` (`user_idx`),
KEY `fkIdx_274` (`post_idx`),
CONSTRAINT `FK_274` FOREIGN KEY `fkIdx_274` (`post_idx`) REFERENCES `POST` (`post_idx`),
KEY `fkIdx_318` (`inner_id`),
CONSTRAINT `FK_318` FOREIGN KEY `fkIdx_318` (`inner_id`) REFERENCES `INSTA_PROFILE` (`inner_id`),
KEY `fkIdx_325` (`state`),
CONSTRAINT `FK_325` FOREIGN KEY `fkIdx_325` (`state`) REFERENCES `CODE` (`type_idx`)
);


CREATE TABLE `LAST`
(
 `category_type` varchar(45) NOT NULL ,
 `post_idx`      integer NOT NULL 
);


CREATE TABLE `REPLY`
(
 `reply_idx`  integer NOT NULL ,
 `reply`      text NULL ,
 `hashtag`    varchar(500) NULL ,
 `reply_time` datetime NULL ,
 `inner_id`   integer NULL ,
 `post_idx`   integer NULL ,

PRIMARY KEY (`reply_idx`),
KEY `fkIdx_308` (`post_idx`),
CONSTRAINT `FK_308` FOREIGN KEY `fkIdx_308` (`post_idx`) REFERENCES `POST` (`post_idx`),
KEY `fkIdx_311` (`inner_id`),
CONSTRAINT `FK_311` FOREIGN KEY `fkIdx_311` (`inner_id`) REFERENCES `INSTA_PROFILE` (`inner_id`)
);


CREATE TABLE `INSTA_RELATION`
(
 `relation_idx`  integer NOT NULL ,
 `start`         varchar(45) NOT NULL ,
 `end`           varchar(45) NOT NULL ,
 `post_idx`      integer NULL ,
 `relation_type` integer NOT NULL ,

PRIMARY KEY (`relation_idx`),
KEY `fkIdx_305` (`post_idx`),
CONSTRAINT `FK_305` FOREIGN KEY `fkIdx_305` (`post_idx`) REFERENCES `POST` (`post_idx`),
KEY `fkIdx_335` (`relation_type`),
CONSTRAINT `FK_335` FOREIGN KEY `fkIdx_335` (`relation_type`) REFERENCES `CODE` (`type_idx`)
);
