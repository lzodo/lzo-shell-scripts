#!/bin/bash

# 设置文件扩展名
extension=".tar.gz"

# 遍历当前目录下的所有文件
for file in *${extension}
do
  name=$(echo $file | cut -d'.' -f1)
  # 解压缩文件
  mkdir -p unpack/$name
  tar -xvzf ${file} -C ./unpack/$name
done
