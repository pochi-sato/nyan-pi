var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var myGlobal = require('./../common/global');


/* GET users listing. */
router.get('/', function(req, res, next) {
  myGlobal.connection.query('select * from sensor_volume', function (err, rows) {
    var totalVolume = 0;
    for(var i = 0, len = rows.length; i < len; i++){
      totalVolume = totalVolume + rows[i].volume;
    }
    res.sendStatus(totalVolume);
  });
});

module.exports = router;
