####################################################################
# 启动数据中心后台服务程序的脚本。
####################################################################

# 检查服务程序是否超时
/datacenter/tools/bin/procctl 30 /datacenter/tools/bin/checkproc

# 压缩数据中心后台服务程序的备份日志。
/datacenter/tools/bin/procctl 300 /datacenter/tools/bin/gzipfiles /log/idc "*.log.20*" 0.02

# 生成用于测试的全国气象站点观测的分钟数据。
/datacenter/tools/bin/procctl  60 /datacenter/idc/bin/crtsurfdata /datacenter/idc/ini/stcode.ini /tmp/idc/surfdata /log/idc/crtsurfdata.log xml,json,csv

# 清理原始的全国气象站点观测的分钟数据目录/tmp/idc/surfdata中的历史数据文件。
/datacenter/tools/bin/procctl 300 /datacenter/tools/bin/deletefiles /tmp/idc/surfdata "*" 0.02
