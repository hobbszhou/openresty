if ngx.req.get_uri_args()["jump"] == "1" then  
    ngx.req.set_uri("/lua_rewrite_3", false);  
    ngx.req.set_uri("/lua_rewrite_4", false);  
    ngx.req.set_uri_args({a = 1, b = 2});  
 end  

--  访问如http://192.168.1.2/lua_rewrite_2?jump=0时得到响应
-- rewrite2 uri : /lua_rewrite_2, a :

-- 访问如http://192.168.1.2/lua_rewrite_2?jump=1时得到响应
-- rewrite2 uri : /lua_rewrite_4, a : 1