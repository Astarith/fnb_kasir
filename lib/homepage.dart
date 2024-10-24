import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final List<String> imagepaths = [
    'assets/images/WhatsApp Image 2024-10-14 at 15.30.51 (1).jpeg',
    'assets/images/logo perhotelan SMKN Cisarua.png'
  ];

  final List<String> textpath = [
    'Roti 1',
    'Roti 2',
    'Roti 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container Menu di sebelah kiri
              Container(
                height: 528,
                width: 200,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
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
                        // Aksi ketika tombol ditekan
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
}
