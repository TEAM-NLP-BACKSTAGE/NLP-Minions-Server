ALTER TABLE INSTA_PROFILE ADD CONSTRAINT team_idx_FK FOREIGN KEY(team_idx) REFERENCES TEAM(team_idx)
ALTER TABLE INSTA_RELATION ADD CONSTRAINT team_idx_FK2 FOREIGN KEY(team_idx) REFERENCES TEAM(team_idx)
ALTER TABLE REPLY ADD CONSTRAINT team_idx_FK3 FOREIGN KEY(team_idx) REFERENCES TEAM(team_idx)
ALTER TABLE POST ADD CONSTRAINT team_idx_FK4 FOREIGN KEY(team_idx) REFERENCES TEAM(team_idx)
ALTER TABLE USER ADD CONSTRAINT team_idx_FK5 FOREIGN KEY(team_idx) REFERENCES TEAM(team_idx)

ALTER TABLE LABEL ADD CONSTRAINT inner_id_FK3 FOREIGN KEY(inner_id) REFERENCES INSTA_PROFILE(inner_id)

ALTER TABLE REPLY ADD CONSTRAINT inner_id_FK1 FOREIGN KEY(inner_id) REFERENCES INSTA_PROFILE(inner_id)
ALTER TABLE POST ADD CONSTRAINT inner_id_FK2 FOREIGN KEY(inner_id) REFERENCES INSTA_PROFILE(inner_id)

ALTER TABLE LAST CONVERT TO character SET utf8;
ALTER TABLE INSTA_PROFILE CONVERT TO character SET utf8;

ALTER TABLE POST CONVERT TO character SET utf8;
ALTER TABLE REPLY CONVERT TO character SET utf8;

ALTER DATABASE SocialAnalysis CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
ALTER TABLE POST CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE POST modify content text charset utf8mb4;

ALTER TABLE POST ADD CONSTRAINT inner_id_FK5 FOREIGN KEY(inner_id) REFERENCES INSTA_PROFILE(inner_id)

ALTER TABLE REPLY CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE REPLY modify reply text charset utf8mb4;

ALTER TABLE INSTA_PROFILE CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE INSTA_PROFILE modify profile text charset utf8mb4;

ALTER TABLE REPLY_4 CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE REPLY_4 modify reply text charset utf8mb4;



CREATE TABLE `INSTA_PROFILE_4`
(
 `inner_id` varchar(45) NOT NULL ,
 `insta_id` varchar(100) NOT NULL ,
 `profile`  text NULL ,
 `job`      varchar(100) NULL ,
 `interest` varchar(100) NULL ,
 `age`      varchar(10) NULL ,
 `gender`   varchar(10) NULL ,
 `team_idx` integer NOT NULL 
);

CREATE TABLE `INSTA_RELATION_4`
(
 `start`         varchar(45) NOT NULL ,
 `end`           varchar(45) NOT NULL ,
 `relation_type` integer NOT NULL ,
 `shortcode`     integer NULL ,
 `team_idx`      integer NOT NULL 
);

CREATE TABLE `POST_4`
(
 `shortcode`     varchar(100) NOT NULL ,
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
 `team_idx`      integer NOT NULL 
);

CREATE TABLE `REPLY_4`
(
 `shortcode`   varchar(100) NOT NULL ,
 `inner_id`    varchar(45) NOT NULL ,
 `reply_tiime` datetime NOT NULL ,
 `reply`       text NOT NULL ,
 `hashtag`     varchar(500) NULL ,
 `team_idx`    integer NOT NULL 
);