import 'package:flutter/material.dart';

import 'detail.dart';
import 'login.dart'; // 1. Sesuaikan dengan file LoginPage kamu
import '../models/bookModels.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar buku"),
        backgroundColor: const Color.fromARGB(255, 0, 0, 195),
        foregroundColor: Colors.white,

        // 2. TAMBAHKAN TOMBOL LOGOUT DI SINI
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Logout",
            onPressed: () {
              // Navigasi kembali ke LoginPage dan menghapus halaman Home dari stack
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(), // Sesuaikan dengan nama class Login kamu
                ),
              );

              // (Opsional) Tampilkan pesan logout berhasil
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil logout"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bookList[index].title),
            subtitle: Text(bookList[index].author),
            leading: Image.network(bookList[index].imageUrl),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(bookModel: bookList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
