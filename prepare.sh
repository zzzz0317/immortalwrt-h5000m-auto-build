#!/bin/bash
id
df -h
free -h
cat /proc/cpuinfo

if [ -d "immortalwrt" ]; then
    echo "repo dir exists"
    cd immortalwrt
    git reset --hard
    git pull || { echo "git pull failed"; exit 1; }
else
    echo "repo dir not exists"
    git clone -b master --single-branch --filter=blob:none "https://github.com/zzzz0317/immortalwrt" || { echo "git clone failed"; exit 1; }
    cd immortalwrt
fi

cat feeds.conf.default > feeds.conf
echo "" >> feeds.conf
echo "src-git qmodem https://github.com/FUjr/QModem.git;main" >> feeds.conf

rm -rf files
cp -r ../files .
