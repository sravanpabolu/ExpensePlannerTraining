import 'package:ExpensePlannerTraining/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {

  //to get recent transactions list
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  //list data for 7 days
  List<Map<String, Object>> get groupedTransactionValues {
    //should return list
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
        );
      var totalSum=0.0;

      for(int i=0; i<recentTransactions.length; i++) {
        if(recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year
        ) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      //should return map
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum
        };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[

        ],
      ),
    );
  }
}