# pretest
pada project ini saya akan menceritakan flow coding aplikasi untuk menampilkan data API pada link berikut "https://jsonplaceholder.typicode.com/posts/".
Hal pertama yang saya lakukan adalah menginstall beberapa library yang diperlukan ![Screenshot from 2022-03-01 03-37-43](https://user-images.githubusercontent.com/52484204/156047389-993aece1-f8af-4917-b0b9-68798ebb8c59.png)
- flutter bloc saya gunakan untuk state management dalam project sebagai media untuk pengiriman data dalam state dan pengkondisian pada UI menggunakan state, pada project ini saya menggunakan cubit sebagai state management karena cakupan project yang sederhana.
- flutter spinkit saya gunakan untuk menampilkan spinkit pada UI ketika proses pengambilan data.
- http saya gunakan untuk pengambilan data API.

Langkah awal yang saya lakukan adalah membuat data model terlebih dahulu yang dimana class Data memiliki beberapa objek seperti id, userId, title, dan body sesuai data yang diambil pada API nantinya

![Screenshot from 2022-03-01 03-45-55](https://user-images.githubusercontent.com/52484204/156048540-7d14892c-0445-42d2-b219-8e90fb14ada4.png)

pada class Data terdapat fungsi Data.fromJson yang saya gunakan untuk mengubah data json kedalam bentuk class model.

Kemudian saya membuat class DataServices untuk service API pada project, yang berisi fungsi untuk mengambil data semua data API 

![Screenshot from 2022-03-01 03-55-27](https://user-images.githubusercontent.com/52484204/156050010-cb9007e7-6f08-4de7-a634-0cbb9fe91e06.png)

pada fungsi getData kita gunakan fungsi Uri.parse() untuk mengubah objek String pada url menjadi Uri, kemudian menggunakan objek client dengan mengirim parameter url dan header ("Content-Type": "application/json") untuk medapatkan response API jika pada suatu kasus response status code API bukan 200 maka akan mengembalikan list kosong jika tidak makan data response body pada API akan diubah datanya dari bentuk Json kedalam objek Map yang nntinya akan diubah ke dalam bentuk class model. 

kemudian saya membuat state managementnya menggunakan cubit

![Screenshot from 2022-03-01 04-10-54](https://user-images.githubusercontent.com/52484204/156051795-b4d20bcb-461c-43ce-abe6-a14e6b362398.png)

gambar diatas merupakan state yang saya gunakan pada projek kali ini

![Screenshot from 2022-03-01 04-13-16](https://user-images.githubusercontent.com/52484204/156051978-9017e063-ad28-401c-974c-2e67456bebc1.png)

gambar diatas merupakan fungsi pada cubit yang saya gunakan untuk memanggil fungsi API pada class DataServices yang dimana jika dataResponsenya kosong makan akan mengembalikan state DataLoadedError jika tidak maka akan mengembalikan state DataLoaded dengan parameter dari hasil data yang diambil pada API

![Screenshot from 2022-03-01 04-38-30](https://user-images.githubusercontent.com/52484204/156055184-ff690af8-afed-4f27-9c66-5888b0b0b4a7.png)

gambar diatas meruapakan pemanggilan fungsi fetchData pada cubit didalam initState pada halaman HomePage().

![Screenshot from 2022-03-01 04-18-57](https://user-images.githubusercontent.com/52484204/156052772-a3cb26e4-08ee-4a62-b77e-6c5325eab97e.png)

kemudian disini saya menggunakan BlocBuilder untuk menampilkan data yang telah didapatkan jika statenya adalah DataLoaded dan menggunakan Listview builder untuk menampilkan 100 data yang didapatkan

![Screenshot from 2022-03-01 04-21-49](https://user-images.githubusercontent.com/52484204/156053125-3e66b499-a475-43d1-8798-bd3a68373346.png)

jika statenya DataLoadedError maka akan menampilakn pesan text error dan jika statenya bukan DataLoaded ataupun DataLoadedError maka akan menampilkan spinkit fading circle

![Screenshot from 2022-03-01 04-24-54](https://user-images.githubusercontent.com/52484204/156053523-003a7a3e-0640-4ece-9e65-93f23d5b069e.png)

gambar diatas merupakan fungsi pada class DataServices untuk mengambil data pada API tergantung dari idPost data API, untuk penjelasan blok kodenya sama dengan fungsi getData hanya beda pada nilai balikannya yang dimana pada fungsi ini tidak mengembalikan objek List.

![Screenshot from 2022-03-01 04-29-04](https://user-images.githubusercontent.com/52484204/156054019-3ec7ea8b-06da-4085-b3d6-0652cca6b956.png)

gambar diatas merupakan fungsi pada cubit untuk mengambil data API tergantung dari inputan idPost data API, untuk pernjelasan blok kodenya sama dengan fungsi fetchingData() hanya berbeda pada state yang dikembalikan yaitu DataSearchedLoaded dan parameter pada state DataSearchedLoaded

![Screenshot from 2022-03-01 04-33-39](https://user-images.githubusercontent.com/52484204/156054536-4ce8d36a-1e06-49ad-a5b1-8fd718b89a39.png)

gambar diatas merupakan widget textformfield untuk field input data idPost yang akan dicari dan pemanggilan fungsi cubit

![Screenshot from 2022-03-01 04-36-43](https://user-images.githubusercontent.com/52484204/156054947-3c582e68-8ef8-4950-b5b6-29540bcfb803.png)

kemudian disini saya menggunakan BlocBuilder untuk menampilkan data yang telah didapatkan jika statenya adalah DataSearchLoaded.

Tampilan dari Aplikasi:

![WhatsApp Image 2022-03-01 at 3 31 39 AM](https://user-images.githubusercontent.com/52484204/156055565-899b0c92-449b-4e0a-a2dd-13f0939178db.jpeg)

Tampilan Home Page menampilkan semua data yang diambil dari API.

![WhatsApp Image 2022-03-01 at 3 30 36 AM](https://user-images.githubusercontent.com/52484204/156055653-e9067cea-9d4d-485c-9ef3-4066cb347305.jpeg)

![WhatsApp Image 2022-03-01 at 3 31 18 AM](https://user-images.githubusercontent.com/52484204/156055683-1fc7c4e3-1d75-4cbc-9219-bec2389eee81.jpeg)

Tampilan Searched Page menampikan data berdasarkan inputan dari id Post pada API 
