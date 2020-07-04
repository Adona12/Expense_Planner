import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
            onPressed: () {
              print(titleController.text);
              print(amountController.text);
            },
          ),
        ],
      ),
    );
  }
}
