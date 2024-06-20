import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginKasirScreen extends StatefulWidget {
  const LoginKasirScreen({Key? key}) : super(key: key);

  @override
  State<LoginKasirScreen> createState() => _LoginKasirScreenState();
}

class _LoginKasirScreenState extends State<LoginKasirScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;

  // Method to authenticate user
  Future<void> authenticateUser() async {
    try {
      // Fetch the user data from Firestore based on the email
      final querySnapshot = await FirebaseFirestore.instance
          .collection('admin')
          .where('email', isEqualTo: emailEdc.text)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userDoc = querySnapshot.docs.first;
        final userData = userDoc.data();

        // Check if the entered password matches the stored password
        if (userData['password'] == passEdc.text) {
          // Check if the user role is 'admin'
          if (userData['role'] == 'admin') {
            // Navigate to Antrian page
            Navigator.pushNamed(context, '/antrian');
          } else {
            // Show error if the user role is not 'admin'
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Access denied. Admin only.')),
            );
          }
        } else {
          // Show error if the password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid password.')),
          );
        }
      } else {
        // Show error if no user found with the entered email
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found with this email.')),
        );
      }
    } on FirebaseException catch (e) {
      // Handle Firebase-specific exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: ${e.message}')),
      );
    } catch (e) {
      // Handle other exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unknown error occurred: $e')),
      );
    }
  }

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
              "Username",
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
              "Password",
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
                obscureText: !passInvisible,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                authenticateUser();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(14, 56, 34, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
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
