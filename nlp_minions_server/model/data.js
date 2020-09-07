const pool = require('../module/pool');
const table1 = 'INSTA_RELATION';
const table2 = 'INSTA_PROFILE';
const table3 = 'POST';

module.exports = {
    inputNetwork: async(json) => {

        // null값을 가질 수 있는 변수 대상으로 쿼리 형식 맞추기
        let shortcode = json.shortcode
        if (shortcode){
            shortcode = `"${json.shortcode}"`
        }

        // 문자열 -> 코드값으로 변환 (코드값 확정x)
        var relation_type_idx = -1
        if (json.relation_type == "follow"){
            relation_type_idx = 1
        }else{
            relation_type_idx = 2
        }

        const table_name = table1 + '_' + json.team_idx
        const fields = 'team_idx, start, end, relation_type_idx, shortcode';
        const questions = `"${json.team_idx}", "${json.start}", "${json.end}", "${relation_type_idx}", ${json.shortcode}`;
        let result = await pool.queryParam_None(`INSERT INTO ${table_name}(${fields}) VALUES(${questions})`);
        return result;
    },
    
    inputUser: async(json) => {
        
        // null값을 가질 수 있는 변수들 대상으로 쿼리 형식 맞추기
        let job = json.job
        if (job){
            job = `"${json.job}"`
        }

        let interest = json.interest
        if (interest){
            interest = `"${json.interest}"`
        }

        let age = json.age
        if (age){
            age = `"${json.age}"`
        }

        let region = json.region
        if (job){
            job = `"${json.job}"`
        }

        let gender = json.gender
        if (gender){
            gender = `"${json.gender}"`
        }

        let profile = json.profile
        if (profile){
            profile = `"${json.profile}"`
        }
        
        const table_name = table2 + '_' + json.team_idx
        const fields = 'team_idx, inner_id, insta_id, job, interest, age, region, gender, profile';
        const questions = `"${json.team_idx}", "${json.inner_id}", "${json.insta_id}", ${job}, ${interest}, ${age}, ${region}, ${gender}, ${profile}`;
        let result = await pool.queryParam_None(`INSERT INTO ${table_name}(${fields}) VALUES(${questions})`);
        return result;
    },

    inputPost: async(json) => {

        // null값을 가질 수 있는 변수들 대상으로 쿼리 형식 맞추기
        let crawling_time = json.crawling_time
        if (crawling_time){
            crawling_time = `"${json.crawling_time}"`
        }

        let view_count = json.view_count
        if (view_count){
            view_count = `"${json.view_count}"`
        }

        let content = json.content
        if (content){
            content = `"${json.content}"`
        }

        let region_tag = json.region_tag
        if (region_tag){
            region_tag = `"${json.region_tag}"`
        }

        let hashtag = json.hashtag
        if (hashtag){
            hashtag = `"${json.hashtag}"`
        }

        const table_name = table3 + '_' + json.team_idx
        const fields = 'inner_id, post_date, crawling_time, like_count, view_count, url, shortcode, media_url, content, region_tag, hashtag, team_idx';
        const questions = `"${json.inner_id}", "${json.post_date}", ${crawling_time}, "${json.like_count}", ${view_count}, "${json.url}", "${json.shortcode}", "${json.media_url}", ${content}, ${region_tag}, ${hashtag}, "${json.team_idx}"`;
        let result = await pool.queryParam_None(`INSERT INTO ${table_name}(${fields}) VALUES(${questions})`);
        return result;
    },
};
