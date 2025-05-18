#!/bin/bash
# 先编译依赖模块
cd ../ktbl-words-compare
mvn clean install

# 再编译主项目
cd ../ktbl-boot
mvn clean package

# 最后使用jlink打包
mvn jlink:jlink


mvn dependency:list
mvn clean package -DskipTests

wix311.exe
//exe4j
mvn clean package jpackage:jpackage
