var fs = require("fs");

let all = fs.readdirSync("posts");

let posts = all.filter(file => file.match(/\.md$/));

let db = {
  byDate: {}
};

posts.forEach(post => {
  let contents = fs.readFileSync(`posts/${post}`, "utf8");
  console.info(post);
  let pubDate = contents.match(/## ([0-9\/\:\ ]+)/g)[0].substring(3);
  let title = contents.match(/# ([a-zA-Z0-9\-]+)/g)[0].substring(2);
  console.log(pubDate);
  db.byDate[pubDate] = { title, pubDate, contents };
});

module.exports = db;
