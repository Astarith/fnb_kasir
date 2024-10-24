import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _selectedItem =
      'Toast';

  final List<String> imagepaths = [
    'assets/images/WhatsApp Image 2024-10-14 at 15.30.51 (1).jpeg',
    'assets/images/logo perhotelan SMKN Cisarua.png'
  ];

  final List<String> textpath = [
    'Roti 1',
    'Roti 2',
    'Roti 3',
  ];

  // List item untuk makanan dan minuman
  final List<String> makanan = [
    'Toast',
    'Donuts',
    'Quaso',
    'Spesial Omlet',
    'Spesial Orak Arik'
  ];
  final List<String> minuman = [
    'Capuccino',
    'Latte',
    'Espresso',
    'Double Espresso',
    'Americano',
    'Macchiato',
    'Luwak Coffee',
    'Lemon Tea',
    'Green Tea',
    'Black Tea',
    'Thai Tea'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header dengan Logo, Teks, dan SearchBar
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 65,
                width: 930,
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/logo perhotelan SMKN Cisarua.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Food And Beverage',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 8, 2, 52),
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 65,
                width: 350,
                color: Colors.black,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Tombol ditekan");
                    },
                    child: Text('Click Me'),
                  ),
                ),
              ),
            ],
          ),

          // Baris 2: Menu, Konten, dan Sidebar
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container Menu di sebelah kiri
              Container(
                height: 528,
                width: 200,
                color: Colors.white,
                child: ListView(
                  children: [
                    // Kategori Makanan
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.fastfood, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            'MAKANAN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 8, 40, 88),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...makanan.map((item) => _buildMenuItem(item)).toList(),

                    // Kategori Minuman
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.local_drink, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            'MINUMAN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...minuman.map((item) => _buildMenuItem(item)).toList(),
                  ],
                ),
              ),

              // Area Konten di tengah
              Container(
                  height: 528,
                  width: 730,
                  color: Colors.white,
                  child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          ),
                      itemCount: imagepaths.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 12,
                                    spreadRadius: 3)
                              ]),
                          child: Column(
                            children: [
                              Expanded
                              (child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    imagepaths[index],
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ),
                              SizedBox(height: 5,),
                              Text(
                                textpath[index], style: TextStyle(color: Colors.blue.shade300),
                              )
                            ],
                          ),
                        );
                      })),

              // Sidebar di sebelah kanan
              Container(
                height: 528,
                width: 350,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sidebar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        print("Sidebar button pressed");
                      },
                      child: Text('Sidebar Button'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk setiap item menu
  Widget _buildMenuItem(String item) {
    bool isSelected = _selectedItem == item;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = item; // Ubah item yang dipilih
        });
      },
      child: Container(
        color: isSelected ? Colors.grey[300] : Colors.transparent, // Background abu-abu ketika dipilih
        child: Row(
          children: [
            // Garis merah di samping kiri jika item dipilih
            Container(
              width: 5,
              height: 50,
              color: isSelected ? Colors.red : Colors.transparent,
            ),
            SizedBox(width: 10),
            Text(
              item,
              style: TextStyle(
                color: isSelected ? Colors.red : Colors.black, // Warna teks merah jika dipilih
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}