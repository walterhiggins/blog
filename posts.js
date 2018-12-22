var fs = require("fs");
let t0 = new Date();
let all = fs.readdirSync("posts");

let posts = all.filter(file => file.match(/\.md$/));

let db = {
  byDate: {}
};

posts.forEach(post => {
  let contents = fs.readFileSync(`posts/${post}`, "utf8");
  console.info(post);
  let pubDate = contents.match(/## ([0-9\/\:\ ]+)/g)[0].substring(3);
  console.log(pubDate);
  db.byDate[pubDate] = contents;
});

let t1 = new Date();

console.log(posts);
console.log(t1 - t0);
