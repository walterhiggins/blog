var express = require("express");
var router = express.Router();
let postsFn = require("../posts");
let marked = require("marked");
/* GET home page. */
router.use(function(req, res, next) {
  req.posts = postsFn();
  next();
});
router.get("/", function(req, res) {
  res.render("index", { posts: req.posts, marked });
});
router.get("/posts.js", function(req, res) {
  res.send(`let posts = ${JSON.stringify(req.posts)}`);
});
module.exports = router;
