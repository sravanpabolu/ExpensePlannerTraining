import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  //Declare a transactions parameter, for passing the transactions.
  final List<Transaction> transactions;
  final Function deleteTx; //step3 - to pass pointer - add function
  //A constructor too
  TransactionList(this.transactions,
      this.deleteTx); //step 4 - to pass pointer - change constructor

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  "No transactions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                //For empty space
                SizedBox(
                  height: 10,
                ),
                //container for resizing and fitting the image
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                transaction: transactions[index],
                deleteTx: deleteTx,
              );
            },
            itemCount: transactions.length,
          );
  }
}
