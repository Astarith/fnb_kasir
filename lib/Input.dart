import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

const createProduk = async (req, res) => {
    try {
        final { product_name, description, category, sku, stock_quantity, regular_price, sale_price } = req.body;
        
        // Dapatkan URL gambar jika file diunggah
        const image_url = req.file ? ${req.protocol}://${req.get('host')}/uploads/${req.file.filename} : null;

        const newProduct = await Produk.create({
            product_name,
            description,
            category,
            sku,
            stock_quantity,
            regular_price,
            sale_price,
            image_url
        });

        res.status(201).json({
            message: 'Produk berhasil ditambahkan',
            data: newProduct
        });
    } catch (error) {
        res.status(500).json({
            message: 'Terjadi kesalahan',
            error: error.message
        });
    }
}

class _InputState extends State<Input> {
  String _selectedItem = 'Input';

  // Controllers untuk setiap TextFormField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _regularPriceController = TextEditingController();
  final TextEditingController _salePriceController = TextEditingController();

  // List untuk menyimpan data
  List<Map<String, String>> savedDataList = [];

  final List<String> makanan = ['Input', 'Recent'];

  // Fungsi untuk menyimpan data dan beralih ke halaman 'Recent'
  void _saveData() {
    setState(() {
      final newData = {
        "Product Name": _nameController.text,
        "Description": _descriptionController.text,
        "Category": _categoryController.text,
        "SKU": _skuController.text,
        "Stock Quantity": _stockController.text,
        "Regular Price": _regularPriceController.text,
        "Sale Price": _salePriceController.text,
      };
      savedDataList.add(newData);
      _selectedItem = 'Recent';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data Saved and moved to Recent!')),
    );

    // Clear form setelah data disimpan
    _clearData();
  }

  // Fungsi untuk menghapus data dari form
  void _clearData() {
    setState(() {
      _nameController.clear();
      _descriptionController.clear();
      _categoryController.clear();
      _skuController.clear();
      _stockController.clear();
      _regularPriceController.clear();
      _salePriceController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }

  Widget _buildMenuItem(String item) {
    bool isSelected = _selectedItem == item;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = item;
        });
      },
      child: Container(
        color: isSelected ? Colors.grey[300] : Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 5,
              height: 50,
              color: isSelected ? Colors.red : Colors.transparent,
            ),
            SizedBox(width: 10),
            Text(
              item,
              style: TextStyle(
                color: isSelected ? Colors.red : Colors.black,
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
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Product Name'),
                    _buildTextFormField(controller: _nameController, hintText: 'Lorem Ipsum'),
                    _buildLabel('Description'),
                    _buildTextFormField(controller: _descriptionController, hintText: 'Lorem Ipsum is a Dummy Text', maxLines: 3),
                    _buildLabel('Category'),
                    _buildTextFormField(controller: _categoryController, hintText: 'Sneaker'),
                    Row(
                      children: [
                        Expanded(child: _buildLabel('SKU')),
                        SizedBox(width: 16),
                        Expanded(child: _buildLabel('Stock Quantity')),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildTextFormField(controller: _skuController, hintText: '#32A53')),
                        SizedBox(width: 16),
                        Expanded(child: _buildTextFormField(controller: _stockController, hintText: '211')),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildLabel('Regular Price')),
                        SizedBox(width: 16),
                        Expanded(child: _buildLabel('Sale Price')),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildTextFormField(controller: _regularPriceController, hintText: 'Rp.')),
                        SizedBox(width: 16),
                        Expanded(child: _buildTextFormField(controller: _salePriceController, hintText: 'Rp.')),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _saveData,
                    child: Text('UPDATE', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: _clearData,
                    child: Text('DELETE', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('CANCEL'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else if (_selectedItem == 'Recent') {
      return ListView.builder(
        itemCount: savedDataList.length,
        itemBuilder: (context, index) {
          final data = savedDataList[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '${entry.key}: ${entry.value}',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    String? hintText,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
