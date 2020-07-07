import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
 String weekDaylabel;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (weekday.day == recentTransactions[i].date.day &&
            weekday.month == recentTransactions[i].date.month &&
            weekday.year == recentTransactions[i].date.year) {
          totalSum += recentTransactions[i].amount;

        }
      }
      weekDaylabel= weekday.weekday==1?"M":  weekday.weekday==2?"T": weekday.weekday==3?"w": weekday.weekday==4?"T": weekday.weekday==5?"F": weekday.weekday==6?"S":"S";

      return {"day": weekDaylabel, "amount": totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (currentval, item) {
      return currentval += item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data["day"],
                  data["amount"],
                  totalSpending == 0.0
                      ? 0.0
                      : (data["amount"] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
