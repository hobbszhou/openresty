local resty_cookie = require "resty.cookie"
local cjson = require "cjson"


-- 设置cookie一: 有效期为24h
-- 这里将expires设置为有效期是一天(24h)即当前系统时间(ngx.time())加24h
local cookie = resty_cookie:new()
local session="aaaaaaa"
local ok, err = cookie:set({
    key = "middle_session",
    value = session,
    path = "/",
    secure = false,
    httponly = true,
    expires = ngx.cookie_time(ngx.time() + 60 * 60 * 24),
    domain = ngx.host,
})





-- 读取cookie一（原生）
-- ngx.print(ngx.var.http_cookie) -- 获取所有cookie，这里获取到的是一个字符串，如果不存在则返回nil
-- ngx.print(ngx.var.cookie_username) -- 获取单个cookie，_后面的cookie的name，如果不存在则返回nil



-- 设置cookie一（原生）
-- local did=11111
-- ngx.header['Set-Cookie'] = 'did=' .. did .. '; path=/; Expires=' .. ngx.cookie_time(ngx.time() + 60 * 30) 
-- ngx.header['Set-Cookie'] = {'a=32; path=/', 'b=4; path=/'}  -- 批量设置cookie
-- ngx.header['Set-Cookie'] = 'a=32; path=/'                   -- 设置单个cookie，通过多次调用来设置多个值
-- ngx.header['Set-Cookie'] = 'b=4; path=/'
-- ngx.header['Set-Cookie'] = 'c=5; path=/; Expires=' .. ngx.cookie_time(ngx.time() + 60 * 30) -- 设置Cookie过期时间为30分钟



-- 获取cookie二（lua-resty-cookie）
-- local cookie = resty_cookie:new()
-- local all_cookie = cookie:get_all() -- 这里获取到所有的cookie，是一个table，如果不存在则返回nil
-- print(cjson.encode(all_cookie))
-- print(cookie:get('c'))              -- 获取单个cookie的值，如果不存在则返回nil




-- 设置cookie二（lua-resty-cookie）
-- local cookie = resty_cookie:new()
-- cookie:set({
--     key = "c",
--     value = "123456",
--     path = "/",
--     domain = "localhost",
--     expires = ngx.cookie_time(ngx.time() + 60 * 13)
-- })
-- local all_cookie = cookie:get_all()
-- ngx.print(cjson.encode(all_cookie))
-- ngx.print(cookie:get('c'))

-- OK, 访问

-- http://localhost/index 原生

-- http://localhost/index2 lua-resty-cookie

-- 两种方式各有各的好处

-- 第一种
-- 优点：
-- 简单，无依赖
-- 缺点：
-- 太简单？不够抽象，太底层？

-- 第二种
-- 优点：
-- 获取设置都很简单，简单的封装了一层，提供了更有表现力的api接口
-- 缺点：
-- 多引入一个库，其实也不算什么缺点

