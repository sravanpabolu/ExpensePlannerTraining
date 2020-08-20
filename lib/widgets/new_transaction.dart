import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    //Video 92 or 93
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,

              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) => amountInput = value,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            Container(//for adding height
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('Select Date'),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.calendar_today),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
