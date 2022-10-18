for i in `cat a.txt`;do s=$i; p=.${i:42}; path=${p%/*};	echo $path; wget -P $path $s; done;

#for i in `cat a.txt`
#do 
#	s=$i
#	p=.${i:42}
#	#./DORIS/GRAD/GRAD_EI/daily/1980/1980008.grad_d
#	path=${p%/*}
#	echo $path
#	echo $s
#	#wget -P $path $s
#done;
#  https://vmf.geo.tuwien.ac.at/trop_products   42  ./DORIS/GRAD/GRAD_EI/daily/1980/1980008.grad_d
