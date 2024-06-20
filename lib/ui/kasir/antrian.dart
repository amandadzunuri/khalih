import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalih Cafe',
      theme: ThemeData(
        primaryColor: Color(0xFF0E3822),
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Antrian(),
    );
  }
}

class Antrian extends StatefulWidget {
  @override
  _AntrianState createState() => _AntrianState();
}

class _AntrianState extends State<Antrian> {
  List<Map<String, dynamic>> orders = [
    {'number': 10, 'name': 'Amanda Dzunuri', 'total': 25000},
    {'number': 8, 'name': 'Marlina Nur Rahmawati', 'total': 100000},
    {'number': 5, 'name': 'Rodi Cahyawan', 'total': 125000},
    {'number': 1, 'name': 'Ahmad Fhatoni', 'total': 10000},
    {'number': 6, 'name': '@bbymoyaa', 'total': 500000},
  ];

  String searchQuery = '';
  bool showOrders = true;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredOrders = orders.where((order) {
      return order['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          order['number'].toString().contains(searchQuery);
    }).toList();

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
              'Cashier\nKalih Cafe',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SlideButton(
              onSlideChange: (bool showOrders) {
                setState(() {
                  this.showOrders = showOrders;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: GoogleFonts.poppins(color: Color(0xFF737373)),
                prefixIcon: Icon(Icons.search, color: Color(0xFF737373)),
                filled: true,
                fillColor: Color(0xFFF5F3E5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: showOrders
                  ? ListView.builder(
                      itemCount: filteredOrders.length,
                      itemBuilder: (context, index) {
                        var order = filteredOrders[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          color: Color(0xFFD6CDA4),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Color(0xFFF5F3E5),
                                        child: Text(
                                          order['number'].toString(),
                                          style: TextStyle(
                                            color: Color(0xFF0E3822),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        order['name'],
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xFF141414),
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Total: Rp. ${order['total']},00',
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFF404040),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, right: 1),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF0E3822),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/detail_pesanan');
                                      },
                                      child: Text(
                                        'Cek Pesanan',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'Selesai',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Color(0xFF404040),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideButton extends StatefulWidget {
  final Function(bool) onSlideChange;

  SlideButton({required this.onSlideChange});

  @override
  _SlideButtonState createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {
  bool isAntrian = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFD6CDA4),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isAntrian = true;
                });
                widget.onSlideChange(true);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isAntrian ? Color(0xFF0E3822) : Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  'Antrian',
                  style: GoogleFonts.poppins(
                    color: isAntrian ? Color(0xFFFFFFFF) : Color(0xFF141414),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isAntrian = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isAntrian ? Colors.transparent : Color(0xFF0E3822),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  'Selesai',
                  style: GoogleFonts.poppins(
                    color: isAntrian ? Color(0xFF141414) : Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
