for i in `find ./ -name "config"`
do
 echo $i
 cp $i "$i.bak"
 sed -i 's/https:\/\//http:\/\//g' "$i.bak"
done