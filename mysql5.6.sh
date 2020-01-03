#! /bin/bash
cd /usr/local/src
#yum install -y wget
#   wget -c  http://mirrors.163.com/mysql/Downloads/MySQL-5.6/mysql-5.6.43-linux-glibc2.12-x86_64.tar.gz
if [ -f mysql-5.6.46-linux-glibc2.12-x86_64.tar.gz ]
  then
	tar -zxvf mysql-5.6.46-linux-glibc2.12-x86_64.tar.gz
  else 
	echo "there is no mysql.tar file"
	exit 1
fi
cd ..
mv mysql-5.6.46-linux-glibc2.12-x86_64 ../mysql
    cd ../mysql
     useradd mysql
     mkdir -p /data/mysql
    chown mysql:mysql /data/mysql
     yum install -y perl-5.16.3-294.el7_6.x86_64
   yum install -y perl-Data-Dumper
    yum install -y libaio-devel
    ./scripts/mysql_install_db --user=mysql --datadir=/data/mysql
sleep 1
    cp support-files/mysql.server /etc/init.d/mysqld
     chkconfig --add mysqld
yum install -y git
cd /root/
git clone https://github.com/tanyyinyu/git1.git
while :
  do
	read -p "please input to choose a cnf from (small,medium,large,huge):" n
	case "$n" in
	  'small')
		break
		;;
	  'medium')
		break
		;;
	  'large')    
                break
                ;;
	  'huge')    
                break
                ;;
	  *)    
                continue
                ;;
	esac
  done
/usr/bin/cp git1/$n/my.cnf /etc/my.cnf      
service mysqld start
        if [ $? -eq 0 ]; then
        echo "mysqld start successfully"
        else
        echo "fault"
        fi