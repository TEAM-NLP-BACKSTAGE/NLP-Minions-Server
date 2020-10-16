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
        .header("Access-Control-Allow-Origin", "*")
        .send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
        return;
    }

    const userResult = await User.checkUser(username);
    
    if(userResult.length == 0) { //존재하지 않는 데이터
        res
        .status(statusCode.BAD_REQUEST)
        .header("Access-Control-Allow-Origin", "*")
        .send(utils.successFalse(statusCode.NO_USER, responseMessage.NO_USER));
        return;
    } else {       
        const user_idx = userResult[0].user_idx;
        res
        .status(statusCode.OK)
        .header("Access-Control-Allow-Origin", "*")
        .send(utils.successTrue(statusCode.OK, responseMessage.SIGN_IN_SUCCESS, userResult[0]));
    }
    
});

router.get('/point/:user_idx', async(req, res) => {
    console.log('in')
    const user_idx = req.params.user_idx;

    const pointResult = await User.readPoint(user_idx);
    
    if(pointResult.length == 0) {  //존재하지 않는 데이터
        res
        .status(statusCode.INTERNAL_SERVER_ERROR)
        .send(utils.successFalse(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
        return;
    }

    const username = pointResult[0].username
    const point = pointResult[0].point
    const stack_point = pointResult[0].stack_point
    
    const finalResult = {username, point, stack_point}

    res
    .status(statusCode.OK)
    .send(utils.successTrue(statusCode.OK, responseMessage.POINT_READ_SUCCESS, finalResult));
    
});

module.exports = router;