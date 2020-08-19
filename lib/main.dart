import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransations = [
    Transaction(
      id: 't1',
      title: "New Shoes 1",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: "Groceries 2",
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: "New Shoes 3",
      amount: 69.99,
      date: DateTime.now(),
    ),
    // Transaction(
    //   id: 't4',
    //   title: "Groceries 4",
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't5',
    //   title: "New Shoes 5",
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't6',
    //   title: "Groceries 6",
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't7',
    //   title: "New Shoes 7",
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't8',
    //   title: "Groceries 8",
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't9',
    //   title: "New Shoes 9",
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't10',
    //   title: "Groceries 10",
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransations.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Container(
                  child: Text(
                    "Chart!",
                    // textAlign: TextAlign.center,
                  ),
                ),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransations),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
