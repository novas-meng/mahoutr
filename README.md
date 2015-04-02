# mahoutr
big data for R 

MAHOUR，具体是将并行化算法移植到R语言中的一个数据分析平台，由海量数据研究中心负责开发，以下是具体安装步骤。

环境准备：系统要求 ubuntu,jdk最好为1.6 确保hadoop,mahout,R安装正确，并且可以顺利运行。

以下是具体安装步骤：

1:下载MAHOUTR压缩包，github 地址为https://github.com/novas-meng/mahoutr.git，解压到相应目录，推荐解压到/usr目录下。然后改变权限;

chown -R novas /usr/mahoutr

2:导入环境变量。打开/etc/profile文件

sudo gedit /etc/profile

添加如下环境变量  export MAHOUTR_HOME=/usr/mahoutr

之后保存，使之生效source /etc/profile;

3:安装对应的R包，在mahoutr/rpackages/下，目前完成的包有贝叶斯分类器。

安装R包

R CMD INSTALL bayes_1.0.tar.gz

4:启动R；

载入库；

library(bayes);

即可
question email to zhuzibaijiamojia@163.com
