import 'dart:ffi';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
void submitData(){
  final enteredTitle=titleController.text;
  final enteredAmount=double.parse(amountController.text);
  if(enteredTitle=="" && enteredAmount<=0){
    return;
  }
  widget.addTransaction(
      enteredTitle,
      enteredAmount);
  Navigator.of(context).pop();

}
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
            ),
            style: TextStyle(
              fontSize: 14,
            ),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Amount",
            ),
            style: TextStyle(
              fontSize: 14,
            ),
            controller: amountController,
          ),
          FlatButton(
            child: Text("Add Transaction"),
            textColor: Colors.purple,
            onPressed: submitData,

          ),
        ],
      ),
    );
  }
}
