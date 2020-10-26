const pool = require('../module/pool');
const table1 = 'INSTA_PROFILE';
const table2 = 'CODE'

module.exports = {
    returnUserInfo : async (insta_id) => {
        //분석 결과 반환
        const result = await pool.queryParam_None(`SELECT (SELECT category_type From ${table2} WHERE ${table2}.simple_word = ${table1}.age) AS age, (SELECT category_type From ${table2} WHERE ${table2}.simple_word = ${table1}.gender) AS gender, (SELECT category_type From ${table2} WHERE ${table2}.simple_word = ${table1}.region) AS region, (SELECT category_type From ${table2} WHERE ${table2}.simple_word = ${table1}.interest) AS interest FROM ${table1} where insta_id = "${insta_id}"`);
        return result;
    }
}