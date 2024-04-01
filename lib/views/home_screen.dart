// ignore_for_file: prefer_const_constructors

import 'package:cafery/services/auth.dart';
import 'package:cafery/views/startup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = AuthService().currentUser;

  Future<void> signOut() async {
    await AuthService().signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StartupScreen()));
  }

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
          //ログアウト
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    signOut();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(111, 78, 49, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'ログアウト',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
