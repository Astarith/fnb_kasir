import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String _selectedItem = 'Input';

  final List<String> makanan = [
    'Input',
    'Recent',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 65,
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 15),
                ClipOval(
                  child: Image.asset(
                    'assets/images/logo perhotelan SMKN Cisarua.png',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Food & Beverage',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 2, 52),
                    fontSize: 25,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sidebar
              Container(
                height: size.height * 0.913,
                width: size.width * 0.20,
                color: Colors.white,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0, left: 65),
                      child: Row(
                        children: [
                          Icon(Icons.article, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            'PRODUCT',
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
                  ],
                ),
              ),
              // Main content
              Container(
                height: size.height * 0.913,
                width: size.width * 0.80,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String item) {
    bool isSelected = _selectedItem == item;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = item; // Update selected item
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

  // Konten yang berubah sesuai pilihan sidebar
  Widget _buildContent() {
    if (_selectedItem == 'Input') {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            children: [
              // Product Gallery
              Text('Product Gallery',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 40, color: Colors.grey),
                      Text(
                          'Drop your image here, or browse\n.jpeg, .png are allowed',
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),

              // Form
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    _buildLabel('Product Name'),
                    _buildTextFormField(hintText: 'Lorem Ipsum'),

                    // Description
                    _buildLabel('Description'),
                    _buildTextFormField(
                        hintText: 'Lorem Ipsum is a Dummy Text', maxLines: 3),

                    // Category
                    _buildLabel('Category'),
                    _buildTextFormField(hintText: 'Sneaker'),

                    // SKU and Stock Quantity
                    Row(
                      children: [
                        Expanded(child: _buildLabel('SKU')),
                        SizedBox(width: 16),
                        Expanded(child: _buildLabel('Stock Quantity')),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: _buildTextFormField(hintText: '#32A53')),
                        SizedBox(width: 16),
                        Expanded(child: _buildTextFormField(hintText: '211')),
                      ],
                    ),

                    // Regular Price and Sale Price
                    Row(
                      children: [
                        Expanded(child: _buildLabel('Regular Price')),
                        SizedBox(width: 16),
                        Expanded(child: _buildLabel('Sale Price')),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildTextFormField(hintText: 'Rp.')),
                        SizedBox(width: 16),
                        Expanded(child: _buildTextFormField(hintText: 'Rp.')),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'UPDATE',
                      style: TextStyle(color: Colors.white),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'DELETE',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red)),
                  OutlinedButton(onPressed: () {}, child: Text('CANCEL')),
                ],
              ),
            ],
          ),
        ),
      );
    } else if (_selectedItem == 'Recent') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Items',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('Home > Recent'),
          // Contoh konten untuk 'Recent'
          Text('Ini adalah konten untuk Recent.'),
          // Konten lainnya...
        ],
      );
    } else {
      return Container(); // Konten default jika tidak ada yang dipilih
    }
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextFormField({String? hintText, int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
