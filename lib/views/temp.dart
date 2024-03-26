import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 248, 231, 1.0),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.lightBlue,
              )
            ],
          )
        ],
      ),
    );
  }
}
