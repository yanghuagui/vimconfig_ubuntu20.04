# vimconfig_ubuntu20.04
reference to:https://blog.csdn.net/OIDCAT/article/details/106816941
还需要根据命令“echo | gcc -v -E -x c -”获取到编译路径并添加到 .ycm_extra_conf.py 文件

压缩包是分卷压缩的：
压缩：tar -czvf - vimconfig/ |split -b 98m - vimconfig.tar.gz
解压：cat vimconfig.tar.gza* | tar -xzv
