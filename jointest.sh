#! /bin/sh
for i in `seq 1 1`;
  do
	echo -e "small\n30\n100000\n100\n60\n1G" | bash -x sysbench.sh
	bash -x cleantest.sh
  done

