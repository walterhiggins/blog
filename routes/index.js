var express = require("express");
var router = express.Router();
let posts = require("../posts");
let marked = require("marked");
/* GET home page. */
router.get("/", function(req, res) {
  res.render("index", { posts, marked });
});
router.get("/posts.js", function(req, res) {
  res.send(`let posts = ${JSON.stringify(posts)}`);
});
module.exports = router;
