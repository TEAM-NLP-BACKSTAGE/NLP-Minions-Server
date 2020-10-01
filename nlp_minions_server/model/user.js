const pool = require('../module/pool');
const table = 'USER';

module.exports = {
    checkUser : async (username) => {
        //존재하는 회원인지 확인
        const result = await pool.queryParam_None(`SELECT user_idx FROM ${table} WHERE username = "${username}"`);
        return result;
    },

    readPoint: async (user_idx) => {
        const result = await pool.queryParam_None(`SELECT username, point, stack_point FROM ${table} WHERE user_idx = "${user_idx}"`);
        return result;
    }
}