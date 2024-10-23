import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris Header dengan Logo, Teks, dan SearchBar
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
                    // Logo dalam ClipOval
                    ClipOval(
                      child: Image.asset(
                        'assets/images/logo perhotelan SMKN Cisarua.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    // Teks "Food And Beverage"
                    Text(
                      'Food And Beverage',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 8, 2, 52),
                        fontSize: 25,
                      ),
                    ),
                    Spacer(), // Untuk menempatkan SearchBar di sebelah kanan
                    // Search Bar
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
                      // Aksi ketika tombol ditekan
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
