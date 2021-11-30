import 'package:mobile_app/transfer_money_screen.dart';

class SavingsAccount {
  String stransferAmount = enterAmount.text;
  String accountType = 'Savings Account';
  String accountNumber = '201812210910';
  String targetAccountNumber = enterAccountNumber.text;

  calculateCurrentBalance() {
    totalBalance = totalBalance - transferAmount;
    print(totalBalance);
  }
}

DateTime today = new DateTime.now();
String dateSlug =
    "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
