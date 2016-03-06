var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var myGlobal = require('./../common/global');


/* GET users listing. */
router.get('/', function(req, res, next) {
  myGlobal.connection.query('SELECT * FROM volume_sensor', function (err, rows) {
    var totalVolume = 0;
    for(var i = 0, len = rows.length; i < len; i++){
      totalVolume = totalVolume + rows[i].volume;
    }

    // trigger_sensor.status: 1 -> waiting, 2 -> activated
    myGlobal.connection.query('SELECT * FROM trigger_sensor', function (err, rows) {
      // すべてトリガー回収した後、トリガーのステータスを落としておく
      myGlobal.connection.query('UPDATE trigger_sensor set status = 1 WHERE status = 2', function (err, rows) {});
      var triggerCount = 0;
      rows.forEach(function(row){
        row.status == 2 && triggerCount++;
      });
      myGlobal.connection.query('SELECT * FROM live ORDER BY id DESC LIMIT 1', function (err, rows) {
        var status = rows[0].status;
        res.jsonp({
          volume: totalVolume,
          trigger: triggerCount,
          status: status
        });
      });
    });
  });
});

module.exports = router;
