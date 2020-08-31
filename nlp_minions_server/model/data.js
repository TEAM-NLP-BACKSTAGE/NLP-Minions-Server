const pool = require('../module/pool');
const table1 = 'INSTA_RELATION';
const table2 = 'INSTA_PROFILE';
const table3 = 'POST';

module.exports = {
    inputNetwork: async(json) => {
        const fields = 'team_idx, start, end, relation_type, team_idx';
        const questions = `"${json.team_idx}", "${json.start}", "${json.end}", "${json.relation_type}"`;
        let result = await pool.queryParam_None(`INSERT INTO ${table1}(${fields}) VALUES(${questions}, (SELECT post_idx FROM ${table3} WHERE shortcode = "${json.shortcode}"))`);
        return result;
    }             
};
