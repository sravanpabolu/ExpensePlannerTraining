import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
    Transaction(
      id: 't4',
      title: "Groceries 4",
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: "New Shoes 5",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: "Groceries 6",
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: "New Shoes 7",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't8',
      title: "Groceries 8",
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't9',
      title: "New Shoes 9",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't10',
      title: "Groceries 10",
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

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
    return Column(children: <Widget>[
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransations),
    ]);
  }
}
