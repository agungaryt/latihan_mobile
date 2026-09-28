class User {
  String username;
  String password;
  String nama;

  User({required this.username, required this.password, required this.nama});
}

List<User> users = [
   User(username: "Rahmat@gmail.com", password: "rahmatsarjana", nama: "Rahmat agung"),
   User(username: "admin@gmail.com", password: "admin123", nama: "admin testing"),
];


