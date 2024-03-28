import 'package:cafery/firebase_options.dart';
import 'package:cafery/views/startup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    return MaterialApp(
        theme: ThemeData(
            textTheme:
                const TextTheme(bodyLarge: TextStyle(fontFamily: 'MeiryoUI'))),
        debugShowCheckedModeBanner: false,
        home: StartupScreen());
  }
}
