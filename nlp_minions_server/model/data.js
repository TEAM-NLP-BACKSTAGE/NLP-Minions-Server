const pool = require('../module/pool');
const table1 = 'INSTA_RELATION';
const table2 = 'INSTA_PROFILE';
const table3 = 'POST';

module.exports = {
    inputNetwork: async(json) => {
        const table_name = table1 + '_' + json.team_idx
        
        var relation_type_idx = -1
        if (json.relation_type == "follow"){
            relation_type_idx = 1
        }else{
            relation_type_idx = 2
        }

        const fields = 'team_idx, start, end, relation_type_idx, shortcode';
        const questions = `"${json.team_idx}", "${json.start}", "${json.end}", "${relation_type_idx}", "${json.shortcode}"`;
        let result = await pool.queryParam_None(`INSERT INTO ${table_name}(${fields}) VALUES(${questions})`);
        return result;
    },
    
    inputUser: async(json) => {
        const user_name = table2 + '_' + json.team_idx
        const fields = 'team_idx, inner_id, insta_id, job, interest, age, region, gender, profile';
        const questions = `"${json.team_idx}", "${json.inner_id}", "${json.insta_id}", "${json.job}", "${json.interest}", "${json.age}", "${json.region}", "${json.gender}", "${json.profile}"`;
        let result = await pool.queryParam_None(`INSERT INTO ${user_name}(${fields}) VALUES(${questions})`);
        return result;
    }
};
