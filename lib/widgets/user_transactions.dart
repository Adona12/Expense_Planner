import 'package:flutter/material.dart';

import '../model/transaction.dart';
import './new_transactions.dart';
import './transaction_list.dart';

class UserTranasactions extends StatefulWidget {
  @override
  _UserTranasactionsState createState() => _UserTranasactionsState();
}

class _UserTranasactionsState extends State<UserTranasactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "t1", amount: 69.99, title: "New shoes", date: DateTime.now()),
    Transaction(
        id: "t2",
        amount: 16.75,
        title: "weekly Groceries",
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(),
      TransactionList(_userTransactions),
    ],);
  }
}
