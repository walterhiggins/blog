var express = require("express");
var router = express.Router();
let posts = require("../posts");
let marked = require("marked");
/* GET home page. */
router.get("/", function(req, res) {
  res.render("index", { posts, marked });
});

module.exports = router;
