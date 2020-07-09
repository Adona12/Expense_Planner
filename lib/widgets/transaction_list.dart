import 'dart:ui';

import '../model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions,this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx,constraints){
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
                  height: constraints.maxHeight*0.7,
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
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  child: ListTile(

                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text( '${transactions[index].date.day}/${transactions[index].date.month}/${transactions[index].date.year}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,color: Theme.of(context).errorColor,),
                      onPressed: () =>deleteTransaction(transactions[index].id),

                    ),
                  ),
                );
              },
            ));
      },

    );
  }
}
