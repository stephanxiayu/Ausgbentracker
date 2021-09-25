import 'package:flutter/cupertino.dart';

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  Transaction({
    @required this.amount,
    @required this.date,
    @required this.id,
    @required this.title,
  });
}