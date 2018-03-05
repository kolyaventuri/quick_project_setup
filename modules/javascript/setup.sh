#!/bin/sh

part=$3
lib="${part}/lib"
test="${part}/test"

hound="${part}/.hound.yml"

jshint="${part}/.jshintrc"
jsignore="${part}/.jshintignore"

echo Generating Node.js project

mkdir $lib
mkdir $test

npm init -y
echo "{\n\t\"esversion\": 6\n}" > $jshint
echo "test/**/*.js" > $jsignore

echo "jshint:\n  ignore_file: .jshintignore\n  config_file: .jshintrc" > $hound