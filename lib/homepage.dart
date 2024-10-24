import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _selectedItem = 'Toast'; // Item yang dipilih, default-nya adalah 'Toast'

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
                              color: Colors.blue.shade900,
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
                color: Colors.cyan,
                child: Center(
                  child: Text(
                    'Content Area',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

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
    return ListTile(
      title: Text(item),
      selected: isSelected,
      selectedTileColor: Colors.red.shade100,
      onTap: () {
        setState(() {
          _selectedItem = item; // Ubah item yang dipilih
        });
      },
      textColor: isSelected ? Colors.red : Colors.black,
    );
  }
}
