import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'total_balance.dart';
import 'package:mobile_app/dashboard_screen.dart';

TextEditingController enterAccountNumber = new TextEditingController();
TextEditingController enterAmount = new TextEditingController();
int transferAmount = 0;
int totalBalance = 100000;
String stotalBalance = totalBalance.toString();

class TransferMoney extends StatelessWidget {
  TransferMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Transfer Money'),
        ),
        backgroundColor: Colors.red,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            tooltip: 'Show Notifications',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('No Notifications')));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(
                  "Source",
                  style: TextStyle(
                    height: 3,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
                color: Colors.red,
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Savings Account',
                        style: TextStyle(
                          height: 3,
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                width: double.infinity,
                color: Colors.red,
                child: Text(
                  '# ' + SavingsAccount().accountNumber,
                  style: TextStyle(
                    height: 3,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                color: Colors.red,
                child: Text(
                  'Available Balance',
                  style: TextStyle(
                    height: 3,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10, bottom: 5),
                width: double.infinity,
                color: Colors.red,
                child: Text(
                  '- PHP ' + stotalBalance,
                  style: TextStyle(
                    height: 3,
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Destination",
                  style: TextStyle(
                    height: 3,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: enterAccountNumber,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                maxLength: 12,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Enter Account Number',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: enterAmount,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Enter Amount',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFF44336)),
                          elevation: MaterialStateProperty.all(0),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 82.0,
                    height: 10.0,
                  ),
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      child: Text(
                        'Confirm Transfer',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFF44336)),
                          elevation: MaterialStateProperty.all(0),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)))),
                      onPressed: () {
                        if (enterAccountNumber.text.length < 12) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Oops.. Invalid Account Number')));
                        } else if (enterAmount.text.length > 0) {
                          transferAmount =
                              int.parse(SavingsAccount().stransferAmount);
                        }
                        if (transferAmount < 200) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Oops.. Minimum Transfer Amount is PHP 200.')));
                        } else if (transferAmount > totalBalance) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Oops.. Insufficient Balance')));
                        } else {
                          totalBalance = totalBalance - transferAmount;
                          stotalBalance = totalBalance.toString();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransferSuccess()),
                          );
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//TRANSFER SUCCESS SCREEN
class TransferSuccess extends StatelessWidget {
  const TransferSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Transfer Success!'),
        ),
        backgroundColor: Colors.red,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            tooltip: 'Show Settings',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('No Notifications')));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Text(
                "Summary",
                style: TextStyle(
                  height: 3,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green[700],
                    size: 30.0,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Source: " +
                              SavingsAccount().accountType +
                              ', # ' +
                              SavingsAccount().accountNumber,
                          style: TextStyle(
                            color: Colors.black.withOpacity(1.0),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green[700],
                    size: 30.0,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Destination: # ' +
                              SavingsAccount().targetAccountNumber,
                          style: TextStyle(
                            color: Colors.black.withOpacity(1.0),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green[700],
                    size: 30.0,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Total Amount Transfered: PHP ' +
                              SavingsAccount().stransferAmount,
                          style: TextStyle(
                            color: Colors.black.withOpacity(1.0),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green[700],
                    size: 30.0,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Transaction Date: ' + dateSlug,
                          style: TextStyle(
                            color: Colors.black.withOpacity(1.0),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green[700],
                    size: 30.0,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Transfer Service: Boss Bank',
                          style: TextStyle(
                            color: Colors.black.withOpacity(1.0),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green[700],
                    size: 30.0,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Current Balance: PHP ' + stotalBalance,
                          style: TextStyle(
                            color: Colors.black.withOpacity(1.0),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 15),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 5)),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      child: Text(
                        'Exit',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFF44336)),
                          elevation: MaterialStateProperty.all(0),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)))),
                      onPressed: () {
                        enterAccountNumber.clear();
                        enterAmount.clear();
                        transferAmount = 0;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 70.0,
                    height: 10.0,
                  ),
                  SizedBox(
                    width: 165,
                    child: ElevatedButton(
                      child: Text(
                        'Download Receipt',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFF44336)),
                          elevation: MaterialStateProperty.all(0),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)))),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Downloading...')));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'www.BossBank.com\n(02) 8572 5555',
                style: TextStyle(
                  height: 3,
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
