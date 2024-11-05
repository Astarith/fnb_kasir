import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fnb_kasir/Input.dart';
import 'package:fnb_kasir/Login.dart';
import 'package:provider/provider.dart';
import 'package:fnb_kasir/provider/order.dart';
import 'package:fnb_kasir/provider/product.dart';
import 'package:intl/intl.dart';
import 'package:fnb_kasir/Riwayat.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int Angka = 0;

  void Tambah() {
    setState(() {
      Angka++;
    });
  }

  void Kurang() {
    setState(() {
      if (Angka > 0) {
        Angka--;
      }
    });
  }

  String _selectedItem = 'Toast';
  String _mejaNumber = '11';

  List<Product> getFilteredProducts() {
    if (_selectedItem == 'Toast') {
      return [
        Product(imagePath: imagepaths[0], textpath: textpath[0], price: 10000),
        Product(imagePath: imagepaths[1], textpath: textpath[1], price: 13000),
        Product(imagePath: imagepaths[2], textpath: textpath[2], price: 16000),
        Product(imagePath: imagepaths[3], textpath: textpath[3], price: 20000),
        Product(imagePath: imagepaths[4], textpath: textpath[4], price: 18000),
      ];
    } else if (_selectedItem == 'Donuts') {
      return [];
    } else if (_selectedItem == 'Quaso') {
      return [];
    } else if (_selectedItem == 'Coffwe') {
      return [
        Product(imagePath: imagepaths[5], textpath: textpath[5], price: 10000),
      ];
    } else if (_selectedItem == 'Yogurt') {
      return [
        Product(imagePath: imagepaths[6], textpath: textpath[6], price: 15000),
      ];
    }
    return [];
  }

  // List item untuk makanan dan minuman
  final List<String> makanan = [
    'Toast',
    'Donuts',
    'Quaso',
  ];
  final List<String> minuman = [
    'Coffwe',
    'Yogurt',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Header dengan Logo, Teks, dan SearchBar
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.09,
            width: size.width * 0.72,
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
            height: size.height * 0.09,
            width: size.width * 0.28,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Input()));
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Riwayat()),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                              break;
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text('Input Produk'),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text('Riwayat'),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Text('Logout'),
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
            height: size.height * 0.91,
            width: size.width * 0.14,
            color: Colors.white,
            child: ListView(
              children: [
                // Kategori Makanan
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, left: 7.0),
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
            height: size.height * 0.91,
            width: size.width * 0.58,
            color: Colors.grey.shade200,
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: getFilteredProducts().length,
              itemBuilder: (context, index) {
                final product = getFilteredProducts()[index];
                return GestureDetector(
                    onTap: () {
                      Provider.of<OrderProvider>(context, listen: false)
                          .addProduct(product);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: AspectRatio(
                              aspectRatio: 2,
                              child: Image.asset(
                                product.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            product.textpath,
                            style: TextStyle(color: Colors.blue.shade900),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rp${product.price}',
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                    ));
              },
            ),
          ),

          // Sidebar di sebelah kanan
          Container(
            height: size.height * 0.91,
            width: size.width * 0.28,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Consumer<OrderProvider>(
                    builder: (context, orderProvider, child) {
                      return ListView.builder(
                        itemCount: orderProvider.orderItems.length,
                        itemBuilder: (context, index) {
                          final product = orderProvider.orderItems[index];
                          return _buildOrderItem(product);
                        },
                      );
                    },
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
                            '${context.watch<OrderProvider>().totalItems} items',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'Rp.${context.watch<OrderProvider>().totalPrice}', // Tidak termasuk biaya layanan
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              icon:
                                  Icon(Icons.shopping_cart, color: Colors.red),
                              label: Text(
                                'Order',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                // Menampilkan dialog ringkasan pesanan
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    final orderProvider =
                                        context.read<OrderProvider>();
                                    final serviceFee =
                                        3000; // Biaya layanan tetap Rp.3000
                                    final subTotal =
                                        orderProvider.totalPrice + serviceFee;

                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Colors.red,
                                            width: 2.0), // Border merah
                                      ),
                                      title: Center(
                                        child: Text(
                                          'Total Pesanan',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 8, 40, 88),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Divider(),
                                          // Menambahkan daftar produk
                                          ...orderProvider.orderItems
                                              .map((product) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(product.textpath,
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                    Text('Rp.${product.price}',
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                  ],
                                                ),
                                                Divider(), // Tambahkan Divider di bawah setiap item
                                              ],
                                            );
                                          }).toList(),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Total',
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Text(
                                                  'Rp.${orderProvider.totalPrice}',
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Biaya Layanan',
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Text('Rp.$serviceFee',
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Sub Total',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text('Rp.$subTotal',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              // Tambahkan aksi pembayaran di sini
                                              _showPaymentDialog(
                                                  context); // Menampilkan dialog pembayaran
                                            },
                                            child: Text(
                                              'Bayar',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24.0,
                                                  vertical: 12.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 16.0),
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
          )
        ],
      )
    ])));
  }

  void _showPaymentDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '',
      decimalDigits: 0,
    );

    _controller.addListener(() {
      String text = _controller.text.replaceAll('.', '').replaceAll('Rp ', '');
      if (text.isNotEmpty) {
        int parsedValue = int.tryParse(text) ?? 0;
        String formattedText = currencyFormat.format(parsedValue);

        if (_controller.text != formattedText) {
          _controller.value = _controller.value.copyWith(
            text: formattedText,
            selection: TextSelection.collapsed(offset: formattedText.length),
          );
        }
      } else {
        _controller.value = _controller.value.copyWith(
          text: 'Rp. 0',
          selection: TextSelection.collapsed(offset: 'Rp. 0'.length),
        );
      }
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.red, width: 2.0),
          ),
          contentPadding: EdgeInsets.all(20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.payments_outlined,
                      color: Color.fromARGB(255, 8, 40, 88)),
                  SizedBox(width: 8.0),
                  Text(
                    'Masukan Nominal',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 40, 88),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Rp. ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  final orderProvider = context.read<OrderProvider>();
                  final serviceFee = 3000;
                  final subTotal = orderProvider.totalPrice + serviceFee;

                  String inputNominalText = _controller.text
                      .replaceAll('.', '')
                      .replaceAll('Rp ', '');
                  int inputNominal = int.tryParse(inputNominalText) ?? 0;

                  if (inputNominal < subTotal) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pembayaran Gagal'),
                          content: Text(
                              'Nominal yang dimasukkan tidak cukup untuk membayar total pesanan.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    int kembalian = inputNominal - subTotal;

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.green, width: 2.0),
                          ),
                          title: Center(
                            child: Text(
                              'Pembayaran Berhasil',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          content: SingleChildScrollView(
                            // Tambahkan SingleChildScrollView di sini
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      8.0), // Tambahkan padding jika diperlukan
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Divider(),
                                  ...orderProvider.orderItems.map((item) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(item.textpath,
                                              style: TextStyle(fontSize: 16)),
                                          Text(
                                            'Rp.${currencyFormat.format(item.price)}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      )),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total',
                                          style: TextStyle(fontSize: 16)),
                                      Text(
                                        'Rp.${currencyFormat.format(orderProvider.totalPrice)}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Biaya Layanan',
                                          style: TextStyle(fontSize: 16)),
                                      Text('Rp.$serviceFee',
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Sub Total',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        'Rp.${currencyFormat.format(subTotal)}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Jumlah Uang',
                                          style: TextStyle(fontSize: 16)),
                                      Text(
                                        'Rp.${currencyFormat.format(inputNominal)}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Kembalian',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green)),
                                      Text(
                                        'Rp.${currencyFormat.format(kembalian)}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Logika cetak
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: EdgeInsets.all(10.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Icon(Icons.print,
                                      color: Colors.white, size: 24),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    DateTime now = DateTime.now();
                                    String formattedDate =
                                        DateFormat('dd MMMM yyyy').format(now);
                                    String formattedTime =
                                        DateFormat('HH:mm').format(now);

                                    final int jumlahItem =
                                        orderProvider.totalItems;
                                    final int totalHarga =
                                        orderProvider.totalPrice;

                                    final transaction = Transaction(
                                      tanggal: formattedDate,
                                      items: jumlahItem,
                                      harga: totalHarga,
                                      waktu: formattedTime,
                                    );

                                    Provider.of<OrderProvider>(context,
                                            listen: false)
                                        .addTransaction(transaction);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Riwayat()),
                                    );
                                  },
                                  child: Text('Simpan',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 10.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK',
                                      style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 10.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'Bayar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  elevation: 5,
                  shadowColor: Colors.redAccent,
                ),
              ),
            ],
          ),
        );
      },
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

  Widget _buildOrderItem(Product product) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.red, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              product.imagePath,
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
                  product.textpath,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text('Rp. ${product.price}'),
                Text(
                  product.notes,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          // Row untuk tombol plus dan minus
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Tombol Minus
              IconButton(
                icon: Icon(Icons.remove, color: Colors.red),
                onPressed: () {
                  Provider.of<OrderProvider>(context, listen: false)
                      .decreaseQuantity(product);
                },
                color: Colors.red,
                padding: EdgeInsets.all(0),
              ),
              // Teks Jumlah
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${product.quantity}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // Tombol Plus
              IconButton(
                icon: Icon(Icons.add, color: Colors.red),
                onPressed: () {
                  Provider.of<OrderProvider>(context, listen: false)
                      .addProduct(product);
                },
                color: Colors.red,
                padding: EdgeInsets.all(0),
              ),
            ],
          ),
          SizedBox(width: 10), // Jarak antara jumlah dan tombol hapus
          // Tombol Hapus
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              Provider.of<OrderProvider>(context, listen: false)
                  .removeProduct(product);
            },
          ),
        ],
      ),
    );
  }
}
