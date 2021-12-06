import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard_screen.dart';
import 'billing_screen.dart';

class MerchantScreen extends StatefulWidget {
  final int value;
  const MerchantScreen(this.value, {Key? key}) : super(key: key);

  @override
  MerchantScreenState createState() => MerchantScreenState();
}

class MerchantScreenState extends State<MerchantScreen> {
  String payWhat = "paywhat";
  String merchant = "merchant";
  List<List> merchantName = [
    [
      'Adendimun',
      'APEC',
      'ANECO',
      'ANTECO',
      'BENECO',
      'CELCO',
      'COTELCO',
      'Davao Light',
      'Meralco',
      'PALECO'
    ],
    [
      'Angeles Water',
      'Aqua Centro',
      'Baguio Water District',
      'BP Waterworks',
      'Calasiao Water',
      'CDO Water',
      'Davao City Water District',
      'Digos Water District',
      'Filinvest Water',
      'Gensan City Water District',
    ],
    [
      'Asian Vision Cable',
      'Cablelink',
      'Cable Television',
      'Cignal',
      'Comclark',
      'Converge ICT',
      'Globe at HOME',
      'Pilipino Cable',
      'Skycable',
      'Star Cable',
    ],
    [
      'Bayantel',
      'Eastern Telecoms',
      'Globe Postpaid',
      'GTSI',
      'Innove Communications',
      'PLDT',
      'PLDT Ultera',
      'PT&T',
      'Sitelco',
      'Smart Communications',
    ],
    [
      'AUB Credit Cards',
      'Bank of Commerce',
      'BPI Credit Card',
      'Chinabank Credit Card',
      'CitiBank MC or Visa',
      'EastWest Bank',
      'HSBC',
      'Maybank Credit Card',
      'PNB Credit Bank',
      'Security Bank Mastercard'
    ],
    [
      'ACOM',
      'AEON Credit',
      'Asialink',
      'AT LOADER',
      'Bangko Kabayan, Inc.',
      'BillEase',
      'Card SME Bank',
      'CBS Loans',
      'City Savings Bank',
      'DCCCO'
    ],
    [
      'Angeles City LGU',
      'BIR',
      'BSP',
      'BUREAU OF QUARANTINE',
      'Caloocan City Government',
      'Carmona City LGU',
      'City Government of Batangas',
      'DFA',
      'MMDA',
      'Pag-ibig',
    ],
    [
      'AA General Insurance',
      'BPI MS Insurance Corp',
      'DIALEX',
      'Fortune Life',
      'Generali PH',
      'Sun Life Grepa',
      'Insular Life',
      'Malayan Insurance Co Inc',
      'Manulife Philippines',
      'MAPFRE'
    ],
    [
      'AirAsia',
      'Air You Go Travels',
      'AP CARGO',
      'Autosweep RFID',
      'BIYAHEKO',
      'Cebu Pacific',
      'Easytrip RFID',
      'Philippine Airlines',
      'SUPERCAT',
      'Viacorn',
    ],
    [
      'ACTIVE REALITY',
      'AGGLC',
      'Alabang Country Club Inc',
      'ANJELMAN',
      'APMC',
      'BESC',
      'BGCEA',
      'Bria',
      'CAD Reality',
      'Celestial Meadows',
    ],
    [
      'Adventist Medical Center Manila',
      'Fortune Medicare',
      'iConnex',
      'KonsultaMD',
      'Medicard',
      'Makati Medical Center',
      'St. Dominic Medical Center',
      'Sunlife',
      'Maxicare',
      'PhilHealth',
    ],
    [
      'ADMU',
      'Ateneo De Davao University',
      'Bulacan State University',
      'DLSZ',
      'Golden Faith Academy',
      'Jose Rizal Academy',
      'Malayan Colleges Laguna',
      'Malayan Colleges Mindanao',
      'Miriam College',
      'STI'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Merchant'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][0];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][0]),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][1];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][1]),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][2];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][2]),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][3];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][3]),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][4];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][4]),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][5];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][5]),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][6];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][6]),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][7];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][7]),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][8];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][8]),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  merchant = merchantName[widget.value][9];
                  GoToBilling(context);
                },
                title: Text(merchantName[widget.value][9]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void GoToPayment(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => DashboardScreen()));
}

void GoToBilling(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => BillingScreen()));
}
