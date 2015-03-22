require("os")
require("utils")
local redis = require "resty.redis"
local red = redis:new()
local cjson = require "cjson"

local redishost = os.getenv("REDIS_HOST")
local ok, err = red:connect(redishost, 6379)
if not ok then
    ngx.say("failed to connect: ", err)
    return
end

local output = 
{
  data = {
    {
      model= {
          image= "models/371d0baa-aa79-489e-9b12-da3335905a13/image.jpg",
          num_pos= 593,
          num_neg= -1,
          size= {
              10,
              10
          },
          uuid= "371d0baa-aa79-489e-9b12-da3335905a13",
          name= "face",
          start_time= "2015-03-16T04:52:12.692Z",
          end_time= "2015-03-16T05:07:19.659Z"
      },
      id= "73ccee7b-00b6-454d-b96e-074e75b82846"
    }
  }
}

output.data[1].id = red:srandmember('sessionids')
ngx.say(cjson.encode(output));
