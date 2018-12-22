var fs = require("fs");

module.exports = function() {
  let db = {
    byDate: {}
  };
  let all = fs.readdirSync("posts");
  let posts = all.filter(file => file.match(/\.md$/));
  posts.forEach(post => {
    let contents = fs.readFileSync(`posts/${post}`, "utf8");
    let pubDate = contents.match(/## ([0-9\/\:\ ]+)/g)[0].substring(3);
    let title = contents.match(/# ([a-zA-Z0-9\-]+)/g)[0].substring(2);
    db.byDate[pubDate] = { title, pubDate, contents };
  });

  return db;
};
