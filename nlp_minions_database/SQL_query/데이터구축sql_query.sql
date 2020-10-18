CREATE TABLE `CODE`
(
 `type_idx`       integer NOT NULL ,
 `category_type`  varchar(45) NOT NULL ,
 `category_value` varchar(45) NOT NULL ,
 `simple_word`    varchar(45) NOT NULL ,

PRIMARY KEY (`type_idx`)
);

CREATE TABLE `INSTA_PROFILE`
(
 `inner_id` varchar(45) NOT NULL ,
 `insta_id` varchar(100) NOT NULL ,
 `profile`  text NULL ,
 `job`      varchar(100) NULL ,
 `interest` varchar(100) NULL ,
 `age`      varchar(10) NULL ,
 `region`   varchar(100) NULL ,
 `gender`   varchar(10) NULL ,
 `team_idx` integer NOT NULL ,

PRIMARY KEY (`inner_id`)
);

CREATE TABLE `INSTA_PROFILE_1`
(
 `inner_id` varchar(45) NOT NULL ,
 `insta_id` varchar(100) NOT NULL ,
 `profile`  text NULL ,
 `job`      varchar(100) NULL ,
 `interest` varchar(100) NULL ,
 `age`      varchar(10) NULL ,
 `region`   varchar(100) NULL ,
 `gender`   varchar(10) NULL ,
 `team_idx` integer NOT NULL ,

PRIMARY KEY (`inner_id`)
);

CREATE TABLE `INSTA_PROFILE_2`
(
 `inner_id` varchar(45) NOT NULL ,
 `insta_id` varchar(100) NOT NULL ,
 `profile`  text NULL ,
 `job`      varchar(100) NULL ,
 `interest` varchar(100) NULL ,
 `age`      varchar(10) NULL ,
 `region`   varchar(100) NULL ,
 `gender`   varchar(10) NULL ,
 `team_idx` integer NOT NULL ,

PRIMARY KEY (`inner_id`)
);

CREATE TABLE `INSTA_PROFILE_3`
(
 `inner_id` varchar(45) NOT NULL ,
 `insta_id` varchar(100) NOT NULL ,
 `profile`  text NULL ,
 `job`      varchar(100) NULL ,
 `interest` varchar(100) NULL ,
 `age`      varchar(10) NULL ,
 `region`   varchar(100) NULL ,
 `gender`   varchar(10) NULL ,
 `team_idx` integer NOT NULL ,

PRIMARY KEY (`inner_id`)
);

CREATE TABLE `INSTA_PROFILE_4`
(
 `inner_id` varchar(45) NOT NULL ,
 `insta_id` varchar(100) NOT NULL ,
 `profile`  text NULL ,
 `job`      varchar(100) NULL ,
 `interest` varchar(100) NULL ,
 `age`      varchar(10) NULL ,
 `region`   varchar(100) NULL ,
 `gender`   varchar(10) NULL ,
 `team_idx` integer NOT NULL ,

PRIMARY KEY (`inner_id`)
);

CREATE TABLE `INSTA_PROFILE_FEEDBACK`
(
 `inner_id` varchar(45) NOT NULL ,
 `insta_id` varchar(100) NOT NULL ,
 `profile`  text NULL ,
 `job`      varchar(100) NULL ,
 `interest` varchar(100) NULL ,
 `age`      varchar(10) NULL ,
 `region`   varchar(100) NULL ,
 `gender`   varchar(10) NULL ,
 `team_idx` integer NOT NULL ,

PRIMARY KEY (`inner_id`)
);

CREATE TABLE `INSTA_RELATION`
(
 `relation_idx`  integer NOT NULL ,
 `start`         varchar(45) NOT NULL ,
 `end`           varchar(45) NOT NULL ,
 `relation_type` integer NOT NULL ,
 `post_idx`      integer NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`relation_idx`),
KEY `fkIdx_305` (`post_idx`),
CONSTRAINT `FK_305` FOREIGN KEY `fkIdx_305` (`post_idx`) REFERENCES `POST` (`post_idx`),
KEY `fkIdx_335` (`relation_type`),
CONSTRAINT `FK_335` FOREIGN KEY `fkIdx_335` (`relation_type`) REFERENCES `CODE` (`type_idx`),
KEY `fkIdx_444` (`team_idx`),
CONSTRAINT `FK_444` FOREIGN KEY `fkIdx_444` (`team_idx`) REFERENCES `TEAM` (`team_idx`)
);

CREATE TABLE `INSTA_RELATION_1`
(
 `start`         varchar(45) NOT NULL ,
 `relation_idx`  integer NOT NULL ,
 `end`           varchar(45) NOT NULL ,
 `relation_type` integer NOT NULL ,
 `shortcode`     varchar(100) NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`relation_idx`)
);

