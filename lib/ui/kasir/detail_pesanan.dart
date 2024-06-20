import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khalih/ui/kasir/selesai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Color(0xFFF5F3E5), // Main background color
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFD6CDA4), // Light Beige
          titleTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Color(0xFF141414), // Black
            fontSize: 20,
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        primaryColor: Color(0xFFD6CDA4), // Light Beige
      ),
      home: DetailPesanan(),
    );
  }
}

class DetailPesanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Color(0xFFD6CDA4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: Center(
            child: Text(
              'Detail Pesanan',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Color(0xFF141414),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp. 25.000,00',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF141414), // Black
                      ),
                    ),
                    Text(
                      'Amanda Dzunuri',
                      style: GoogleFonts.poppins(color: Color(0xFF737373)), // Light Gray
                    ),
                  ],
                ),
                Text(
                  '22 Jan 2024',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF141414), // Black
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                OrderItem(
                  name: 'Rice Bowl Chicken Sambal Matah',
                  price: 'Rp. 25.000,00',
                  quantity: 1,
                ),
                OrderItem(
                  name: 'Chicken Kalih Balinese Sambal',
                  price: 'Rp. 25.000,00',
                  quantity: 1,
                ),
                OrderItem(
                  name: 'Capuccino',
                  price: 'Rp. 28.000,00',
                  quantity: 2,
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFD6CDA4), // Light Beige (Reverted)
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: GoogleFonts.poppins(color: Color(0xFF737373)), // Light Gray
                    ),
                    Text(
                      'Rp 25.000',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF141414), // Black
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0E3822), // Dark Green
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Selesai()),
                    );
                  },
                  child: Text(
                    'Selesai',
                    style: GoogleFonts.poppins(color: Color(0xFFFFFFFF)), // White
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;

  OrderItem({
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(0xFFD6CDA4), // Light Beige (same as total payment section)
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF737373), // Light Gray (Placeholder for image)
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(Icons.image, color: Colors.white),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF141414), // Black
                    ),
                  ),
                  Text(price, style: GoogleFonts.poppins(color: Color(0xFF404040))), // Medium Gray
                ],
              ),
            ),
            Text('x$quantity', style: GoogleFonts.poppins(color: Color(0xFF404040))), // Medium Gray
          ],
        ),
      ),
    );
  }
}