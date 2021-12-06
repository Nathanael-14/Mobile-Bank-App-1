import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/billing_screen.dart';
import 'package:mobile_app/login_screen.dart';
import 'package:mobile_app/merchants_screen.dart';
import 'transfer_money_screen.dart';
import 'total_balance.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Boss Bank'),
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
            icon: Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Logged Out...')));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  height: 210,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(38)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Bank Icon
                      Container(
                        width: 30,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor:
                                    Colors.yellow.withOpacity(0.75),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red.withOpacity(0.75),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(SavingsAccount().accountName,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.5))),
                      Text('Master Card',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(height: 15),
                      Text('# ' + SavingsAccount().accountNumber,
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text('Balance: ' + totalBalance.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.white)),

                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('Exp Date',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5))),
                              Text('5/25',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Cvv2',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5))),
                              Text('123',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 38,
            ),
            Text(
              'Send Money/Pay Bills',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 400,
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransferMoney()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 12, name: 'Send Money'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(0, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 1, name: 'Electricity'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(1, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 2, name: 'Water'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(2, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 3, name: 'Internet/Cable'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(3, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 4, name: 'Telecoms'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(4, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 5, name: 'Credit Card'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(5, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 6, name: 'Loan'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(6, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 13, name: 'Government'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(7, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 7, name: 'Insurance'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(8, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 8, name: 'Transportation'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(9, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 9, name: 'Real Estate'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(10, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 10, name: 'HealthCare'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red.withOpacity(0.75),
                    child: InkWell(
                      onTap: () {
                        setValue(11, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          PayIcon(id: 11, name: 'School'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class PayIcon extends StatelessWidget {
  final String name;
  final int id;
  const PayIcon({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/pay$id.png'),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '$name',
        )
      ],
    );
  }
}

void setValue(int value, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MerchantScreen(value)),
  );
}
