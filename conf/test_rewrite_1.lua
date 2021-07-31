if ngx.req.get_uri_args()["jump"] == "1" then  
    return ngx.redirect("http://www.jd.com?jump=1", 302)  
 end  


--  当我们请求http://192.168.1.2/lua_rewrite_1时发现没有跳转，
-- 而请求http://192.168.1.2/lua_rewrite_1?jump=1时发现跳转到京东首页了。 此处需要301/302跳转根据自己需求定义。