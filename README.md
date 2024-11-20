[E-Commerce app for PBP 2024 / 2025](../)


# Zoldyck Mobile App


Zoldyck is an advanced application that connects you with premium detective services, offering a range of investigative solutions tailored to your unique needs. Leveraging the extraordinary skills and extensive experience of each member of the Zoldyck family, this app enables you to tackle complex issues with high efficiency and accuracy.

Each Zoldyck family member possesses specialized expertise, making them a master in their respective fields. This provides you with access to a variety of detective services, from in-depth investigations to covert surveillance, and from rapid case resolutions to strategic sabotage. Zoldyck delivers solutions crafted to solve mysteries and uncover truths in the most effective way.

Zoldyck is the ideal choice for those seeking not only reliable but also innovative detective services, bringing a cutting-edge and trustworthy approach to the world of investigations.



## Pertanyaan

<details>
  <summary><strong>Tugas 7</strong></summary>

## Tugas 7: Elemen Dasar Flutter

### Perbedaan Stateless Widget dan Stateful Widget

1. **Stateless Widget**
   - Widget yang statis/tidak berubah (immutable)
   - Tidak memiliki state internal yang dapat berubah selama masa hidupnya
   - Dibuat ulang setiap kali perlu diperbarui
   - Cocok untuk UI yang tidak perlu berubah secara dinamis
   - Contoh: Icon, IconButton, Text

2. **Stateful Widget**
   - Widget yang dinamis/dapat berubah (mutable)
   - Memiliki state internal yang dapat diperbarui selama masa hidupnya
   - Dapat memperbarui tampilan berdasarkan interaksi pengguna atau data yang berubah
   - Cocok untuk UI yang memerlukan pembaruan dinamis
   - Contoh: Checkbox, Radio, Slider, TextField

### Widget yang Digunakan

1. `MaterialApp`: Widget root yang membungkus seluruh aplikasi dan menyediakan konfigurasi tema material design.

2. `Scaffold`: Menyediakan struktur dasar layout material design seperti AppBar, Body, dan sebagainya.

3. `AppBar`: Menampilkan bar aplikasi di bagian atas layar dengan judul "Zoldyck".

4. `Stack`: Mengatur widget secara bertumpuk, digunakan untuk menempatkan copyright di atas konten utama.

5. `Column`: Mengatur widget secara vertikal.

6. `GridView`: Menampilkan children dalam grid layout.

7. `Card`: Menampilkan konten dalam bentuk kartu dengan sudut membulat.

8. `Material`: Memberikan efek visual material design pada widget.

9. `InkWell`: Memberikan efek ripple ketika widget ditekan.

10. `Icon`: Menampilkan ikon.

11. `Text`: Menampilkan teks.

12. `Container`: Membungkus widget lain dan memberikan padding, margin, dan dekorasi.

13. `SizedBox`: Memberikan spasi kosong dengan ukuran tertentu.

14. `SnackBar`: Menampilkan pesan singkat di bagian bawah layar.

### Fungsi setState()

`setState()` adalah metode yang digunakan dalam StatefulWidget untuk memberitahu framework bahwa state internal widget telah berubah dan perlu dilakukan rebuild.

Dalam proyek ini tidak menggunakan `setState()` karena seluruh widget yang digunakan adalah StatelessWidget. Namun, jika misalnya kita ingin menambahkan fitur counter pada tombol, kita bisa menggunakan setState seperti ini:

```dart
int _counter = 0;

void _incrementCounter() {
  setState(() {
    _counter++;  // Variabel yang terdampak
  });
}
```

Variabel yang dapat terdampak oleh `setState()` adalah semua variabel yang dapat mempengaruhi tampilan UI dan dideklarasikan sebagai state dalam StatefulWidget.

### Perbedaan const dengan final

1. **const**
   - Nilai harus sudah diketahui pada saat compile time
   - Membuat objek menjadi deeply immutable
   - Menggunakan memory yang sama untuk nilai yang identik
   - Contoh:
     ```dart
     const pi = 3.14;
     const list = [1, 2, 3];  // List tidak bisa dimodifikasi
     ```

2. **final**
   - Nilai bisa diketahui pada saat runtime
   - Hanya membuat referensi variabel immutable
   - Setiap deklarasi membuat objek baru
   - Contoh:
     ```dart
     final time = DateTime.now();  // Nilai ditentukan saat runtime
     final list = [1, 2, 3];  // List bisa dimodifikasi
     ```

