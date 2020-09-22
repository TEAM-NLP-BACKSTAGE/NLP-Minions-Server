const express = require('express');
const router = express.Router({mergeParams: true});
const statusCode = require('../../module/utils/statusCode');
const responseMessage = require('../../module/utils/responseMessage');
const utils = require('../../module/utils/utils');
const Home = require('../../model/home');

router.get('/rank', async(req, res) => {
    console.log('in')
    const rankResult = await Home.readRank();
    
    if(rankResult.length == 0) {
        res
        .status(statusCode.INTERNAL_SERVER_ERROR)
        .send(utils.successFalse(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
        return;
    } else {       
        res
        .status(statusCode.OK)
        .send(utils.successTrue(statusCode.OK, responseMessage.RANKING_READ_SUCCESS, rankResult));
    }
    
});

module.exports = router;