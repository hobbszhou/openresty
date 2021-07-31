local redis = require "resty.redis"
local cjson = require "cjson"
local numbers = {["0"]="39.98.55.170",["1"]="10.0.0.248"}


--nginx变量  
local var = ngx.var  
ngx.say("ngx.var.a : ", var.a, "<br/>")  
ngx.say("ngx.var.b : ", var.b, "<br/>")  
ngx.say("ngx.var[2] : ", var[2], "<br/>")  
ngx.var.b = 2;  

ngx.say("<br/>")  



-- 获取url中的参数 ， url 获取参数的键值对, table格式
local args = ngx.req.get_uri_args()
if args ~= nil then
    for key, value in pairs(args) do
        ngx.print(tostring(key).."  "..tostring(value).."\n")
    end
end

local uri = ngx.var.request_uri
ngx.print("uri--- "..uri.."\n")

local cookie = ngx.var.cookie_did

if cookie ~= nil then
    ngx.print("cookie--- "..cookie.."\n")
end

-- get请求获取参数  http://192.168.31.102:8080/test2?uuid=0123
if  string.find(uri, 'uuid=') then
    did = args["uuid"]
    ngx.header['Set-Cookie'] = 'did=' .. did .. '; path=/; Expires=' .. ngx.cookie_time(ngx.time() + 60 * 30) 
    channel = 0

    -- ngx.req.read_body()
    -- local body_data = ngx.req.get_body_data()
    -- ngx.print("cookie--- "..tostring(body_data).."\n")
    -- local data = cjson.decode(body_data)
    -- ngx.print("cookie--- "..tostring(data).."\n")
end
-- post请求获取body体里的值   http://192.168.31.102:8080/yuyu {"call_id":"111111", "name":"zhb", "passwd":"12345"}
if  string.find(uri, 'yuyu') then
    ngx.req.read_body()
    local body_data = ngx.req.get_body_data()
    ngx.print("cookie--- "..tostring(body_data).."\n")
    local data = cjson.decode(body_data)
    ngx.print("cookie--- "..tostring(data).."\n")
    channel = 1
end





-- if cookie ~= nil then	
-- 	ngx.print('cookie is not empty')
-- end
-- if did == nil then
--     ngx.print(uri)
--     ngx.print(cjson.encode(args))
--     ngx.print('callid is empty')
--     return ''
-- end
-- local res11 = localhost:10007
-- if res11 == ngx.null then
--     ngx.say("cache get  error")
--     return ''
-- end
-- ngx.var.backend = res11


--- redis测试---- begin----------

-- local redis_client = redis.new()
-- local arg = ngx.var.arg_uuid
-- local uuid_f = string.sub(arg,0,1)
-- ngx.print("---"..arg.."  "..numbers[uuid_f].."    "..uuid_f.."   \n")
-- local ok,err=redis_client.connect(redis_client,numbers[uuid_f],"6379")
-- ok, err = redis_client:auth("Venus12%3456")
-- if not ok then
--    ngx.print("failed to connect:",err)
--    return
-- end

-- local res = redis_client:get("aaaaa")

-- if res==ngx.null then
--     ngx.print("This is null")
-- else
--     ngx.print(res)
-- end
-- ngx.var.backend = res
-- redis_client:close()

--- redis测试---- end-------------------