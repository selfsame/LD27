#static server
webroot = "../../"
port = 8075
static_ = require("node-static")
fileServer = new static_.Server(webroot)
require("http").createServer((request, response) ->
  request.addListener("end", ->
    fileServer.serve request, response
  ).resume()
).listen port
console.log "node-static running at http://localhost:%d", port