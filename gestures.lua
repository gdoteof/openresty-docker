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


ngx.req.read_body()
local body, err = ngx.req.get_body_data()
if not body then
    ngx.say("failed to get post args: ", err)
end
ngx.say("body as string is " .. body);

local args, err = ngx.req.get_post_args()
if not args then
    ngx.say("failed to get post args: ", err)
    return
end
for key, val in pairs(args) do
    if type(val) == "table" then
        ngx.say(key, ": ", table.concat(val, ", "))
    else
        ngx.say(key, ": ", val)
    end
end

local args, err = ngx.req.get_post_args();
 
local wholerequest = ngx.var.request;
ngx.say('request2 is: \n=====');
ngx.print(wholerequest);
ngx.say('\n======');
local path = wholerequest:split(" ")[2]
ngx.say("path is " .. path);

ngx.say("body is " .. body);
ngx.say("dumped val is ");
local value=cjson.new().decode(body);
ngx.say(value.foo)
val = {true, {zzz = "yyy"}}
json_text = cjson.encode(val)
ngx.say("json text is " .. json_text)

json_val = cjson.new().decode(json_text)
ngx.say(vardump(json_val));
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