### Implementasi Checklist

1. **Membuat Program Flutter Baru**
   - Buka Terminal atau Command Prompt
   - Buat direktori baru untuk proyek Flutter
   ```bash
   mkdir flutter_projects
   cd flutter_projects
   ```
   - Generate proyek Flutter baru
   ```bash
   flutter create zoldyck_mobile
   cd zoldyck_mobile
   ```
   - Jalankan proyek untuk memastikan setup berhasil
   ```bash
   flutter run
   ```

2. **Merapikan Struktur Proyek**
   - Buat file baru `menu.dart` dalam folder `lib`
   - Pindahkan kode widget `MyHomePage` dari `main.dart` ke `menu.dart`
   - Tambahkan import di `main.dart`:
   ```dart
   import 'package:flutter/material.dart';
   import 'package:zoldyck_mobile/menu.dart';
   ```

3. **Membuat Widget untuk Item Menu**
   - Buat class `ItemHomepage` untuk template item:
   ```dart
   class ItemHomepage {
     final String name;
     final IconData icon;
     final Color color;

     ItemHomepage(this.name, this.icon, this.color);
   }
   ```
   - Buat list item yang dibutuhkan:
   ```dart
   final List<ItemHomepage> items = [
     ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag_outlined, Colors.black),
     ItemHomepage("Tambah Produk", Icons.add_circle_outline, Colors.grey[900]!),
     ItemHomepage("Logout", Icons.logout_outlined, Colors.red[900]!),
   ];
   ```

4. **Membuat Widget Card untuk Item**
   - Implementasi `ItemCard` widget untuk menampilkan setiap item:
   ```dart
   class ItemCard extends StatelessWidget {
     final ItemHomepage item;

     const ItemCard(this.item, {super.key});

     @override
     Widget build(BuildContext context) {
       return Card(
         // ... (kode implementasi card)
       );
     }
   }
   ```

5. **Implementasi GridView**
   - Gunakan `GridView.count` untuk menampilkan item dalam grid:
   ```dart
   GridView.count(
     crossAxisCount: 3,
     crossAxisSpacing: 16,
     mainAxisSpacing: 16,
     children: items.map((item) => ItemCard(item)).toList(),
   )
   ```

6. **Menambahkan Fungsi onTap dan SnackBar**
   - Implementasi `InkWell` dengan handler `onTap`:
   ```dart
   InkWell(
     onTap: () {
       ScaffoldMessenger.of(context)
         ..hideCurrentSnackBar()
         ..showSnackBar(
           SnackBar(
             content: Text("Kamu telah menekan tombol ${item.name}!"),
             // ... (konfigurasi snackbar)
           ),
         );
     },
     // ... (child widget)
   )
   ```

7. **Menyesuaikan Tema Aplikasi**
   - Update `ThemeData` di `main.dart` untuk menggunakan tema hitam-putih:
   ```dart
   theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(
       seedColor: Colors.black,
       primary: Colors.black,
       secondary: Colors.white,
       surface: Colors.white,
     ),
     // ... (konfigurasi tema lainnya)
   )
   ```

8. **Menambahkan Copyright Footer**
   - Gunakan `Stack` widget untuk menempatkan copyright di bagian bawah:
   ```dart
   Stack(
     children: [
       // ... (konten utama)
       Positioned(
         bottom: 0,
         left: 0,
         right: 0,
         child: Container(
           // ... (widget copyright)
         ),
       ),
     ],
   )
   ```

9. **Testing**
   - Jalankan aplikasi untuk memastikan semua fitur berfungsi:
   ```bash
   flutter run
   ```
   - Test semua tombol dan verifikasi SnackBar muncul dengan pesan yang sesuai
   - Pastikan tampilan responsif di berbagai ukuran layar


</details>



<details>
  <summary><strong>Tugas 8</strong></summary>

## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

### Penggunaan `const` di Flutter
`const` di Flutter adalah keyword yang digunakan untuk membuat variabel atau objek yang nilainya konstan atau tidak dapat diubah. Penggunaan `const` dapat memberikan beberapa keuntungan:

