#!/bin/bash
apk update
apk add docker docker-compose
rc-update add docker boot
service docker start
addgroup vagrant docker