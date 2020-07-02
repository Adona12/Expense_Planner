import 'package:flutter/material.dart';
import './transaction.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  final List<Transaction> transaction=[
    Transaction(id: "t1",amount: 69.99,title: "New shoes",date: DateTime.now()),
    Transaction(id: "t2",amount: 16.75,title: "weekly Groceries",date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter app"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height:100 ,
            width: double.infinity,
            child: Card(
              elevation: 10,
              color: Colors.blue,
              child: Text(
                "Chart",
              ),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: Card(
              color:Colors.indigo,
                child: Text(
              "List for TX",
            )),
          ),
        ],
      ),
    );
  }
}
