const express = require('express');
const router = express.Router({mergeParams: true});
const statusCode = require('../../module/utils/statusCode');
const responseMessage = require('../../module/utils/responseMessage');
const utils = require('../../module/utils/utils');
const Analysis = require('../../model/analysis');

router.post('/', async(req, res) => {
    console.log('in')
    const {insta_id} = req.body;
    
    if(insta_id == null || insta_id.length == 0 ){ //비어있는지 검사
        console.log("empty")
        res
        .status(statusCode.BAD_REQUEST)
        .send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
        return;
    }

    const analysisResult = await Analysis.returnUserInfo(insta_id);
    

    if(analysisResult.length == 0) { //존재하지 않는 데이터
        res
        .status(statusCode.BAD_REQUEST)
        .send(utils.successFalse(statusCode.NO_USER, responseMessage.NO_INSTA_USER));
        return;
    }  
    
    res
    .status(statusCode.OK)
    .send(utils.successTrue(statusCode.OK, responseMessage.RETURN_ANALYSIS_RESULT_SUCCESS, analysisResult[0]));  
});

module.exports = router;