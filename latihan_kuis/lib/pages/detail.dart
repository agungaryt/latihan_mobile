import 'package:flutter/material.dart';

import '../models/bookModels.dart';

class DetailPage extends StatelessWidget {
  final BookModel bookModel;
  const DetailPage({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookModel.title),
        backgroundColor: const Color.fromARGB(255, 0, 0, 195),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  bookModel.imageUrl,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20), // Jarak antar elemen
              Text(
                bookModel.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),

              Text(
                "Penulis: ${bookModel.author} (${bookModel.year})",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 12),

              Text("Genre: ${bookModel.genre}"),
              const SizedBox(height: 4),
              Text("Penerbit: ${bookModel.publisher}"),
              const SizedBox(height: 4),
              Text("Jumlah Halaman: ${bookModel.pages} halaman"),
              const SizedBox(height: 4),
              Text("Rating: ${bookModel.rating} / 5.0"),
              const SizedBox(height: 16),

              const Text(
                "Deskripsi:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(bookModel.description, textAlign: TextAlign.justify),
              const SizedBox(height: 12),

              Text(
                "Link Buku: ${bookModel.bookUrl}",
                style: const TextStyle(color: Colors.blue),
              ),
              const SizedBox(height: 24),

              // 7. Tombol Kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 195),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Kembali ke Home"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
