import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KonfirmasiPembayaran(),
    );
  }
}

class KonfirmasiPembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3E5),
      appBar: AppBar(
        title: Text('Konfirmasi Pembayaran'),
        backgroundColor: Color(0xFFF5F3E5),
        iconTheme: IconThemeData(color: Color(0xFF141414)), // Ensures the back icon is visible
        titleTextStyle: TextStyle(
          color: Color(0xFF141414), // Ensures the title text is visible
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back button functionality here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/logo_kalih.png'), // Ganti dengan path ke logo Anda
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Kalih Coffee Tea and Spaces',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        color: Color(0xFF141414),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Jl. Pungkuran No.4, Sokanegara, Kec. Purwokerto Tim',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                        fontFamily: 'Inter',
                        color: Color(0xFF737373),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Telp : 0812-2726-8611',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                        fontFamily: 'Inter',
                        color: Color(0xFF737373),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              DashedDivider(color: Color(0xFF141414)),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nomor meja : 27',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF141414),
                    ),
                  ),
                  Text(
                    '16:49 WIB, 17/04/2014',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF737373),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              DashedDivider(color: Color(0xFF141414)),
              SizedBox(height: 12),
              Text(
                'ID Pesanan: KCTS1004',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  fontFamily: 'Inter',
                  color: Color(0xFF737373),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Nama Pemesan: Rodi Cahyawan',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  fontFamily: 'Inter',
                  color: Color(0xFF737373),
                ),
              ),
              SizedBox(height: 12),
              DashedDivider(color: Color(0xFF141414)),
              SizedBox(height: 12),
              Text(
                '1 Rice Bowl Chicken Sambal Matah',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  fontFamily: 'Inter',
                  color: Color(0xFF737373),
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal 1 produk',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF737373),
                    ),
                  ),
                  Text(
                    'Rp 25.000',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF737373),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              DashedDivider(color: Color(0xFF141414)),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Tagihan',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF737373),
                    ),
                  ),
                  Text(
                    'Rp 25.000',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF737373),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              DashedDivider(color: Color(0xFF141414)),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total bayar',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF737373),
                    ),
                  ),
                  Text(
                    'Rp 50.000',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF737373),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              DashedDivider(color: Color(0xFF141414)),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Tagihan',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF737373),
                    ),
                  ),
                  Text(
                    'Rp 25.000',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      color: Color(0xFF737373),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              DashedDivider(color: Color(0xFF141414)),
              SizedBox(height: 16),
              Text(
                'Kritik saran & pujian (WA: 0812-2726-8611)',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Inter',
                  color: Color(0xFF737373),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'DM IG @kalih.coffee',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Inter',
                  color: Color(0xFF737373),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'Terimakasih atas kunjungannya',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Inter',
                    color: Color(0xFF141414),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final Color color;

  DashedDivider({required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(400 ~/ 5, (index) {
        return Expanded(
          child: Container(
            color: index.isEven ? color : Colors.transparent,
            height: 1,
          ),
        );
      }),
    );
  }
}