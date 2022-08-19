#!/bin/bash
# 获取自己stars项目列表


PAGE=1

if [[ $1 =~ ^[0-9]+$ ]];then
    PAGE=$1
fi

# List=(`curl -u "liaozhongxun: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lzO" https://api.github.com/users/liaozhongxun/starred\?page\=1\&per_page\=200`)
List=(`curl -H "Accept: application/vnd.github+json"  https://api.github.com/users/liaozhongxun/starred\?page\=$PAGE\&per_page\=100`)

Total=0
for(( i=0; i<=${#List[@]}; i++ ))
do
    if [[ ${List[$i]} =~ ^\"https://github.com/.*/.*\.git ]];then
        Total=$[$Total+1]
        echo ${List[$i]}
    fi
done
echo " "
echo "====================================================="
echo "共 ${Total} 个"
