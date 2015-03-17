require("os")
require("utils")
local redis = require "resty.redis"
local red = redis:new()
local cjson = require "cjson"

local ok, err = red:connect("172.17.0.26", 6379)
if not ok then
    ngx.say("failed to connect: ", err)
    return
end

local body = ngx.req.read_body();
if body then
  ngx.say("bosy is\n=====\n");
  ngx.print(body);
  ngx.say("\n========\n");
end


vardump(ngx.req);
 
local wholerequest = ngx.var.request;
ngx.say('request is: \n=====');
ngx.print(wholerequest);
ngx.say('\n======');
local path = wholerequest:split(" ")[2]
ngx.say("path is " .. path);
-- ngx.say('res is ' .. res)
-- local value=cjson.new().decode(res.body)
-- ngx.print(value)
-- 
--     
-- ok, err = red:lrange("connections", 0, -1)
-- if not ok then
--     ngx.say("failed to set dog: ", err)
--     return
-- end
-- ngx.print(ok)
