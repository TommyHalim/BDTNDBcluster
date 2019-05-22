# BDTNDBcluster


# Installasi
## 1. Provision
    
 | No | IP Address | Hostname | Deskripsi |
| --- | --- | --- | --- |
| 1 | 192.168.33.11 | clusterdb1 | Sebagai NDB Manager |
| 2 | 192.168.33.12 | clusterdb2 | Sebagai Node 1 |
| 3 | 192.168.33.13 | clusterdb3 | Sebagai Node 2 |
| 4 | 192.168.33.14 | clusterdb4 | Sebagai Load Balancer (ProxySQL) |
    
vagrant up, untuk konfigurasi provision sendiri dapat dilihat di folder provision 
untuk db1 sebagai cluster manager maka menginstall ndb manager 
untuk db2 dan 3 sbagai node maka menginstall mysql data node 
untuk db4 sebagai load balancer maka tidak perlu diinstal ndb
 
## 2. Melakukan Instalasi MySQL Server pada clusterdb2 dan 3
```
sudo dpkg -i '/home/vagrant/install/mysql-cluster-community-server_7.6.9-1ubuntu18.04_amd64.deb'
sudo cp '/vagrant/files/clusterdb2/mysql/my.cnf' '/etc/mysql/my.cnf'
sudo systemctl restart mysql
sudo systemctl enable mysql
```

## 3. Mengekspor file proxysql config pada clusterdb4
```
sudo mysql -u admin -p -h 127.0.0.1 -P 6032 --prompt='ProxySQLAdmin> ' < /vagrant/mysql-dump/proxy_config.sql
```

## 4. Mengekspor file addition to sys pada clusterdb2 dan 3 
```
# Download Files Addition SYS
#curl -OL https://gist.github.com/lefred/77ddbde301c72535381ae7af9f968322/raw/5e40b03333a3c148b78aa348fd2cd5b5dbb36e4d/addition_to_sys.sql

# Export Files Addition
#sudo mysql -u root -p < addition_to_sys.sql

# Export Files Proxy Connect Configuration
#sudo mysql -u root -p < /vagrant/mysql-dump/proxy_config_connection.sql
```

## 5. Import Database sebagai percobaan
```
# Melakukan Import db
sudo mysql -u root -p < /vagrant/mysql-dump/mysqlsampledatabase.sql
```
## Mengetes mysql cluster
dengan cara mengubah salah satu data di db2 lalu mengecek di db3, jika berhasil maka akan terubah pula
bukti dapat terlihat di folder screenshot
![](https://github.com/TommyHalim/BDTNDBcluster/blob/master/Screenshot/perubahan.JPG)

Mengetes Load Balancer
Melihat status pada db4 dan mencoba melakukan perubahan ke salah satu data di db 2 atau 3<br>
![](https://github.com/TommyHalim/BDTNDBcluster/blob/master/Screenshot/loadbalancer.JPG)
