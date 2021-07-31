ngx.redirect("http://www.baidu.com", 302)  

-- ngx.redirect：重定向；

-- ngx.status=状态码，设置响应的状态码；ngx.resp.get_headers()获取设置的响应状态码；
-- ngx.send_headers()发送响应状态码，当调用ngx.say/ngx.print时自动发送响应状态码；可以通过ngx.headers_sent=true判断是否发送了响应状态码。