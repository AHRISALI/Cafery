// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cafery/services/auth.dart';
import 'package:cafery/views/home_screen.dart';
import 'package:cafery/views/startup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  bool _isSecurePass = true;
  //final AuthService _auth = AuthService();
  bool isLogin = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> siginIn() async {
    try {
      await AuthService().signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(255, 248, 231, 1.0),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 10),
                      height: 60,
                      width: 60,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartupScreen()),
                          );
                        },
                        backgroundColor: Color.fromRGBO(50, 38, 38, 1.0),
                        hoverColor: Colors.white,
                        child: Icon(Icons.arrow_back_rounded),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 200,
                      width: 200,
                      child: Image(
                          image: AssetImage('lib/icons/logo.png'),
                          fit: BoxFit.cover),
                    )
                  ],
                ),

                //メールアドレス
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 80,
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text(
                              'メールアドレス',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Icon(
                                  Icons.email_rounded,
                                  size: 35,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _emailController,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //パスワード
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 80,
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text(
                              'パスワード（8文字～16文字以内）',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Icon(
                                  Icons.password_rounded,
                                  size: 35,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  obscureText: _isSecurePass,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _passwordController,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    suffixIcon: togglePass(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //パスワードをお忘れですか？ボタン
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      width: 260,
                      child: InkWell(
                          onTap: () {
                            // Handle button tap
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'パスワードをお忘れですか？',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          )),
                    )
                  ],
                ),

                //ログインボタン
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          siginIn();
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
                    )
                  ],
                ),

                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ));
  }

  //パスワードのパスワード表示・非表示機能
  Widget togglePass() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePass = !_isSecurePass;
        });
      },
      icon: _isSecurePass ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
