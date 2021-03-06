const express = require('express');
const router = express.Router({mergeParams: true});
const statusCode = require('../../module/utils/statusCode');
const responseMessage = require('../../module/utils/responseMessage');
const utils = require('../../module/utils/utils');
const Data = require('../../model/data');

router.post('/network', async(req, res) => {
    console.log('in')
    const network_list = req.body['data'];
    
    if(network_list == null || network_list.length == 0 ){ //비어있는지 검사
        console.log("list empty")
        res
        .status(statusCode.BAD_REQUEST)
        .send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.NULL_VALUE));
        return;
    }
    var count = 0

    for (var i = 0; i < network_list.length; i++){
        var {team_idx, start, end, relation_type, shortcode} = network_list[i];
        //console.log(shortcode)
        if(!team_idx || !start || !end || !relation_type){
            console.log("missing parameter")

            const missParameters = Object.entries({team_idx, start, end, relation_type})
            .filter(it => it[1] == undefined).map(it => it[0]).join(',');

            res.status(statusCode.BAD_REQUEST).send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.X_NULL_VALUE(missParameters), network_list[i]));
            return;
        }
        
        const json = {team_idx, start, end, relation_type, shortcode};

        
        for (var j in json){  // undefined값을 null값으로 변환
            console.log(json[j])
            if (json[j] == undefined){
                json[j] = null
                console.log(json[j])
            }
        }

        const result = await Data.inputNetwork(json);

        if(result.length == 0) {
            res.status(statusCode.INTERNAL_SERVER_ERROR).send(utils.successFalse(statusCode.INTERNAL_SERVER_ERROR, responseMessage.DATA_INPUT_FAIL, result));
            return;
        }
        count += 1
    }    

    res.status(statusCode.OK).send(utils.successTrue(statusCode.OK, responseMessage.DATA_INPUT_SUCCESS(count)));
});

router.post('/user', async(req, res) => {
    console.log('in')
    const user_list = req.body['data'];
    
    if(user_list.length == 0){ //비어있는지 검사
        console.log("list empty")
        res
        .status(statusCode.BAD_REQUEST)
        .send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.X_NULL_VALUE(user_list)));
        return;
    }
    var count = 0

    for (var i = 0; i < user_list.length; i++){
        var {team_idx, inner_id, insta_id, job, interest, age, region, gender, profile} = user_list[i];

        if(!team_idx || !inner_id || !insta_id){
            console.log("missing parameter")

            const missParameters = Object.entries({team_idx, inner_id, insta_id})
            .filter(it => it[1] == undefined).map(it => it[0]).join(',');

            res.status(statusCode.BAD_REQUEST).send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.X_NULL_VALUE(missParameters), user_list[i]));
            return;
        }

        if(!job & !interest & !age & !region & !gender){
            console.log("NO_TEAM_FEATURE")

            res.status(statusCode.BAD_REQUEST).send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.NO_TEAM_FEATURE, user_list[i]));
            return;
        }

        
        const json = {team_idx, inner_id, insta_id, job, interest, age, region, gender, profile};
    
        for (var j in json){  // undefined값을 null값으로 변환
            console.log(json[j])
            if (json[j] == undefined){
                json[j] = null
                console.log(json[j])
            }
        }

        const result = await Data.inputUser(json).catch();

        if(result.length == 0) {
            res.status(statusCode.INTERNAL_SERVER_ERROR).send(utils.successFalse(statusCode.INTERNAL_SERVER_ERROR, responseMessage.DATA_INPUT_FAIL, result));
            return;
        }
        count += 1
    }        
    res.status(statusCode.OK).send(utils.successTrue(statusCode.OK, responseMessage.DATA_INPUT_SUCCESS(count)));
    
});

router.post('/post', async(req, res) => {
    console.log('in')
    const post_list = req.body['data'];
    
    if(post_list.length == 0){ //비어있는지 검사
        console.log("list empty")
        res
        .status(statusCode.BAD_REQUEST)
        .send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.X_NULL_VALUE(post_list)));
        return;
    }
    var count = 0

    for (var i = 0; i < post_list.length; i++){
        var {inner_id, post_date, crawling_time, like_count, view_count, url, shortcode, media_url, content, region_tag, hashtag, team_idx} = post_list[i];

        if(!team_idx || !inner_id || !shortcode || !post_date || !like_count || !url || !media_url){
            console.log("missing parameter")

            const missParameters = Object.entries({team_idx, inner_id, shortcode, post_date, like_count, url, media_url})
            .filter(it => it[1] == undefined).map(it => it[0]).join(',');

            res.status(statusCode.BAD_REQUEST).send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.X_NULL_VALUE(missParameters), post_list[i]));
            return;
        }
        
        const json = {inner_id, post_date, crawling_time, like_count, view_count, url, shortcode, media_url, content, region_tag, hashtag, team_idx};
    
        for (var j in json){  // undefined값을 null값으로 변환
            console.log(json[j])
            if (json[j] == undefined){
                json[j] = null
                console.log(json[j])
            }
        }
        
        const result = await Data.inputPost(json).catch();

        if(result.length == 0) {
            res.status(statusCode.INTERNAL_SERVER_ERROR).send(utils.successFalse(statusCode.INTERNAL_SERVER_ERROR, responseMessage.DATA_INPUT_FAIL, result));
            return;
        }
        count += 1
    }        
    res.status(statusCode.OK).send(utils.successTrue(statusCode.OK, responseMessage.DATA_INPUT_SUCCESS(count)));
    
});

router.post('/reply', async(req, res) => {
    console.log('in')
    const reply_list = req.body['data'];
    
    if(reply_list.length == 0){ //비어있는지 검사
        console.log("list empty")
        res
        .status(statusCode.BAD_REQUEST)
        .send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.X_NULL_VALUE(reply_list)));
        return;
    }
    var count = 0

    for (var i = 0; i < reply_list.length; i++){
        var {inner_id, shortcode, reply_time, reply, hashtag, team_idx} = reply_list[i];

        if(!inner_id || !shortcode || !reply_time || !reply || !team_idx){
            console.log("missing parameter")

            const missParameters = Object.entries({inner_id, shortcode, reply_time, reply, team_idx})
            .filter(it => it[1] == undefined).map(it => it[0]).join(',');

            res.status(statusCode.BAD_REQUEST).send(utils.successFalse(statusCode.BAD_REQUEST, responseMessage.X_NULL_VALUE(missParameters), reply_list[i]));
            return;
        }
        
        const json = {inner_id, shortcode, reply_time, reply, hashtag, team_idx};
    
        for (var j in json){  // undefined값을 null값으로 변환
            console.log(json[j])
            if (json[j] == undefined){
                json[j] = null
                console.log(json[j])
            }
        }
        
        const result = await Data.inputReply(json).catch();

        if(result.length == 0) {
            res.status(statusCode.INTERNAL_SERVER_ERROR).send(utils.successFalse(statusCode.INTERNAL_SERVER_ERROR, responseMessage.DATA_INPUT_FAIL, result));
            return;
        }
        count += 1
    }        
    res.status(statusCode.OK).send(utils.successTrue(statusCode.OK, responseMessage.DATA_INPUT_SUCCESS(count)));
    
});



module.exports = router;
