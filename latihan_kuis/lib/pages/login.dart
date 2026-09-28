import 'package:flutter/material.dart';
import 'package:latihan_kuis/pages/home.dart';

import '../models/pengguna.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggedin = false;

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (users.any(
      (user) => user.username == username && user.password == password,
    )) {
      setState(() {
        isLoggedin = true;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Berhasil"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("login gagal: username atau password kalian salah"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: Text("PerpusKu"),
        backgroundColor: const Color.fromARGB(255, 0, 0, 195),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock_person_rounded,
                size: 64,
                color: const Color.fromARGB(255, 0, 0, 195),
              ),
              const SizedBox(height: 12),

              // 2. Judul Utama
              const Text(
                "Selamat Datang!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 195),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              _usernameField(_usernameController),
              const SizedBox(height: 24),
              _passwordField(_passwordController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 195),
                  foregroundColor: Colors.white,
                ),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _usernameField(TextEditingController usernameController) {
  return Container(
    child: TextField(
      controller: usernameController,
      enabled: true,
      decoration: InputDecoration(
        hintText: "username kamu",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    ),
  );
}

Widget _passwordField(TextEditingController controller) {
  return Container(
    child: TextField(
      controller: controller,
      obscureText: true,
      enabled: true,
      decoration: InputDecoration(
        hintText: "password kamu",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    ),
  );
}