CREATE TABLE `INSTA_RELATION_2`
(
 `start`         varchar(45) NOT NULL ,
 `relation_idx`  integer NOT NULL ,
 `end`           varchar(45) NOT NULL ,
 `relation_type` integer NOT NULL ,
 `shortcode`     varchar(100) NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`relation_idx`)
);

CREATE TABLE `INSTA_RELATION_3`
(
 `start`         varchar(45) NOT NULL ,
 `relation_idx`  integer NOT NULL ,
 `end`           varchar(45) NOT NULL ,
 `relation_type` integer NOT NULL ,
 `shortcode`     varchar(100) NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`relation_idx`)
);

CREATE TABLE `INSTA_RELATION_4`
(
 `start`         varchar(45) NOT NULL ,
 `relation_idx`  integer NOT NULL ,
 `end`           varchar(45) NOT NULL ,
 `relation_type` integer NOT NULL ,
 `shortcode`     varchar(100) NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`relation_idx`)
);

CREATE TABLE `LABEL`
(
 `label_idx` integer NOT NULL ,
 `type_idx`  integer NOT NULL ,
 `user_idx`  integer NOT NULL ,
 `post_idx`  integer NOT NULL ,
 `inner_id`  varchar(45) NOT NULL ,

PRIMARY KEY (`label_idx`),
KEY `fkIdx_263` (`type_idx`),
CONSTRAINT `FK_263` FOREIGN KEY `fkIdx_263` (`type_idx`) REFERENCES `CODE` (`type_idx`),
KEY `fkIdx_266` (`user_idx`),
CONSTRAINT `FK_266` FOREIGN KEY `fkIdx_266` (`user_idx`) REFERENCES `USER` (`user_idx`),
KEY `fkIdx_274` (`post_idx`),
CONSTRAINT `FK_274` FOREIGN KEY `fkIdx_274` (`post_idx`) REFERENCES `POST` (`post_idx`),
KEY `fkIdx_318` (`inner_id`),
CONSTRAINT `FK_318` FOREIGN KEY `fkIdx_318` (`inner_id`) REFERENCES `INSTA_PROFILE` (`inner_id`)
);

CREATE TABLE `LAST`
(
 `category_type` varchar(45) NOT NULL ,
 `post_idx`      integer NOT NULL 
);

CREATE TABLE `POST`
(
 `post_idx`      integer NOT NULL ,
 `inner_id`      varchar(45) NOT NULL ,
 `post_date`     datetime NOT NULL ,
 `crawling_time` datetime NULL ,
 `like_count`    integer NOT NULL ,
 `view_count`    integer NULL ,
 `url`           text NOT NULL ,
 `shortcode`     varchar(100) NOT NULL ,
 `media_url`     text NOT NULL ,
 `content`       text NULL ,
 `region_tag`    varchar(45) NULL ,
 `hashtag`       varchar(500) NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`post_idx`),
KEY `fkIdx_250` (`inner_id`),
CONSTRAINT `FK_250` FOREIGN KEY `fkIdx_250` (`inner_id`) REFERENCES `INSTA_PROFILE` (`inner_id`),
KEY `fkIdx_339` (`team_idx`),
CONSTRAINT `FK_339` FOREIGN KEY `fkIdx_339` (`team_idx`) REFERENCES `TEAM` (`team_idx`)
);

CREATE TABLE `POST_1`
(
 `shortcode`     varchar(100) NOT NULL ,
 `post_idx`      varchar(45) NOT NULL ,
 `inner_id`      varchar(45) NOT NULL ,
 `post_date`     datetime NOT NULL ,
 `crawling_time` datetime NULL ,
 `like_count`    integer NOT NULL ,
 `vew_count`     integer NULL ,
 `url`           text NOT NULL ,
 `meda_url`      text NOT NULL ,
 `content`       text NULL ,
 `region_tag`    varchar(45) NULL ,
 `hashtag`       varchar(45) NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`post_idx`)
);

CREATE TABLE `POST_2`
(
 `shortcode`     varchar(100) NOT NULL ,
 `post_idx`      varchar(45) NOT NULL ,
 `inner_id`      varchar(45) NOT NULL ,
 `post_date`     datetime NOT NULL ,
 `crawling_time` datetime NULL ,
 `like_count`    integer NOT NULL ,
 `vew_count`     integer NULL ,
 `url`           text NOT NULL ,
 `meda_url`      text NOT NULL ,
 `content`       text NULL ,
 `region_tag`    varchar(45) NULL ,
 `hashtag`       varchar(45) NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`post_idx`)
);

