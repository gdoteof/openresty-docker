local res = ngx.location.capture("http://localhost:3000/")
ngx.say(res)
return
