if ngx.req.get_uri_args()["jump"] == "1" then  
    ngx.req.set_uri("/lua_rewrite_4", true);  
    ngx.log(ngx.ERR, "=========")  
    ngx.req.set_uri_args({a = 1, b = 2});  
 end 


--  ngx.req.set_uri(uri, true)：

-- 可以内部重写uri，即会发起新的匹配location请求，等价于 rewrite ^ /lua_rewrite_4 last；
-- 此处看error log是看不到我们记录的log。

-- 所以请求如http://192.168.1.2/lua_rewrite_3?jump=1会到新的location中得到响应，此处没有/lua_rewrite_4，所以匹配到/lua请求，得到类似如下的响应

-- global variable : 2 ,
-- shared memory : 1
-- hello world

-- 即

-- rewrite ^ /lua_rewrite_3; 等价于 ngx.req.set_uri(“/lua_rewrite_3”, false);

-- rewrite ^ /lua_rewrite_3break; 等价于 ngx.req.set_uri(“/lua_rewrite_3”, false); 加if/else判断/break/return

-- rewrite ^ /lua_rewrite_4 last; 等价于 ngx.req.set_uri(“/lua_rewrite_4”, true);

-- 注意，在使用rewrite_by_lua时，开启rewrite_log on;后也看不到相应的rewrite log。