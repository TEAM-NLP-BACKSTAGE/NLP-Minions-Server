var express = require('express');
var router = express.Router({mergeParams: true});

router.use('/data', require('./Data'));
router.use('/user', require('./User'));
router.use('/home', require('./Home'));
router.use('/label', require('./Label'));


/* GET home page. */
router.get('/', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.send('"인스타그램 데이터 구축 프로젝트" 사이트에 오신걸 환영합니다!<br><br><br>- NLP-Minions Fam👨‍👧‍👧 : 승범 은혜 하담 규명 인용 지상 소정');
});

module.exports = router;
