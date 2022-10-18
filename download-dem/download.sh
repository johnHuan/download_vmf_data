# 下载DEM
for i in `cat ../list.txt`;do s=$i;p=${i:50}; dir=${p:0:13};`wget -P $dir $i`; echo $i; done;