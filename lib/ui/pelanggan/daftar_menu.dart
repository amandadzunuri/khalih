import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalih Menu',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DaftarMenu(),
    );
  }
}

// MenuService class to fetch data from Firestore
class MenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchMenuItems(String jenisMenu) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('menu')
          .where('jenis_menu', isEqualTo: jenisMenu)
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print("Error fetching menu items: $e");
      throw e;
    }
  }
}

class DaftarMenu extends StatefulWidget {
  @override
  _DaftarMenuState createState() => _DaftarMenuState();
}

class _DaftarMenuState extends State<DaftarMenu> {
  late Future<List<Map<String, dynamic>>> _menuItemsFuture;

  @override
  void initState() {
    super.initState();
    _menuItemsFuture = MenuService().fetchMenuItems('Noodle');
  }

  final List<Map<String, String>> categories = [
    {'name': 'Coffee', 'image': 'assets/images/coffee.png'},
    {'name': 'Non-Coffee', 'image': 'assets/images/non_caffee.png'},
    {'name': 'Noodle', 'image': 'assets/images/noodle.png'},
    {'name': 'Rice', 'image': 'assets/images/rice.png'},
    {'name': 'Snack', 'image': 'assets/images/snack.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3E5),
      body: Column(
        children: [
          // Green Background for Title
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF0E3822),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 20),
                      child: Text(
                        'Selamat datang di Kalih!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, top: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                        child: Image.asset(
                          'assets/icon/ic_keranjang.png',
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 2, 0),
                        child: GestureDetector(
                          onTap: () {
                            // Handle category tap
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                categories[index]['image']!,
                                width: 58,
                                height: 58,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 0),
                                child: Text(
                                  categories[index]['name']!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Menu Items
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _menuItemsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No items found'));
                } else {
                  final menuItems = snapshot.data!;
                  return GridView.builder(
                    padding: EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => DetailPage(menuItems[index]),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Color(0xFFD6CDA4),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                child: Image.network(
                                  menuItems[index]['gambar'],
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      menuItems[index]['nama'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Rp ${menuItems[index]['harga']}.00',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(height: 8.0),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Handle add to cart
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0E3822),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          fixedSize: Size(160, 0),
                                        ),
                                        child: Text(
                                          'Tambah +',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> menuItem;

  DetailPage(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(menuItem['gambar'], width: 100, height: 100),
            SizedBox(height: 16),
            Text(menuItem['nama'], style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text('Rp ${menuItem['harga']}.00'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: Center(
        child: Text('Keranjang belanja Anda kosong.'),
      ),
    );
  }
}
