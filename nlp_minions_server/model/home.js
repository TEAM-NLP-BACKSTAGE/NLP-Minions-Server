const pool = require('../module/pool');
const table = 'USER';

module.exports = {
    readRank : async () => {
        //회원별 누적 포인트 랭킹 조회
        const result = await pool.queryParam_None(`SELECT username, stack_point FROM ${table} ORDER BY stack_point desc LIMIT 5`);
        return result;
    }
}