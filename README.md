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