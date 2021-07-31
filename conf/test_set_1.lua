local uri_args = ngx.req.get_uri_args()  
local i = uri_args["i"] or 0  
local j = uri_args["j"] or 0  

return i + j 



-- set_by_lua_file：语法set_by_lua_file $var lua_file arg1 arg2…; 在lua代码中可以实现所有复杂的逻辑，但是要执行速度很快，不要阻塞；
-- 得到请求参数进行相加然后返回。

-- 访问如http://192.168.1.2/lua_set_1?i=1&j=10进行测试。 如果我们用纯set指令是无法实现的。

-- 再举个实际例子，我们实际工作时经常涉及到网站改版，有时候需要新老并存，或者切一部分流量到新版