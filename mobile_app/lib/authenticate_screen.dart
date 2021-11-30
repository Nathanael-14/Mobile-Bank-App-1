import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile_app/login_screen.dart';
import 'package:mobile_app/splash_screen.dart';

class AuthenticateScreen extends StatelessWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: 240,
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 200,
                child: ElevatedButton(
                  child: Text(
                    'Login as User',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFF44336)),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 200,
                child: ElevatedButton(
                  child: Text(
                    'Exit',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFF44336)),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)))),
                  onPressed: () => exit(0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