1. **Efisiensi Memori**: Variabel atau objek yang dideklarasikan dengan `const` akan disimpan di memori hanya sekali, sehingga dapat meningkatkan efisiensi penggunaan memori.
2. **Performa yang Lebih Baik**: Kompiler dapat melakukan optimasi yang lebih baik pada kode yang menggunakan `const`, sehingga dapat meningkatkan performa aplikasi.
3. **Keamanan**: Variabel atau objek yang dideklarasikan dengan `const` tidak dapat diubah, sehingga dapat membantu mencegah kesalahan yang disebabkan oleh perubahan nilai yang tidak disengaja.

Sebaiknya menggunakan `const` jika nilai variabel atau objek tidak akan berubah selama aplikasi berjalan. Contohnya, pada deklarasi konstanta, definisi widget, atau nilai yang dihitung secara statis. Namun, jika nilai variabel atau objek dapat berubah selama aplikasi berjalan, sebaiknya tidak menggunakan `const`.

### Penggunaan `Column` dan `Row` pada Flutter
`Column` dan `Row` adalah dua layout widget dasar di Flutter yang digunakan untuk mengatur tata letak elemen-elemen child di dalam widget induk.

**`Column`**:
- Menyusun elemen child secara vertikal dari atas ke bawah.
- Cocok untuk membuat tata letak vertikal, seperti membuat menu, daftar, atau form.
- Contoh implementasi:
```dart
Column(
  children: [
    Text('Elemen 1'),
    Text('Elemen 2'),
    Text('Elemen 3'),
  ],
)
```

**`Row`**:
- Menyusun elemen child secara horizontal dari kiri ke kanan.
- Cocok untuk membuat tata letak horizontal, seperti membuat toolbar, navigasi, atau kontrol yang berdampingan.
- Contoh implementasi:
```dart
Row(
  children: [
    Icon(Icons.add),
    Text('Tambah'),
    Icon(Icons.delete),
  ],
)
```

Perbedaan utama antara `Column` dan `Row` adalah arah penyusunan elemen child. `Column` berorientasi vertikal, sedangkan `Row` berorientasi horizontal. Penggunaan keduanya tergantung pada kebutuhan desain aplikasi yang ingin dicapai.

### Elemen Input pada Halaman Form
Pada halaman `ProductFormPage`, saya menggunakan tiga elemen input:
1. `TextFormField` untuk input nama produk
2. `TextFormField` untuk input jumlah
3. `TextFormField` untuk input deskripsi

Selain ketiga elemen input tersebut, Flutter juga menyediakan elemen input lainnya, seperti:
- `Checkbox`: untuk input checkbox
- `Radio`: untuk input radio button
- `Slider`: untuk input slider
- `Switch`: untuk input switch
- `DropdownButton`: untuk input dropdown
- `DateTimeField`: untuk input tanggal dan waktu

Pemilihan elemen input yang digunakan bergantung pada jenis data yang ingin dimasukkan oleh pengguna dan kebutuhan desain aplikasi.

### Pengaturan Tema Aplikasi
Untuk mengatur tema (theme) aplikasi Flutter, saya menggunakan `ThemeData` di dalam `MaterialApp`. Saya menentukan warna primer, sekunder, dan warna latar belakang (background) yang konsisten di seluruh aplikasi.

Pada contoh aplikasi `Zoldyck`, saya mengimplementasikan tema dengan kode berikut:
```dart
return MaterialApp(
  title: 'Zoldyck',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      primary: Colors.black,
      secondary: Colors.white,
      surface: Colors.white,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.0,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
    ),
  ),
  home: MyHomePage(),
);
```

### Navigasi pada Aplikasi dengan Banyak Halaman
Untuk menangani navigasi pada aplikasi dengan banyak halaman, saya menggunakan `Navigator` di Flutter. Saya menggunakan `MaterialPageRoute` untuk berpindah dari satu halaman ke halaman lain.

Contoh penggunaan `Navigator` untuk berpindah dari halaman utama ke halaman form:
```dart
// Di dalam ItemCard pada screens/menu.dart
onTap: () {
  // ...
  if (item.name == "Tambah Produk") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductFormPage(),
      ),
    );
  }
  // ...
}
```

Selain itu, saya juga menggunakan `Drawer` untuk menyediakan navigasi ke halaman utama dan halaman form. Dengan menggunakan `Drawer`, pengguna dapat dengan mudah berpindah antara halaman-halaman aplikasi.

