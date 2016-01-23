#!/bin/bash
source creds.sh

wget --save-cookies cookies.txt \
	--keep-session-cookies \
	--post-data "username-or-email=$USERNAME&password=$PASSWORD" \
	https://www.factorio.com/login \
	-O login-result
grep "Wrong username" login-result > /dev/null
echo Login right: $?
grep "log out" login-result > /dev/null
echo Login wrong: $?

function download () {
LINK=$1
wget --load-cookies cookies.txt \
	--no-check-certificate \
	--content-disposition \
	--no-clobber \
	$LINK
}

VER=0.12.20

#download "https://www.factorio.com/get-download/$VER/alpha/win64"
#download "https://www.factorio.com/get-download/$VER/alpha/win32"
#download "https://www.factorio.com/get-download/$VER/alpha/win64-manual"
#download "https://www.factorio.com/get-download/$VER/alpha/win32-manual"
#download "https://www.factorio.com/get-download/$VER/alpha/osx"
#download "https://www.factorio.com/get-download/$VER/alpha/linux64"
#download "https://www.factorio.com/get-download/$VER/alpha/linux32"
download "https://www.factorio.com/get-download/0.12.20/headless/linux64"
