import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();

  // Controllers untuk setiap TextFormField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _regularPriceController = TextEditingController();
  final TextEditingController _salePriceController = TextEditingController();

  // Fungsi untuk memilih gambar dari galeri
  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected')),
        );
      }
    });
  }

  // List untuk menyimpan data
  List<Map<String, String>> savedDataList = [];
  String _selectedItem = 'Input';
  final List<String> makanan = ['Input', 'Recent'];

  // Fungsi untuk mengirim data ke server
  void _submitData() async {
  try {
    // Buat FormData untuk mengirim data beserta file gambar
    FormData formData = FormData.fromMap({
      "product_name": _nameController.text,
      "description": _descriptionController.text,
      "category": _categoryController.text,
      "sku": _skuController.text,
      "stock_quantity": int.tryParse(_stockController.text) ?? 0,
      "regular_price": double.tryParse(_regularPriceController.text) ?? 0.0,
      "sale_price": double.tryParse(_salePriceController.text) ?? 0.0,
      // Jika gambar ada, tambahkan ke FormData
      if (_imageFile != null)
        "image": await MultipartFile.fromFile(
          _imageFile!.path,
          filename: _imageFile!.path.split('/').last,
        ),
    });

    // Ganti dengan token kamu yang valid
    final token = 'kljsdfygwaejkfsacgfsajbdklsjadhfjsbdfsdjahfg';

    // Mengirim data ke API menggunakan POST request dengan headers
    final response = await _dio.post(
      'https://mtr09ddw-9000.asse.devtunnels.ms/api/createProduk',
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Produk berhasil ditambahkan!')),
    );

    // Panggil _saveData untuk menambahkan data ke Recent
    _saveData();
  } on DioError catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal menambahkan produk: ${e.message}')),
    );
  }
}

  // Fungsi untuk membersihkan data di form
  void _clearData() {
    _nameController.clear();
    _descriptionController.clear();
    _categoryController.clear();
    _skuController.clear();
    _stockController.clear();
    _regularPriceController.clear();
    _salePriceController.clear();
  }

  // Fungsi untuk menyimpan data ke 'Recent'
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
      const SnackBar(content: Text('Data Saved and moved to Recent!')),
    );
    _clearData();
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
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.red),
                  ),
                  const SizedBox(width: 15),
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
                            const Icon(Icons.article, color: Colors.black),
                            const SizedBox(width: 8),
                            const Text(
                              'PRODUCT',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 8, 40, 88),
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
      onTap: () => setState(() => _selectedItem = item),
      child: Container(
        color: isSelected ? Colors.grey[300] : Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 5,
              height: 50,
              color: isSelected ? Colors.red : Colors.transparent,
            ),
            const SizedBox(width: 10),
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

  Widget _buildProductGallery() {
    return GestureDetector(
      onTap: _pickImage, // Memanggil fungsi untuk memilih gambar
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: _imageFile == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image, size: 40, color: Colors.grey),
                    Text(
                      'Tap to select an image\n.jpeg, .png are allowed',
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedItem == 'Input') {
      return ListView(
        children: [
          const Text('Product Gallery',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildProductGallery(),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel('Product Name'),
                _buildTextFormField(
                    controller: _nameController, hintText: 'Lorem Ipsum'),
                _buildLabel('Description'),
                _buildTextFormField(
                    controller: _descriptionController,
                    hintText: 'Lorem Ipsum is a Dummy Text',
                    maxLines: 3),
                _buildLabel('Category'),
                _buildTextFormField(
                    controller: _categoryController, hintText: 'Sneaker'),
                Row(
                  children: [
                    Expanded(child: _buildLabel('SKU')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildLabel('Stock Quantity')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: _buildTextFormField(
                            controller: _skuController, hintText: '#32A53')),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _buildTextFormField(
                            controller: _stockController, hintText: '211')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildLabel('Regular Price')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildLabel('Sale Price')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: _buildTextFormField(
                            controller: _regularPriceController,
                            hintText: 'Rp.')),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _buildTextFormField(
                            controller: _salePriceController, hintText: 'Rp.')),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _submitData,
                child:
                    const Text('UPDATE', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
              ElevatedButton(
                onPressed: _clearData,
                child:
                    const Text('DELETE', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('CANCEL'),
              ),
            ],
          ),
        ],
      );
    } else if (_selectedItem == 'Recent') {
      return ListView.builder(
        itemCount: savedDataList.length,
        itemBuilder: (context, index) {
          final data = savedDataList[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: const EdgeInsets.all(12.0),
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
                    style: const TextStyle(fontSize: 16),
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
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
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
        border: const OutlineInputBorder(),
      ),
    );
  }
}