</details>


<details>
  <summary><strong>Tugas 9</strong></summary>

## Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

### Mengapa Kita Perlu Membuat Model untuk Pengambilan atau Pengiriman Data JSON?  
**Mengapa perlu membuat model?**  
Model diperlukan untuk menyusun representasi data secara terstruktur sehingga mempermudah manipulasi data dalam aplikasi. Dalam konteks pengambilan atau pengiriman data JSON, model membantu memetakan atribut-atribut JSON ke dalam objek Python atau Flutter, membuatnya lebih mudah untuk diproses. Model juga memastikan integritas data, memvalidasi tipe data, dan menyediakan kerangka untuk operasi seperti serialisasi atau deserialisasi.  

**Apakah akan terjadi error jika tidak membuat model?**  
Tidak selalu terjadi error secara langsung. Namun, tanpa model, pengelolaan data menjadi kurang terorganisir, meningkatkan risiko kesalahan dalam pengambilan atau pengiriman data. Misalnya, jika ada perubahan struktur JSON, aplikasi dapat gagal membaca atau memproses data karena tidak ada peta yang mengatur format data.

### Fungsi Library `http`  
Library `http` pada Flutter digunakan untuk mengirim permintaan HTTP (GET, POST, PUT, DELETE, dsb.) dan menerima respons dari server. Dalam konteks tugas ini, `http` digunakan untuk:  
1. Mengambil data dari server Django dalam format JSON.  
2. Mengirim data dari Flutter ke Django (misalnya, data formulir untuk login atau registrasi).  
3. Mengatur header untuk keperluan autentikasi seperti token atau cookie.  

### Fungsi dan Pentingnya `CookieRequest`  
**Fungsi `CookieRequest`:**  
`CookieRequest` adalah implementasi yang mempermudah pengelolaan cookie dalam aplikasi Flutter. Cookie digunakan untuk melacak status sesi pengguna, seperti informasi login. Fungsi utamanya adalah:  
1. Menyimpan cookie saat pengguna login.  
2. Menggunakan cookie tersebut untuk setiap permintaan berikutnya sehingga pengguna tetap terautentikasi.  
3. Memastikan keamanan dengan hanya mengirimkan cookie ke domain tertentu.  

**Mengapa instance `CookieRequest` perlu dibagikan ke semua komponen?**  
Instance `CookieRequest` harus bersifat global (shared) agar semua komponen aplikasi dapat mengakses status sesi yang sama. Dengan cara ini:  
1. Semua komponen bisa memanfaatkan autentikasi tanpa harus mengelola cookie sendiri.  
2. Menghindari inkonsistensi data sesi antar-komponen.

### Mekanisme Pengiriman Data dari Input hingga Tampil di Flutter  
1. **Input di Flutter:** Pengguna memasukkan data ke form Flutter.  
2. **Pengiriman ke Backend:** Flutter mengirim data melalui permintaan HTTP menggunakan library `http` atau `CookieRequest`.  
3. **Pemrosesan di Django:** Django menerima data, memprosesnya (misalnya, menyimpan ke database atau memvalidasi data), dan mengembalikan respons dalam format JSON.  
4. **Respons ke Flutter:** Flutter menerima JSON dari Django, memparse data menggunakan model Dart, lalu menampilkan data ke UI aplikasi.


### Mekanisme Autentikasi (Login, Register, Logout)  
1. **Login:**  
   - Pengguna memasukkan email dan password di Flutter.  
   - Flutter mengirim permintaan POST ke endpoint Django dengan data tersebut.  
   - Django memvalidasi kredensial dengan mencocokkannya ke database. Jika valid, Django mengembalikan cookie sesi ke Flutter.  
   - Flutter menyimpan cookie tersebut menggunakan `CookieRequest` untuk digunakan dalam permintaan berikutnya.  

2. **Register:**  
   - Pengguna mengisi data akun baru di Flutter.  
   - Data dikirim ke Django melalui permintaan POST.  
   - Django membuat akun baru di database dan memberikan respons sukses ke Flutter.  

3. **Logout:**  
   - Flutter mengirim permintaan ke endpoint logout Django.  
   - Django menghapus cookie sesi di server.  
   - Flutter juga menghapus cookie lokal sehingga pengguna keluar dari aplikasi.

Dengan mekanisme ini, autentikasi di Flutter tetap aman dan konsisten dengan proses di Django.  

