const express = require('express');
const router = express.Router({mergeParams: true});
const statusCode = require('../../module/utils/statusCode');
const responseMessage = require('../../module/utils/responseMessage');
const utils = require('../../module/utils/utils');
const User = require('../../model/user');

router.post('/signin', async(req, res) => {
    console.log('in')
    const {username} = req.body;
    
    if(username == null || username.length == 0 ){ //비어있는지 검사
        console.log("empty")
        res
        .status(statusCode.BAD_REQUEST)
        .send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
        return;
    }

    const userResult = await User.checkUser(username);
    
    if(userResult.length == 0) { //존재하지 않는 데이터
        res
        .status(statusCode.BAD_REQUEST)
        .send(utils.successFalse(statusCode.NO_USER, responseMessage.NO_USER));
        return;
    } else {       
        const user_idx = userResult[0].user_idx;
        res
        .status(statusCode.OK)
        .send(utils.successTrue(statusCode.OK, responseMessage.SIGN_IN_SUCCESS, userResult[0]));
    }
    
});

module.exports = router;