var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var myGlobal = require('./../common/global');


/* GET users listing. */
router.get('/', function(req, res, next) {
  myGlobal.connection.query('select * from volume_sensor', function (err, rows) {
    res.send('respond with a resource');
  });
});

/* GET users listing. */
router.get('/input', function(req, res, next) {
  myGlobal.isButtonPushed = true;
  var updateSql = "update volume_sensor set volume = " + req.query.volume + " where device_id = " + req.query.device_id;
  if(req.query.device_id && req.query.volume){
    myGlobal.connection.query(updateSql, function (err, rows) {
      res.send('ok');
    });
  } else {
    res.send('ng');
  }
});

module.exports = router;