### Langkah-langkah

Untuk mengimplementasikan fitur checklist yang disebutkan, berikut adalah langkah-langkahnya secara sistematis, tanpa hanya sekadar mengikuti tutorial:

---

### **1. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter**
**Langkah:**
1. **Modifikasi Backend Django**  
   - Tambahkan fungsi `register` pada `views.py` untuk menerima data pendaftaran dari Flutter.
   - Buat endpoint pada `urls.py` di Django, misalnya `auth/register/`.

2. **Setup Model dan Validasi di Django**  
   - Pastikan model `User` sudah tersedia, atau buat model custom jika diperlukan.

3. **Integrasi di Flutter**  
   - Buat file baru `register.dart` di folder `screens`.
   - Tambahkan form pendaftaran dengan validasi username, password, dan konfirmasi password.
   - Gunakan `pbp_django_auth` untuk melakukan POST request ke endpoint Django untuk pendaftaran.

4. **Test Akhir**  
   - Jalankan aplikasi dan pastikan registrasi berhasil membuat user baru.

---

### **2. Membuat halaman login pada proyek tugas Flutter**
**Langkah:**
1. **Backend Django: Fungsi Login**  
   - Pastikan fungsi login di Django sudah dibuat, dengan endpoint seperti `/auth/login/`.

2. **Frontend Flutter: UI Login**  
   - Buat file `login.dart` dengan UI berisi form username dan password.
   - Gunakan library `pbp_django_auth` untuk mengatur session cookies.

3. **Navigasi Post-login**  
   - Setelah login berhasil, arahkan pengguna ke halaman utama aplikasi.

---

### **3. Mengintegrasikan sistem autentikasi Django dengan proyek Flutter**
**Langkah:**
1. **Setup Django CORS dan Middleware**  
   - Instal dan konfigurasi `django-cors-headers`.
   - Tambahkan setting seperti `CORS_ALLOW_ALL_ORIGINS` dan pengaturan cookies.

2. **Gunakan `pbp_django_auth` di Flutter**  
   - Setup `CookieRequest` pada `main.dart` dengan `Provider`.
   - Gunakan `request.login()` untuk autentikasi.

3. **Pengujian**  
   - Cek apakah cookie session tersimpan setelah login, lalu pastikan validitasnya di Django.

---

### **4. Membuat model kustom sesuai dengan proyek aplikasi Django**
**Langkah:**
1. **Tentukan Struktur Data**  
   - Tentukan atribut model yang relevan, misalnya `name`, `price`, dan `description`.

2. **Definisikan Model Django**  
   - Tambahkan model di `models.py` dengan atribut yang diperlukan.
   - Migrasikan perubahan dengan `python manage.py makemigrations` dan `migrate`.

3. **Integrasi JSON Endpoint**  
   - Buat view untuk menampilkan data dalam format JSON.

4. **Generate Model di Flutter**  
   - Gunakan `Quicktype` untuk membuat model Dart dari data JSON.

---

### **5. Membuat halaman daftar item**
**Langkah:**
1. **Fetch Data dari Django**  
   - Gunakan library HTTP di Flutter untuk mengambil data dari endpoint Django.

2. **Buat UI Daftar**  
   - Buat file `list_item.dart` dengan tampilan list menggunakan `ListView.builder`.

3. **Tampilkan Data**  
   - Panggil API endpoint dan tampilkan atribut `name`, `price`, dan `description`.

---

### **6. Membuat halaman detail item**
**Langkah:**
1. **Navigasi ke Halaman Detail**  
   - Buat navigasi dari item di halaman daftar ke halaman detail dengan `Navigator.push`.

2. **Tampilkan Detail Item**  
   - Buat file `item_detail.dart` dan tampilkan semua atribut model.

3. **Tombol Kembali**  
   - Tambahkan tombol `Back` menggunakan widget `ElevatedButton`.

---

### **7. Filter item berdasarkan pengguna yang login**
**Langkah:**
1. **Backend Django**  
   - Tambahkan filter di view Django untuk memisahkan data berdasarkan pengguna login.

2. **Flutter Filtering**  
   - Tambahkan parameter filter di request API.

3. **Uji Filter**  
   - Login dengan pengguna berbeda dan pastikan hanya data yang relevan yang ditampilkan.


</details>