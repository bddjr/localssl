cd /d "%~dp0"
mkdir out

openssl ecparam -out out/localssl.key -name prime256v1 -genkey
openssl req -new -sha256 -key out/localssl.key -out out/localssl.csr -subj "/C=/ST=/L=/O=/OU=/CN=localssl"
openssl x509 -req -sha256 -days 365000 -in out/localssl.csr -signkey out/localssl.key -out out/localssl.crt

generateDomain.bat
