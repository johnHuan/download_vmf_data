#  说明

1. 运行`./collect-file-list/collect.sh`

   ```shell
   # 28~32行为需要下载的数据
   # 只放开28行的注释
   sh ./collect.sh >GRID.txt
   # 要全部收集到一个文件中就都放开28~32行的注释
   sh ./collect.sh >all.txt
   
   ```

2. 运行`./download-data/download.sh`

   ```shell
   # 使用 mobaxterm 直接执行
   sh ./download.sh
   ```


拆分文件

```shell
$ split ../list-split.txt -l 1460
```

开启多线程下载：

```shell
for i in `ls ./split`
do
  for j in `cat $i`
  do { 
    s=$j;
    p="${j:65}";
    dir="${p%/*}";
    `wget -P $dir $i`; 
    echo $j;
  } &
  done;
done;
```

```shell
for i in `ls ./split`;do for j in `cat ./split/$i`;do { s=$j;p="${j:65}";dir="${p%/*}"; `wget -P ./$dir $j`; echo $j; }& done;  wait; done;
```


