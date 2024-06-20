import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khalih/firebase_options.dart';
import 'package:khalih/pilih_user.dart';
import 'package:khalih/splashscreen.dart';
import 'package:khalih/ui/kasir/antrian.dart';
import 'package:khalih/ui/kasir/detail_pesanan.dart';
import 'package:khalih/ui/kasir/login_kasir.dart';
import 'package:khalih/ui/pelanggan/daftar_menu.dart';
import 'package:khalih/ui/pelanggan/login_pelanggan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchMenuItems(String jenisMenu) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('menu')
        .where('jenis_menu', isEqualTo: jenisMenu)
        .get();

    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        //'/': (context) => MainScreen(),
          '/loginkasir': (context) => LoginKasirScreen(),
          '/loginpelanggan': (context) => LoginPelangganScreen(),
          '/pilihuser': (context) => PilihUser(),
          '/antrian': (context) => Antrian(),
          '/detail_pesanan' : (context) => DetailPesanan(),
          '/daftar_menu' : (context) => DaftarMenu(),
          //'/action': (context) => ActionScreen(),
          //'/family': (context) => FamilyScreen(),
          //'/select': (context) => ReservationApp(),
          //'/admin': (context) => LoginPage(),
          //'/homeAdmin': (context) => MovieScreen(),
          //'/add_movie': (context) => AddMoviePage(),
          //'/tiket': (context) => TicketScreen(),
      },
      home: SplashScreen(), // Gunakan SplashScreen sebagai halaman pertama
    );
  }
}