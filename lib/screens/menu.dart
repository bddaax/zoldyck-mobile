import 'package:flutter/material.dart';
import 'package:zoldyck_mobile/screens/login.dart';
import 'package:zoldyck_mobile/widgets/drawer.dart';
import 'package:zoldyck_mobile/screens/list_productentry.dart';
import 'package:zoldyck_mobile/screens/product_form.dart';  // Pastikan ini sesuai dengan lokasi file form produk Anda
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemHomepage {
  final String title;
  final IconData icon;
  final Color color;
  final Function(BuildContext context)? onTap;

  ItemHomepage(this.title, this.icon, this.color, {this.onTap});
}

class MyHomePage extends StatelessWidget {
  late final List<ItemHomepage> items;

  MyHomePage({super.key}) {
    items = [
      ItemHomepage(
        "Lihat Daftar Produk",
        Icons.shopping_bag_outlined,
        Colors.black,
        onTap: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductEntryPage()),
          );
        },
      ),
      ItemHomepage(
        "Tambah Produk",
        Icons.add_circle_outline,
        Colors.grey[900]!,
        onTap: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductFormPage()),  // Sesuaikan dengan nama halaman form Anda
          );
        },
      ),
      ItemHomepage(
        "Logout",
        Icons.logout_outlined,
        Colors.red[900]!,
        onTap: (context) async {
          final request = context.read<CookieRequest>();
          final response = await request.logout(
              "http://127.0.0.1:8000/auth/logout/");  // Ganti dengan URL logout Django Anda
          
          if (response['status']) {
            String message = response['message'];
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),  // Pastikan untuk import halaman login
            );
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(message)),
              );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Logout Gagal'),
                content: Text(response['message']),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Zoldyck',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const LeftDrawer(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32.0),
                Text(
                  'Welcome to Zoldyck',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: items.map((ItemHomepage item) {
                      return Card(
                        color: item.color,
                        child: InkWell(
                          onTap: () => item.onTap?.call(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item.icon,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                '© 2024 Brenda Po Lok Fahida - 2306152304 - PBP D',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}