import 'package:flutter/material.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  // Data contoh untuk riwayat transaksi
  final List<Map<String, dynamic>> riwayat = [
    {"tanggal": "7 Januari 2024", "items": 3, "harga": 36000, "waktu": "16:43"},
    {"tanggal": "5 Januari 2023", "items": 3, "harga": 36000, "waktu": "16:43"},
    {
      "tanggal": "29 Desember 2022",
      "items": 3,
      "harga": 36000,
      "waktu": "16:43"
    },
    {
      "tanggal": "18 Desember 2022",
      "items": 3,
      "harga": 36000,
      "waktu": "16:43"
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                    )),
                    SizedBox(width: 15,),
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
            child: ListView.builder(
              itemCount: riwayat.length,
              itemBuilder: (context, index) {
                final data = riwayat[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tanggal
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Text(
                        data['tanggal'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // Card Item Riwayat
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data['items']} Item',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Text(
                                    'Rp. ${data['harga'].toString()}',
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
                                data['waktu'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Tambahkan fungsi hapus disini
                                },
                                icon: Icon(Icons.close, color: Colors.red),
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
    );
  }
}
