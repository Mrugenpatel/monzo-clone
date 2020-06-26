import 'package:flutter/material.dart';

class Account {
  final String name;
  final Color color;
  final double balance;
  final List<int> lastFourDigits;
  final List<int> expiresEnd;
  final String logo;
  final String cardholderName;
  Account(
    this.name,
    this.color,
    this.balance, {
    this.lastFourDigits,
    this.expiresEnd,
    this.logo,
    this.cardholderName,
  });
}
