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
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("CAFERY",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            backgroundColor: Color.fromRGBO(111, 78, 49, 1.0),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  signOut();
                },
              )
            ]),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //margin: EdgeInsets.only(left: 30, right: 10),
                  height: 300,
                  child: Image(
                      image: AssetImage('lib/icons/coffeetime.gif'),
                      fit: BoxFit.cover),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top: 20),
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(111, 78, 49, 1.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "人気店舗",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),

            //人気店舗一つ目
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: Container(
                          margin: EdgeInsets.only(top: 50),
                          width: 350,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(111, 78, 49, 1.0),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 150,
                                height: 100,
                                child: Image(
                                    image: AssetImage('lib/icons/hoshino.jpg'),
                                    fit: BoxFit.cover),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 11),
                                    width: 150,
                                    height: 25,
                                    child: Text(
                                      "星乃珈琲",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 20,
                                        ),
                                        width: 150,
                                        height: 25,
                                        child: Text(
                                          "群馬県、前橋",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        width: 150,
                                        height: 25,
                                        child: Text(
                                          "㊡年中無休",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        width: 150,
                                        height: 25,
                                        child: Text(
                                          "¥1000～¥2000",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),

            //人気店舗二つ目
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 350,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(111, 78, 49, 1.0),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 150,
                                height: 100,
                                child: Image(
                                    image:
                                        AssetImage('lib/icons/starbucks.jpg'),
                                    fit: BoxFit.cover),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 11),
                                    width: 150,
                                    height: 25,
                                    child: Text(
                                      "スターバックス太田",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 20,
                                        ),
                                        width: 150,
                                        height: 25,
                                        child: Text(
                                          "群馬県、太田市",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        width: 150,
                                        height: 25,
                                        child: Text(
                                          "㊡年中無休",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        width: 150,
                                        height: 25,
                                        child: Text(
                                          "¥1000～¥2000",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 80, left: 30),
                      width: 60,
                      height: 60,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.search),
                        backgroundColor: Color.fromRGBO(50, 38, 38, 1.0),
                        hoverColor: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 80),
                      width: 60,
                      height: 60,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.bookmark),
                        backgroundColor: Color.fromRGBO(50, 38, 38, 1.0),
                        hoverColor: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 30),
                      width: 60,
                      height: 60,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.menu),
                        backgroundColor: Color.fromRGBO(50, 38, 38, 1.0),
                        hoverColor: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            )
          ]),
        ));
  }
}
