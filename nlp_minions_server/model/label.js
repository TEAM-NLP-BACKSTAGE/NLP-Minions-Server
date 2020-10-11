const pool = require('../module/pool');
const table1 = 'POST';
const table2 = 'INSTA_PROFILE';
const table3 = 'LABEL';

module.exports = {
    getPost : async (team_idx) => {
        //아직 라벨링 되지 않은 포스트 하나 가져오기
        const result = await pool.queryParam_None(`SELECT P.post_idx, P.inner_id, content, region_tag, hashtag, insta_id, profile FROM ${table1} AS P LEFT JOIN ${table2} AS IP ON P.inner_id = IP.inner_id LEFT JOIN ${table3} AS L ON P.post_idx = L.post_idx WHERE L.label_idx IS NULL AND P.team_idx = ${team_idx} LIMIT 1;`);
        return result;
    },

    initLabel: async (user_idx, post_idx, inner_id) => {
        const fields = 'user_idx, post_idx, inner_id';
        const questions = `"${user_idx}", "${post_idx}", "${inner_id}"`;
        const insertLabelResult = await pool.queryParam_None(`INSERT INTO ${table3}(${fields})VALUES(${questions})`);
        console.log(insertLabelResult)
        const label_idx = insertLabelResult.insertId  //쿼리 결과 패킷안의 insertId: 마지막으로 insert된 값의 PK를 가져옴
        return label_idx;
    }
}