var express = require("express");
var router = express.Router();
let postsFn = require("../posts");
let marked = require("marked");
/* GET home page. */
router.get("/", function(req, res) {
  let posts = postsFn();
  res.render("index", { posts, marked });
});
router.get("/posts.js", function(req, res) {
  let posts = postsFn();
  res.send(`let posts = ${JSON.stringify(posts)}`);
});
module.exports = router;
