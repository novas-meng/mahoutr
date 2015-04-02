#!/bin/bash
mahoutr="";
for j in `cat /etc/profile`
do
	mahoutr=` echo $j| grep  "MAHOUTR_HOME" `;
done
file=${mahoutr##*=}"/conf/bayes.csv";
IFS=$'\n';
array=();
count=0;
for i in `cat $file`
do
	if [  ${#i} -gt 6 ]
		then
	len=` expr ${#i} - 6 `;
	echo ${i:5:len};
               array[$count]=${i:5:len};
               count=`expr $count + 1` ;
fi
done
 num=${array[1]};
 path=${array[0]};
 hadoop dfsadmin -safemode leave;
 hadoop fs -mkdir /user;
 hadoop fs -rmr /user/20news;
 hadoop fs -copyFromLocal  $path /user/20news ;
mahout seqdirectory -i /user/20news -o /user/20news_seq ;
mahout seq2sparse -i /user/20news_seq/ -o /user/20news_vectors -lnorm -nv -wt tfidf;
mahout split -i /user/20news_vectors/tfidf-vectors -tr /user/train-vectors -te /user/test-vectors -rp $num -ow -seq -xm sequential;
mahout trainnb -i /user/train-vectors -el -o /user/nbmodel -li /user/labindex -ow -c;
mahout testnb -i /user/test-vectors -m /user/nbmodel -l /user/labindex -ow -o /user/20news-test-result -c  >&  ${mahoutr##*=}/res/bayesout.txt;
