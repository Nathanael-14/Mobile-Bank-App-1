import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard_screen.dart';
import 'package:mobile_app/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _textpassController = TextEditingController();

  List<String> credentialUser = [
    'admin',
  ];
  List<String> credentialPass = [
    'admin',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/Logo.png',
              height: 180,
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Welcome to Boss Bank',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40)),
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.black),
                icon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                fillColor: Color(0xFFF3E5F5),
                filled: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              controller: _textpassController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40)),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black),
                icon: Icon(
                  Icons.lock,
                  color: Colors.red,
                ),
                fillColor: Color(0xFFF3E5F5),
                filled: true,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: double.infinity,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text(
                  'Login',
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
                  if (!credentialUser
                          .contains(_textController.text.toLowerCase()) ||
                      (!credentialPass
                          .contains(_textpassController.text.toLowerCase()))) {
                    setState(() {
                      final snackBar = SnackBar(
                          content: Text('Incorrect Username or Password'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  } else {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()),
                      );
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
