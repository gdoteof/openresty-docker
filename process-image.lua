require("os")
require("utils")
local redis = require "resty.redis"
local red = redis:new()
local cjson = require "cjson"

local ok, err = red:connect("172.17.0.48", 6379)

local path = ngx.var.request:split(" ")[2]
local sid = ngx.re.match(path,[=[/([^/]+)$]=])[1] 

ngx.var.backend = red:hget("sessions", sid) .. path

