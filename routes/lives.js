var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var myGlobal = require('./../common/global');

/* GET users listing. */
router.get('/latest', function(req, res, next) {
  myGlobal.connection.query('SELECT * FROM live ORDER BY id DESC LIMIT 1', function (err, rows) {
    if (err) {
      res.send(err);
    }
    console.log(rows[0].id)
    console.log(rows[0].started_at);
    console.log(rows[0].scene);
    console.log(rows[0].status);
    var data = JSON.stringify(rows[0]);
    console.log(data);
    res.send(data);
  });
});

/* GET users listing. */
router.get('/start', function(req, res, next) {
  if(!req.query.scene) {
    res.sendStatus('NG, parameter "scene" is required')
  } else {
    var scene = req.query.scene;
    var updateSql = "INSERT INTO live (status, scene) VALUES ('started', '"+scene+"')";
    console.log('live')
    console.log(scene)
    console.log(updateSql)
    myGlobal.connection.query(updateSql, function (err, rows) {
      if (!err) {
        res.send('OK');
      } else {
        res.send(err);
      }
    });
  }
});

router.get('/end', function(req, res, next) {
  // TODO
});

module.exports = router;
