import 'package:flutter/material.dart';

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  int quantity = 1;
  final int pricePerItem = 25000;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = quantity * pricePerItem;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Konfirmasi Order',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
        backgroundColor: Color(0xFFF5F3E7),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFFF5F3E7),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFD6CDA4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/RiceBowl.jpg',
                          width: 75,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rice Bowl Chicken Sambal Matah',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                            SizedBox(height: 8), // Tambahkan jarak vertikal
                            Text(
                              'Rp. 25.000,00',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF404040),
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF3D3D3D)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: IconButton(
                                icon: Icon(Icons.remove, size: 20),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                onPressed: _decrementQuantity,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '$quantity',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                              ),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              height: 30,
                              child: IconButton(
                                icon: Icon(Icons.add, size: 20),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                onPressed: _incrementQuantity,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Divider(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 80,
                    color: Color(0xFFD6CDA4),
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Total Pembayaran',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                              color: Color(0xFF3D3D3D),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Rp $totalPrice',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                              color: Color(0XFF0E3822),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for order button
                      },
                      child: Center(
                        child: Text(
                          'Pesan Sekarang',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0E3822),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
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