#!/bin/bash
# author:johnhuan
# email: yz30.com@aliyun.com
iter_fun() {
  local base_url=$1  # https://vmf.geo.tuwien.ac.at/trop_products/GRID/
  local temp_url=$2  # 1x1/   /
  last_letter=${temp_url: -1}
  if [[ $last_letter == "/" ]]; then    # GRAD_EI/    GRAD_19800101.H00
    for j in `curl $base_url$temp_url`   # https://vmf.geo.tuwien.ac.at/trop_products/GRID//
    do
      if [[ $j == *"href=\""* ]]; then
        suf=${j: 6}
        first_letter=${suf:0:1}
        if [ "$first_letter" = ? -o "$first_letter" = / ]; then
          continue
        else
          iter_fun $base_url$temp_url ${suf%%\">*}
        fi
      fi
    done
  else
	echo $base_url$temp_url
	fi
}

# main 入口
source_arr=(
#"https://vmf.geo.tuwien.ac.at/trop_products/GRID/"
"http://sendimage.whu.edu.cn/res/DEM_share/GSDEM30"
#"https://vmf.geo.tuwien.ac.at/trop_products/DORIS"
#"https://vmf.geo.tuwien.ac.at/trop_products/GNSS"
#"https://vmf.geo.tuwien.ac.at/trop_products/SLR"
#"https://vmf.geo.tuwien.ac.at/trop_products/VLBI"
)
len=${#source_arr[@]}
for((i=0;i<$len;i++))
do
  temp_url=${source_arr[$i]}
	echo $temp_url
	iter_fun $temp_url "/"
done
