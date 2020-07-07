import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import './model/transaction.dart';
import './widgets/new_transactions.dart';
import './widgets/Chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        fontFamily: "OpenSans",
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: "Quicksand",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 20,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      amount: 69.99,
      title: "New shoes",
      date: DateTime.now().subtract(
        Duration(days: 3),
      ),
    ),
    Transaction(
      id: "t2",
      amount: 49.99,
      title: "New shirt",
      date: DateTime.now().subtract(
        Duration(days: 2),
      ),
    ),
    Transaction(
      id: "t3",
      amount: 73.99,
      title: "New Bag",
      date: DateTime.now()

    ),
    Transaction(
      id: "t4",
      amount: 9.99,
      title: "ear phones",
      date: DateTime.now().subtract(
        Duration(days: 1),
      ),
    ),
    Transaction(
      id: "t5",
      amount: 39.99,
      title: "blue jeans",
      date: DateTime.now()
    ),
    Transaction(
        id: "t5",
        amount: 16.75,
        title: "weekly Groceries",
        date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTransaction = Transaction(
        title: txTitle,
        date: txDate,
        amount: txAmount,
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_userTransactions),
            TransactionList(_userTransactions, _deleteTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
