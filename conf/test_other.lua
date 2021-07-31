--未经解码的请求uri  
local request_uri = ngx.var.request_uri;  
ngx.say("request_uri : ", request_uri, "<br/>");  
--解码  
ngx.say("decode request_uri : ", ngx.unescape_uri(request_uri), "<br/>");  
--MD5  
ngx.say("ngx.md5 : ", ngx.md5("123"), "<br/>")  
--http time  
ngx.say("ngx.http_time : ", ngx.http_time(ngx.time()), "<br/>")  


-- ngx.escape_uri/ngx.unescape_uri ： uri编码解码；

-- ngx.encode_args/ngx.decode_args：参数编码解码；

-- ngx.encode_base64/ngx.decode_base64：BASE64编码解码；

-- ngx.re.match：nginx正则表达式匹配；