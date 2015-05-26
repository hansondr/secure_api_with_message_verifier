# Setup

`$ bundle install && rake db:migrate`

`$ rails s`

# Example Usage

1. Login to retrieve an authentication token:

`curl -v --data "email=test@user.com&password=password" -X POST localhost:3000/api/login`

```shell
* Hostname was NOT found in DNS cache
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 3000 (#0)
> POST /api/login HTTP/1.1
> User-Agent: curl/7.35.0
> Host: localhost:3000
> Accept: */*
> Content-Length: 37
> Content-Type: application/x-www-form-urlencoded
> 
* upload completely sent off: 37 out of 37 bytes
< HTTP/1.1 200 OK 
< X-Frame-Options: SAMEORIGIN
< X-Xss-Protection: 1; mode=block
< X-Content-Type-Options: nosniff
< Content-Type: application/json; charset=utf-8
< Etag: W/"1f29e2c912c7d1e2de2b2779b73b535c"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: f220a4b6-c9fa-40ad-8dcd-ddba9c7d2511
< X-Runtime: 0.122910
* Server WEBrick/1.3.1 (Ruby/2.2.2/2015-04-13) is not blacklisted
< Server: WEBrick/1.3.1 (Ruby/2.2.2/2015-04-13)
< Date: Tue, 26 May 2015 20:37:29 GMT
< Content-Length: 194
< Connection: Keep-Alive
< 
* Connection #0 to host localhost left intact
BAh7BzoMdXNlcl9pZGkGOg9leHBpcmVzX2F0SXU6CVRpbWUNVdMcgEDC2JUKOg1uYW5vX251bWkCPAM6DW5hbm9fZGVuaQY6DXN1Ym1pY3JvIgeCgDoLb2Zmc2V0af6gqzoJem9uZUkiCE1EVAY6BkVG--859819109c7bf165167cc54bd59834d20d6dabcb
```

2. Access a secure end-point utilizing this token:

`curl -v -H "Authorization: Token token=TOKEN_HERE" localhost:3000/api/users`

```shell
* Hostname was NOT found in DNS cache
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 3000 (#0)
> GET /api/users HTTP/1.1
> User-Agent: curl/7.35.0
> Host: localhost:3000
> Accept: */*
> Authorization: Token
> token=BAh7BzoMdXNlcl9pZGkGOg9leHBpcmVzX2F0SXU6CVRpbWUNVdMcgEDC2JUKOg1uYW5vX251bWkCPAM6DW5hbm9fZGVuaQY6DXN1Ym1pY3JvIgeCgDoLb2Zmc2V0af6gqzoJem9uZUkiCE1EVAY6BkVG--859819109c7bf165167cc54bd59834d20d6dabcb
> 
< HTTP/1.1 200 OK 
< X-Frame-Options: SAMEORIGIN
< X-Xss-Protection: 1; mode=block
< X-Content-Type-Options: nosniff
< Content-Type: application/json; charset=utf-8
< Etag: W/"009dc22ffc1d4e8c4f895d88f5499d28"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 2202354c-d207-46af-a907-dd2249f4e81c
< X-Runtime: 0.006713
* Server WEBrick/1.3.1 (Ruby/2.2.2/2015-04-13) is not blacklisted
< Server: WEBrick/1.3.1 (Ruby/2.2.2/2015-04-13)
< Date: Tue, 26 May 2015 20:41:10 GMT
< Content-Length: 195
< Connection: Keep-Alive
< 
* Connection #0 to host localhost left intact
[{"id":1,"email":"test@user.com","password_digest":"$2a$10$M13oNcAWGQ93spWxzf4JPu7KrSa8MbIaV5yn5JdvZMmyhQgQYCQUq","created_at":"2015-05-26T19:55:25.774Z","updated_at":"2015-05-26T19:55:25.774Z"}]
```
