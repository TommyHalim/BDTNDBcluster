# BDTNDBcluster

<p>
Installation<br>
1. Provision
    <t>vagrant up, untuk konfigurasi provision sendiri dapat dilihat di folder provision<br>untuk db1 sebagai cluster manager maka menginstall ndb manager<br>untuk db2 dan 3 sbagai node maka menginstall mysql data node <br>untuk db4 sebagai load balancer maka tidak perlu diinstal ndb<Br>
    	<br>
2. Mengetes mysql cluster
<t> dengan cara mengubah salah satu data di db2 lalu mengecek di db3, jika berhasil maka akan terubah pula<br>
bukti dapat terlihat di folder screenshot<br>
<br> 
3. Mengetes Load Balancer
<t> melihat status pada db4 dan mencoba melakukan perubahan ke salah satu data di db 2 atau 3<br>
<br>
4. Menggunakan program external dalam clustering
<t>Menggunakan SQLYog