CREATE TABLE `POST_3`
(
 `shortcode`     varchar(100) NOT NULL ,
 `post_idx`      varchar(45) NOT NULL ,
 `inner_id`      varchar(45) NOT NULL ,
 `post_date`     datetime NOT NULL ,
 `crawling_time` datetime NULL ,
 `like_count`    integer NOT NULL ,
 `vew_count`     integer NULL ,
 `url`           text NOT NULL ,
 `meda_url`      text NOT NULL ,
 `content`       text NULL ,
 `region_tag`    varchar(45) NULL ,
 `hashtag`       varchar(45) NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`post_idx`)
);

CREATE TABLE `POST_4`
(
 `shortcode`     varchar(100) NOT NULL ,
 `post_idx`      varchar(45) NOT NULL ,
 `inner_id`      varchar(45) NOT NULL ,
 `post_date`     datetime NOT NULL ,
 `crawling_time` datetime NULL ,
 `like_count`    integer NOT NULL ,
 `vew_count`     integer NULL ,
 `url`           text NOT NULL ,
 `meda_url`      text NOT NULL ,
 `content`       text NULL ,
 `region_tag`    varchar(45) NULL ,
 `hashtag`       varchar(45) NULL ,
 `team_idx`      integer NOT NULL ,

PRIMARY KEY (`post_idx`)
);

CREATE TABLE `REPLY`
(
 `reply_idx`  integer NOT NULL ,
 `post_idx`   integer NOT NULL ,
 `inner_id`   varchar(45) NOT NULL ,
 `reply_time` datetime NULL ,
 `reply`      text NOT NULL ,
 `hashtag`    varchar(500) NULL ,
 `team_idx`   integer NOT NULL ,

PRIMARY KEY (`reply_idx`),
KEY `fkIdx_308` (`post_idx`),
CONSTRAINT `FK_308` FOREIGN KEY `fkIdx_308` (`post_idx`) REFERENCES `POST` (`post_idx`),
KEY `fkIdx_311` (`inner_id`),
CONSTRAINT `FK_311` FOREIGN KEY `fkIdx_311` (`inner_id`) REFERENCES `INSTA_PROFILE` (`inner_id`),
KEY `fkIdx_410` (`team_idx`),
CONSTRAINT `FK_410` FOREIGN KEY `fkIdx_410` (`team_idx`) REFERENCES `TEAM` (`team_idx`)
);

CREATE TABLE `REPLY_1`
(
 `shortcode`   varchar(100) NOT NULL ,
 `reply_idx`   integer NOT NULL ,
 `inner_id`    varchar(45) NOT NULL ,
 `reply_tiime` datetime NOT NULL ,
 `reply`       text NOT NULL ,
 `hashtag`     varchar(500) NULL ,
 `team_idx`    integer NOT NULL ,

PRIMARY KEY (`reply_idx`)
);

CREATE TABLE `REPLY_2`
(
 `shortcode`   varchar(100) NOT NULL ,
 `reply_idx`   integer NOT NULL ,
 `inner_id`    varchar(45) NOT NULL ,
 `reply_tiime` datetime NOT NULL ,
 `reply`       text NOT NULL ,
 `hashtag`     varchar(500) NULL ,
 `team_idx`    integer NOT NULL ,

PRIMARY KEY (`reply_idx`)
);

CREATE TABLE `REPLY_3`
(
 `shortcode`   varchar(100) NOT NULL ,
 `reply_idx`   integer NOT NULL ,
 `inner_id`    varchar(45) NOT NULL ,
 `reply_tiime` datetime NOT NULL ,
 `reply`       text NOT NULL ,
 `hashtag`     varchar(500) NULL ,
 `team_idx`    integer NOT NULL ,

PRIMARY KEY (`reply_idx`)
);

CREATE TABLE `REPLY_4`
(
 `shortcode`   varchar(100) NOT NULL ,
 `reply_idx`   integer NOT NULL ,
 `inner_id`    varchar(45) NOT NULL ,
 `reply_tiime` datetime NOT NULL ,
 `reply`       text NOT NULL ,
 `hashtag`     varchar(500) NULL ,
 `team_idx`    integer NOT NULL ,

PRIMARY KEY (`reply_idx`)
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
 `point`    integer NOT NULL ,
 `team_idx` integer NOT NULL ,

PRIMARY KEY (`user_idx`),
KEY `fkIdx_278` (`team_idx`),
CONSTRAINT `FK_278` FOREIGN KEY `fkIdx_278` (`team_idx`) REFERENCES `TEAM` (`team_idx`)
);

