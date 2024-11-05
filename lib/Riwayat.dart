import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fnb_kasir/homepage.dart';
import 'package:fnb_kasir/provider/order.dart';
import 'package:provider/provider.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  final Dio _dio = Dio(); // Inisialisasi Dio

  Future<void> _saveTransactionsToServer() async {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);

    try {
      for (var data in orderProvider.riwayat) {
        final response = await _dio.post(
          'https://mtr09ddw-9000.asse.devtunnels.ms/api/saveTransaction',
          data: {
            'tanggal': data.tanggal,
            'waktu': data.waktu,
            'items': data.items,
            'harga': data.harga,
          },
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Transaksi berhasil disimpan.')),
          );
        } else {
          throw Exception('Gagal menyimpan transaksi.');
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan transaksi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(height: 10),
          Expanded(
            child: orderProvider.riwayat.isEmpty
                ? Center(child: Text("Tidak ada riwayat transaksi."))
                : ListView.builder(
                    itemCount: orderProvider.riwayat.length,
                    itemBuilder: (context, index) {
                      final data = orderProvider.riwayat[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Text(
                              data.tanggal,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.receipt, color: Colors.red),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${data.items} Item',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Text(
                                          'Rp. ${data.harga.toString()}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      data.waktu,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        orderProvider.removeTransaction(index);
                                      },
                                      icon:
                                          Icon(Icons.close, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
            child: Icon(Icons.add, color: Colors.red),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(12),
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: _saveTransactionsToServer, // Simpan transaksi ke server
            child: Icon(Icons.download_for_offline, color: Colors.red),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}
