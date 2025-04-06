#! /usr/bin/env sh
#CS2080: Programming with Unix, Assignment 7
#
# Copyright (c) Joshua Holder
# All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
#  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


#
#
#
#   WARNING: DO NOT RUN THIS SCRIPT IN YOUR OWN COMPUTER. EXPERIMENT FROM VM OR
#            AWS !!!!!!
#
#


#Functions of script
#1. Start nginx service
#2. Using stream editor to change "Welcome to nginx" to "Welcome to Joshua's page"
#3. Using stream editor to replace all occurrences of "nginx" to "nginx (pronounced as EngineX)"
#4. Restart nginx service

#Start Nginx
service nginx start

#Using the sed command to make changes to the original nginx page:
#sed -i (in place editing so the changes stay permanant)
#/s is the substitution operation so the first is the if statement and on the other side is what to replace with.
#/g is the global operation added at the end to make sure all instances of the word nginx is replaced. 
sed -i "s/Welcome to nginx/Welcome to Joshua's page/" /var/www/html/*.html
sed -i "s/nginx/nginx (pronounced as EngineX)/g" /var/www/html/*.html

#Restart nginx to apply all sed -i changes.
service nginx restart

#Keep the container running using the tail command to prevent the website from closing the second the script is done reading.
tail -f /dev/null