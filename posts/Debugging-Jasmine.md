# Debugging Jasmine
## 2014/03/04 10:36

If you want to debug your Jasmine tests, run Node like this 
(assuming you've kicked off an instance of node-inspector already)...

    node --debug-brk node_modules/jasmine-node/lib/jasmine-node/cli.js --verbose {PATH-TO-TEST-FOLDER}

The above statement assumes that Jasmine has been installed in the 
current working directory ( `npm install jasmine` ). Once running, open 
Chrome and visit <http://localhost:8080/debug?port=5858> 

## Categories
nodejs, debugging, javascript, unit-testing
