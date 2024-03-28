// ignore_for_file: prefer_const_constructors

import 'package:cafery/views/home_screen.dart';
import 'package:cafery/views/user_login_screen.dart';
import 'package:cafery/views/user_regist_screen.dart';
import 'package:flutter/material.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 248, 231, 1.0),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.only(right: 35),
                    height: 50,
                    child: Image(
                        image: AssetImage('lib/icons/CAFERY.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 30, right: 20),
                    padding: EdgeInsets.only(top: 10, left: 10),
                    height: 50,
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          child: Text(
                            'スキップ',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          ),
                        )),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80, left: 10, right: 10),
                  height: 50,
                  //color: Colors.lightGreenAccent,
                  child: Text(
                    '会員登録をすると...',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  //color: Colors.lightGreenAccent,
                  child: Text(
                    '気になるお店をワンタップ保存',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  child: Image(
                      image: AssetImage('lib/icons/member.gif'),
                      fit: BoxFit.cover),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserLoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(111, 78, 49, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'ログイン',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, right: 20),
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserRegistScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(111, 78, 49, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      '新規登録',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
