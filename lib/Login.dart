import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:fnb_kasir/homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _change = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Dio _dio = Dio(); //menggunakan plugin Dio untuk menghubungkan server
  void _login() async {
    //fungsi
    final username = usernameController.text;
    final password = passwordController.text;

    try {
      final response = await _dio.post(
        'https://mtr09ddw-9000.asse.devtunnels.ms/api/login', //menggunakan URL untuk menghubungkan API
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Login berhasil')), //notif jika login berhasil
        );
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(
                
                ), //jika berhasil maka akan langsung pindah page
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login gagal')), //notif jika login gagal
      );
    }
  }

  bool _secureText = true;
  showhide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                
                color: Color(0xFF2C2C54),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 500,
                          height: 700,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.white, width: 1.0)),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                    'assets/images/logo perhotelan SMKN Cisarua.png'),
                              ),
                              SizedBox(height: 40),
                              Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Username",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextField(
                                      controller: usernameController,
                                      decoration: InputDecoration(
                                        hintText: "Username",
                                        prefixIcon: Icon(Icons.people),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        fillColor: Colors.white,
                                        filled: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Password",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        prefixIcon: Icon(Icons.lock),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        fillColor: Colors.white,
                                        filled: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),
                              Container(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: _login,
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        minimumSize: Size(double.infinity, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5)),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/WhatsApp Image 2024-10-14 at 15.30.51 (1).jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                ),
                Center(
                  child: Container(
                    width: 500,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 1.0)),
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: Text(
                      "WELCOME CASHIER!",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
