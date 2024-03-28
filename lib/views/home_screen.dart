// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 248, 231, 1.0),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(right: 35),
                  height: 50,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30, right: 20),
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
