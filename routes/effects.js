var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var myGlobal = require('./../common/global');
var triggerThreshold = 10;

/* GET users listing. */
router.get('/', function(req, res, next) {
  myGlobal.connection.query('SELECT * FROM volume_sensor WHERE device_id in (1,2,4)', function (err, rows) {
    var totalVolume = 0;
    for(var i = 0, len = rows.length; i < len; i++){
      totalVolume = totalVolume + rows[i].volume;
    }

    myGlobal.connection.query('SELECT * FROM trigger_sensor', function (err, rows) {
      // すべてトリガー回収した後、トリガーのカウントを0にしておく
      myGlobal.connection.query('UPDATE trigger_sensor set count = 0 WHERE count <> 0', function (err, rows) {});
      var triggerCount = 0;
      rows.forEach(function(row){
        if(triggerCount <= triggerThreshold){
          triggerCount = triggerCount + row.count;
        }
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
