import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'merchants_screen.dart';
import 'package:mobile_app/dashboard_screen.dart';
import 'total_balance.dart';
import 'transfer_money_screen.dart';

TextEditingController enterAccountNumber = new TextEditingController();
TextEditingController enterAccountName = new TextEditingController();
TextEditingController enterbillAmount = new TextEditingController();
int billAmount = 0;
String sbillAmount = "bill";

class BillingScreen extends StatelessWidget {
  String merchant;
  BillingScreen(this.merchant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Pay Bills"), //update this title
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
              /*    Container(
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
              ), */
              /*  Container(
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
                  '# ',
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
                  '- PHP ',
                  style: TextStyle(
                    height: 3,
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ), */
              Container(
                width: double.infinity,
                child: Text(
                  merchant,
                  style: TextStyle(
                    height: 3,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Container(
                width: double.infinity,
                child: Text(
                  "Account Number",
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
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
                    prefixIcon: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.red[400],
                    ),
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
                width: double.infinity,
                child: Text(
                  "Account Name",
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: enterAccountName,
                  inputFormatters: [
                    new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                  ],
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.red[400],
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Enter Account Name',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Amount",
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: enterbillAmount,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: Colors.red[400],
                      ),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
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
                          enterAccountNumber.clear();
                          enterAccountName.clear();
                          enterbillAmount.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()),
                          );
                          //setValue(10, context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 120.0,
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        child: Text(
                          'Confirm',
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
                          sbillAmount = enterbillAmount.text;
                          if (enterAccountNumber.text.length < 12 ||
                              enterAccountNumber.text != "201812210910") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Oops.. Your Account Number is Incorrect')));
                          } else if (enterAccountName.text.length == 0 ||
                              enterAccountName.text != "VillaflorYap") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Oops.. Your Account Name is Incorrect')));
                          } else if (enterbillAmount.text.length > 0) {
                            /* transferAmount =
                                int.parse(SavingsAccount().sbillAmount); */
                            billAmount = int.parse(sbillAmount);
                          }
                          if (billAmount < 200) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Oops.. Minimum Transfer Amount is PHP 200.')));
                          } else if (billAmount > totalBalance) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Oops.. Insufficient Balance')));
                          } else {
                            totalBalance = totalBalance - billAmount;
                            stotalBalance = totalBalance.toString();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentSuccess()),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

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
                "Receipt",
                style: TextStyle(
                  height: 3,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
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
                          text: 'Account Name: ' + SavingsAccount().accountName,
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
                          text: 'Total Amount Payed: PHP ' + sbillAmount,
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
                          text: 'Payment Service: Boss Bank',
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
              padding: EdgeInsets.only(top: 40, bottom: 15),
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
                        enterAccountName.clear();
                        enterbillAmount.clear();
                        billAmount = 0;
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

void setValue(int value, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MerchantScreen(value)),
  );
}
