import 'dart:ui';
import 'package:flutter/material.dart';
import './transaction-item.dart';
import '../model/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
            child: transactions.isEmpty
                ? Column(
                    children: <Widget>[
                      Text(
                        "No added Transactions",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.7,
                        child: Image.asset(
                          "assets/images/waiting.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (ctx, index) {
                      return TransactionItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
                    },
                  ));
      },
    );
  }
}

