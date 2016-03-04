var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var myGlobal = require('./../common/global');


/* GET users listing. */
router.get('/', function(req, res, next) {
  myGlobal.connection.query('select * from sensor_volume', function (err, rows) {
    console.log(rows[0].type)
    console.log(rows[0].device_id)
    console.log(rows[0].volume)
    console.log(JSON.stringify(rows))
    res.send('respond with a resource');
  });
});

/* GET users listing. */
router.get('/input', function(req, res, next) {
  var updateSql = "update sensor_volume set volume = " + req.query.volume + " where type = 'camera' and device_id = " + req.query.device_id;
  console.log(updateSql)
  console.log('button')
  console.log(req.query.device_id)
  console.log(req.query.volume)
  if(req.query.device_id && req.query.volume){
    myGlobal.connection.query(updateSql, function (err, rows) {
      res.send('ok');
    });
  } else {
    res.send('ng');
  }
});

module.exports = router;
