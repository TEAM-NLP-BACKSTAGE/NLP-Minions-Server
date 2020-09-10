const pool = require('../module/pool');
const table = 'USER';

module.exports = {
    checkUser : async (username) => {
        //존재하는 회원인지 확인
        const result = await pool.queryParam_None(`SELECT user_idx FROM ${table} WHERE username = "${username}"`);
        return result;
    }
}