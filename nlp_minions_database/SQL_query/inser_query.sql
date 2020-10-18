
INSERT INTO INSTA_PROFILE(inner_id, insta_id, profile, job, interest, age, region, gender, team_idx)
VALUES (`"${json.inner_id}", "${json.insta_id}", "${json.profile}", "${json.job}", "${json.interest}", "${json.age}", "${json.region}", "${json.gender}", "${json.team_idx}"`);

INSERT INTO INSTA_PROFILE(inner_id, insta_id, profile, job, interest, age, region, gender, team_idx)
VALUES ("1595300180", "gildong123", "패션_일상 #185cm #디엠", "학생, 개발자", "여행, 맛집, 헬스", "20대", "수도권, 강원", "남자", 1);

#=================================================================================================================================================================================================================================================

INSERT INTO POST(inner_id, post_date, crawling_time, like_count, view_count, url, shortcode, media_url, content, region_tag, hashtag, team_idx)
VALUES (`"${json.inner_id}", "${json.post_date}", "${json.crawling_time}", "${json.like_count}", "${json.view_count}", "${json.url}", "${json.shortcode}", "${json.media_url}", "${json.content}", "${json.region_tag}", "${json.hashtag}", "${json.team_idx}"`);

INSERT INTO POST_1(inner_id, post_date, crawling_time, like_count, view_count, url, shortcode, media_url, content, region_tag, hashtag, team_idx)
VALUES (`"${json.inner_id}", "${json.post_date}", "${json.crawling_time}", "${json.like_count}", "${json.view_count}", "${json.url}", "${json.shortcode}", "${json.media_url}", "${json.content}", "${json.region_tag}", "${json.hashtag}", "${json.team_idx}"`);

#=================================================================================================================================================================================================================================================


INSERT INTO REPLY(inner_id, reply_time, reply, hashtag, team_idx, post_idx)
VALUES (`"${json.inner_id}", "${json.reply_time}", "${json.reply}", "${json.hashtag}", "${json.team_idx}"`, (SELECT post_idx FROM POST WHERE shortcode=`"${json.shortcode}"`));

INSERT INTO REPLY_1(inner_id, reply_time, reply, hashtag, team_idx, shortcode)
VALUES (`"${json.inner_id}", "${json.reply_time}", "${json.reply}", "${json.hashtag}", "${json.team_idx}", "${json.shortcode}"`);

INSERT INTO REPLY(inner_id, reply_time, reply, hashtag, team_idx, post_idx)
VALUES ("123456", "2020-08-10 17:10:00", "맛있겠다~~ #맛집 #카페 #갈비집", "맛집, 카페, 갈비집", 1, (SELECT post_idx FROM POST WHERE shortcode="CDj8771Aw"));


#=================================================================================================================================================================================================================================================


INSERT INTO INSTA_RELATION(start, end, relation_type, team_idx, post_idx)
VALUES (`"${json.start}", "${json.end}", "${json.relation_type}", "${json.team_idx}"`, (SELECT post_idx FROM POST WHERE shortcode=`"${json.shortcode}"`));

INSERT INTO INSTA_RELATION_1(start, end, relation_type, team_idx, shortcode)
VALUES (`"${json.start}", "${json.end}", "${json.relation_type}", "${json.team_idx}", "${json.shortcode}"`);

INSERT INTO INSTA_RELATION(start, end, relation_type, team_idx, post_idx)
VALUES ("11515015151", "5151515482626", "tag", 1, (SELECT post_idx FROM POST WHERE shortcode="CDj8771Aw"));
