import 'package:flutter/material.dart';

class LoginPelangganScreen extends StatefulWidget {
  const LoginPelangganScreen({Key? key}) : super(key: key);
  @override
  State<LoginPelangganScreen> createState() => _LoginPelangganScreenState();
}

class _LoginPelangganScreenState extends State<LoginPelangganScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 243, 229, 1.0),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo_kalih.png',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 50), // Adjust the height as needed
            Image.asset('assets/images/kalih_text.png'),
            SizedBox(height: 50),
            Text(
              "Nama",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Container(
              width: 324,
              height: 38,
              child: TextFormField(
                controller: emailEdc,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(214, 205, 164, 1),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Nomor Meja",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Container(
              width: 324,
              height: 38,
              child: TextFormField(
                controller: passEdc,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(214, 205, 164, 1),
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/daftar_menu');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(14, 56, 34, 1.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                "Lanjutkan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
