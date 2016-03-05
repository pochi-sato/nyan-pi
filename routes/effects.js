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
    myGlobal.connection.query('SELECT * FROM live ORDER BY id DESC LIMIT 1', function (err, rows) {
      var status = rows[0].status;
      res.jsonp({
        volume: totalVolume,
        status: status
      });
    });
  });
});

module.exports = router;
