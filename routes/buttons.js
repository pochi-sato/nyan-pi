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
  var volumeUpdateSql = "UPDATE volume_sensor SET volume = " + req.query.volume + " WHERE device_id = " + req.query.device_id;
  triggerCountUpSql = "UPDATE trigger_sensor SET count = count + 1 WHERE device_id = " + req.query.device_id;
  if(req.query.device_id){
    myGlobal.connection.query(triggerCountUpSql, function (err, rows) {
      if(req.query.volume){
        myGlobal.connection.query(volumeUpdateSql, function (err, rows) {
          res.send('ok');
        });
      } else {
        res.send('ng');
      }
    });
  } else {
    res.send('ng');
  }
});

module.exports = router;
