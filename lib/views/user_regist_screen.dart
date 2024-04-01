// ignore_for_file: prefer_const_constructors

import 'package:cafery/controllers/regist_controller.dart';
import 'package:cafery/services/auth.dart';
import 'package:cafery/views/home_screen.dart';
import 'package:cafery/views/startup_screen.dart';
import 'package:cafery/views/user_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRegistScreen extends StatefulWidget {
  const UserRegistScreen({Key? key}) : super(key: key);

  @override
  _RegistState createState() => _RegistState();
}

class _RegistState extends State<UserRegistScreen> {
  final AuthService _auth = AuthService();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordCheckController = TextEditingController();
  TextEditingController _prefController = TextEditingController();

  Future<void> siginUp() async {
    try {
      await AuthService().createUserWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserLoginScreen()));
    } on FirebaseAuthException catch (e) {}
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordCheckController.dispose();
    _prefController.dispose();
  }

  bool _isSecurePass = true;
  bool _isSecurePassCheck = true;
  String selectedPrefecture = '北海道';
  List<String> prefectures = [
    '北海道',
    '青森県',
    '岩手県',
    '宮城県',
    '秋田県',
    '山形県',
    '福島県',
    '茨城県',
    '栃木県',
    '群馬県',
    '埼玉県',
    '千葉県',
    '東京都',
    '神奈川県',
    '新潟県',
    '富山県',
    '石川県',
    '福井県',
    '山梨県',
    '長野県',
    '岐阜県',
    '静岡県',
    '愛知県',
    '三重県',
    '滋賀県',
    '京都府',
    '大阪府',
    '兵庫県',
    '奈良県',
    '和歌山県',
    '鳥取県',
    '島根県',
    '岡山県',
    '広島県',
    '山口県',
    '徳島県',
    '香川県',
    '愛媛県',
    '高知県',
    '福岡県',
    '佐賀県',
    '長崎県',
    '熊本県',
    '大分県',
    '宮崎県',
    '鹿児島県',
    '沖縄県'
  ];

  @override
  Widget build(BuildContext context) {
    final registController = Get.put(RegistController());
    final _formKey = GlobalKey<FormState>();

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
                        child: Icon(Icons.arrow_back_rounded),
                        backgroundColor: Color.fromRGBO(50, 38, 38, 1.0),
                        hoverColor: Colors.white,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top: -10),
                      height: 150,
                      width: 150,
                      child: Image(
                          image: AssetImage('lib/icons/logo.png'),
                          fit: BoxFit.cover),
                    )
                  ],
                ),

                //ユーザー名
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
                            padding: EdgeInsets.only(left: 0.0),
                            child: Text(
                              'ユーザー名（10文字以内）',
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
                                  Icons.person,
                                  size: 35,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _userNameController,
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
                                child: TextFormField(
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
                                child: TextFormField(
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

                //パスワード再確認
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
                              'パスワード再確認',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Image(
                                  image: AssetImage('lib/icons/confirm.png'),
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  obscureText: _isSecurePassCheck,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _passwordCheckController,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    suffixIcon: togglePassCheck(),
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

                //都道府県
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 90,
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, right: 8.0, bottom: 8.0),
                            child: Text(
                              '都道府県',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8.0, right: 8.0, bottom: 8.0),
                                child: Image(
                                  image: AssetImage('lib/icons/japan.png'),
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  value: selectedPrefecture,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedPrefecture = newValue ?? '';
                                      _prefController.text = selectedPrefecture;
                                    });
                                  },
                                  items: prefectures
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value:
                                          value, // Make sure each value is unique in the list
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // //新規登録ボタン
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          siginUp();
                          //dispose();
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

  //パスワード再確認のパスワード表示・非表示機能
  Widget togglePassCheck() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassCheck = !_isSecurePassCheck;
        });
      },
      icon: _isSecurePassCheck
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
