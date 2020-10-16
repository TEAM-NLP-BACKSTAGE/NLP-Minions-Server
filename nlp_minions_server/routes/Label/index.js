const express = require('express');
const router = express.Router({mergeParams: true});
const statusCode = require('../../module/utils/statusCode');
const responseMessage = require('../../module/utils/responseMessage');
const utils = require('../../module/utils/utils');
const Label = require('../../model/label');

// 라벨링 화면 출력
router.get('/user_idx/:user_idx/team_idx/:team_idx', async(req, res) => {
    console.log('in')
    const user_idx = req.params.user_idx;
    const team_idx = req.params.team_idx;

    const postResult = await Label.getPost(team_idx);

    if(postResult.length == 0) {
        res.status(statusCode.NO_POST).send(utils.successFalse(statusCode.NO_POST, responseMessage.NO_LABELLING_POST));
        return;
    } 

    const post_idx = postResult[0].post_idx;
    const content = postResult[0].content;
    const region_tag = postResult[0].region_tag;
    const hashtag = postResult[0].hashtag;
    const insta_id = postResult[0].insta_id;
    const profile = postResult[0].profile;
    const inner_id = postResult[0].inner_id;

    const label_idx = await Label.initLabel(user_idx, post_idx, inner_id)
    
    if(!label_idx) {
        res
        .status(statusCode.INTERNAL_SERVER_ERROR)
        .send(utils.successFalse(statusCode.INTERNAL_SERVER_ERROR, responseMessage.INTERNAL_SERVER_ERROR));
        return;
    }

    const finalResult = {post_idx, label_idx, content, region_tag, hashtag, insta_id, profile}

    res
    .status(statusCode.OK)
    .send(utils.successTrue(statusCode.OK, responseMessage.READ_LABELLING_POST_SUCCESS, finalResult));    
});

// 라벨링 저장
router.put("/saveLabel", async(req, res) => {
    var {label_idx, user_idx, answer} = req.body;

    if(!label_idx || !user_idx || !answer)
    {
        const missParameters = Object.entries({label_idx, user_idx, answer}).filter(it => it[1] == undefined).map(it => it[0]).join(',');
        res.status(statusCode.BAD_REQUEST).send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.X_NULL_VALUE(missParameters)));
        return;
    }

    answer = answer.replace(/(\s*)/g, ""); //문자열의 모든 공백 제거


    const result = await Label.saveLabel(label_idx, user_idx, answer);

    if(result.length == 0)
    {
    res.status(statusCode.INTERNAL_SERVER_ERROR).send(utils.successFalse(statusCode.INTERNAL_SERVER_ERROR, responseMessage.LABEL_SAVE_FAIL));
    return;
    }
    else{
        res.status(statusCode.OK).send(utils.successTrue(statusCode.OK,responseMessage.LABEL_SAVE_SUCCESS));
    }
});

module.exports = router;