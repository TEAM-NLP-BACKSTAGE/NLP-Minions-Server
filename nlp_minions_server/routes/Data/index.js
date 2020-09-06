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

module.exports = router;
