# cat 查看
# ${变量:50}  表示截取变量的50位以后的字符   
# ${var:start:number}
# ${var: num2end}
# ${p%/*} 截取p字符串中 最后一个`/` 前的所有字符
# mkdir -p $dir  创建文件夹   -p表示创建多级目录
# wget -P dir url #### -P 表示下载定到指定的目录下
# wget url  下载到当前目录下
for i in `cat list.txt`;do s=$i; p=${i:50};dir=${p%/*}; echo $dir;mkdir -p $dir;done;