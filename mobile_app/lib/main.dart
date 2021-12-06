import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard_screen.dart';
import 'package:mobile_app/splash_screen.dart';
import 'package:mobile_app/login_screen.dart';
import 'login_screen.dart';
import 'transfer_money_screen.dart';
import 'total_balance.dart';
import 'billing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.white,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
