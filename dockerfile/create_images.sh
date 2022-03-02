# 切换脚本的执行目录
cd `dirname $0`

# --pull:拉取最新的镜像; -t:给新建的镜像打标签
docker build --force-rm --no-cache -t common:pytorch-1.8 .
# docker build --force-rm --no-cache -t common:tensorflow-2.7 .
# docker build --force-rm --no-cache -t common:tensorflow-0.12 .
