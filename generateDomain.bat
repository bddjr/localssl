cd /d "%~dp0"
mkdir out

openssl ecparam -out out/localhost.key -name prime256v1 -genkey
openssl req -new -sha256 -key out/localhost.key -out out/localhost.csr -subj "/C=/ST=/L=/O=/OU=/CN=localhost"
openssl x509 -req -in out/localhost.csr -CA out/localssl.crt -CAkey out/localssl.key -CAcreateserial -out out/localhost.crt -days 365000 -sha256 -extfile localssl.ext

if "%1" neq "nopause" pause
