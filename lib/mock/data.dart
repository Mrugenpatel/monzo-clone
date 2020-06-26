import 'package:bankingapp/datamodels/account.dart';
import 'package:bankingapp/datamodels/transaction.dart';
import 'package:flutter/material.dart';

final List<Transaction> txs = [
  Transaction(-8.99, 'Amazon', 'assets/img/amazon.png'),
  Transaction(500, 'Savings', 'assets/img/savings.png'),
  Transaction(-25.98, 'Sainsbury\'s', 'assets/img/sainsburys.png'),
  Transaction(-11.49, 'Deliveroo', 'assets/img/deliveroo.png'),
];

final List<Account> cards = [
  Account('Current Account', Colors.red, 6803.16,
      lastFourDigits: [5, 9, 2, 8],
      logo: 'monzo',
      expiresEnd: [0, 8, 2, 2],
      cardholderName: 'John Appleseed'),
  Account('Savings', Colors.blue, 85000.00,
      image: AssetImage('assets/img/savings.png')),
];
