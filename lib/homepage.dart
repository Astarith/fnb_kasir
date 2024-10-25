import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _selectedItem = 'Toast';
  String _mejaNumber = '11';

  final List<String> imagepaths = [
    'assets/images/WhatsApp Image 2024-10-14 at 15.30.51 (1).jpeg',
    'assets/images/logo perhotelan SMKN Cisarua.png',
    'assets/images/FrenchToast.jpg',
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

  final List<String> hargapath = [
    'Rp10.000',
    'Rp13.000',
    'RP16.000'
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
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Sidebar kanan atas
              Container(
                height: 65,
                width: 350,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Bagian kiri dengan Ikon dan Teks
                      Row(
                        children: [
                          // Ikon clipboard dengan latar belakang merah
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.content_paste,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          // Teks "Order Menu" dan "Meja No. $_mejaNumber"
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text(
                                'Order Menu',
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Meja No. $_mejaNumber',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Bagian kanan dengan ikon edit dan overflow
                      Row(
                        children: [
                          // Ikon Edit dengan fungsinya
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.red,
                              size: 24,
                            ),
                            onPressed: () {
                              _editMejaNumberDialog(context);
                            },
                          ),
                          SizedBox(width: 2),

                          // Ikon Overflow dengan PopupMenu
                          PopupMenuButton<int>(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.black,
                              size: 24,
                            ),
                            onSelected: (value) {
                              switch (value) {
                                case 1:
                                  print('Tersimpan');
                                  break;
                                case 2:
                                  print('Riwayat');
                                  break;
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text('Tersimpan'),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text('Riwayat'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
                          Icon(Icons.breakfast_dining, color: Colors.black),
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
                          Icon(Icons.coffee_sharp, color: Colors.black),
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
                  color: Colors.grey.shade200,
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 12,
                                    spreadRadius: 3)
                              ]),
                          child: Column(
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  imagepaths[index],
                                  fit: BoxFit.cover,
                                ),
                              )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                textpath[index],
                                style: TextStyle(color: Colors.blue.shade900),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                hargapath[index],
                                style: TextStyle(color: Colors.grey.shade300),
                              )
                            ],
                          ),
                        );
                      }
                )
              ),

              // Sidebar di sebelah kanan
              Container(
                height: 528,
                width: 350,
                color: Colors.white,
                child: Column(
                  children: [
                    // List items ordered
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.all(8.0),
                        children: [
                          _buildOrderItem(
                            'assets/images/FrenchToast.jpg',
                            'Chocolate Toast',
                            10000,
                            'Jangan pedas, garam sedikit',
                            1,
                          ),
                          _buildOrderItem(
                            'assets/images/FrenchToast.jpg',
                            'Blueberry Toast',
                            10000,
                            'Catatan',
                            1,
                          ),
                          _buildOrderItem(
                            'assets/images/lemon.jpg',
                            'Lemon Tea',
                            6000,
                            'Jangan banyak gula',
                            2,
                          ),
                        ],
                      ),
                    ),

                    // Total price and order button
                    Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.red,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '4 items',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                'Rp.24.000',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  icon: Icon(Icons.save, color: Colors.white),
                                  label: Text('Order'),
                                  onPressed: () {
                                    // Action when pressing the order button
                                    print('Order Button Pressed');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.red,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

// Fungsi untuk menampilkan dialog edit meja number
  void _editMejaNumberDialog(BuildContext context) {
    TextEditingController mejaController =
        TextEditingController(text: _mejaNumber);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Meja Number"),
          content: TextField(
            controller: mejaController,
            decoration: InputDecoration(hintText: "Enter new Meja Number"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Save"),
              onPressed: () {
                setState(() {
                  _mejaNumber = mejaController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
        color: isSelected
            ? Colors.grey[300]
            : Colors.transparent, // Background abu-abu ketika dipilih
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
                color: isSelected
                    ? Colors.red
                    : Colors.black, // Warna teks merah jika dipilih
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String imagePath, String itemName, int price,
      String notes, int quantity) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.red, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text('Rp. $price'),
                Text(
                  notes,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              IconButton(
                constraints: BoxConstraints(
                  minHeight: 5,
                  minWidth: 5
                ),
                padding: EdgeInsets.all(1),
                style: IconButton.styleFrom(backgroundColor: Colors.red
                ),
                icon: Icon(Icons.remove, color: Colors.white),
                onPressed: () {
                  // Logic for reducing quantity
                },
              ),
              Text('$quantity'),
              IconButton(
                constraints: BoxConstraints(
                  minHeight: 5,
                  minWidth: 5,
                ),
                padding: EdgeInsets.all(1),
                style: IconButton.styleFrom(backgroundColor: Colors.red),
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  // Logic for increasing quantity
                },
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              // Logic for removing item
            },
          ),
        ],
      ),
    );
  }
}
