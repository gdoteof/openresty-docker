require("os")
require("utils")
local redis = require "resty.redis"
local red = redis:new()
local cjson = require "cjson"

local ok, err = red:connect("172.17.0.48", 6379)

local path = ngx.var.request:split(" ")[2]
local sid = ngx.re.match(path,[=[/([^/]+)$]=])[1] 
ngx.req.read_body()
local inbody = ngx.req.get_body_data()

local asobj = cjson.decode(inbody);
asobj.params = nil
ngx.req.set_body_data(cjson.encode(asobj))
ngx.var.backend = red:hget("sessions", sid) .. path


