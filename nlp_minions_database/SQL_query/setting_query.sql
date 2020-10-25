SELECT * FROM SocialAnalysis.POST_4;

ALTER DATABASE SocialAnalysis CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

ALTER TABLE POST CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE POST modify content text charset utf8mb4;

ALTER TABLE POST CHANGE content content VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

TRUNCATE TABLE INSTA_RELATION_2;

TRUNCATE TABLE INSTA_PROFILE_3;

TRUNCATE TABLE LABEL;

DROP TABLE REPLY;

INSERT INTO POST (SELECT * FROM POST_4);

INSERT INTO POST(shortcode, inner_id, post_date, crawling_time, like_count, view_count, url, media_url, content, region_tag, hashtag, team_idx) 
SELECT shortcode, inner_id, post_date, crawling_time, like_count, view_count, url, media_url, content, region_tag, hashtag, team_idx
FROM POST_1;

INSERT IGNORE INTO POST(shortcode, inner_id, post_date, content, team_idx) 
SELECT shortcode, inner_id, post_date, content, team_idx
FROM POST_4;

INSERT INTO INSTA_RELATION (SELECT * FROM INSTA_RELATION_4);

INSERT INTO INSTA_RELATION(start, end, relation_type, team_idx) 
SELECT start, end, relation_type, team_idx
FROM INSTA_RELATION_3;


SET SQL_SAFE_UPDATES = 0;

DELETE FROM POST WHERE team_idx=1;

INSERT IGNORE INTO INSTA_PROFILE(inner_id, team_idx) 
SELECT inner_id, team_idx
FROM POST;

ALTER TABLE POST ADD FOREIGN KEY (inner_id) REFERENCES INSTA_PROFILE(inner_id);

UPDATE INSTA_PROFILE SET insta_id = null WHERE inner_id = '10007242076'

ALTER TABLE POST AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE POST SET post_idx = @COUNT:=@COUNT+1;