import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                color: Colors.grey,
              ),
              Container(
                height: 65,
                width: 350,
                color: Colors.black,
              ),
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 528,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 528,
                width: 730,
                color: Colors.cyan,
              ),
              Container(
                height: 528,
                width: 350,
                color: Colors.black,
              )
            ],
          ),
          Container()
        ],
      ),
    );
  }
}