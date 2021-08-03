import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  Chart(this.resentTransactions);

  final List<Transaction> resentTransactions;

  List<Map<String, dynamic>> get grupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double amountSum = 0;

      for (int i = 0; i < resentTransactions.length; i++) {
        if (resentTransactions.isEmpty) {
        } else if (resentTransactions[i].date.day == weekDay.day &&
            resentTransactions[i].date.year == weekDay.year &&
            resentTransactions[i].date.month == weekDay.month) {
          amountSum += resentTransactions[i].amount;
        }
      }

      return {
        'day': formatDate(weekDay, [D]).substring(0, 1),
        'amount': amountSum,
      };
    }).reversed.toList();
  }

  double get totalAmount {
    return grupedTransactions.fold(0.0, (sum, element) {
      return sum + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ...grupedTransactions.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  e['amount'],
                  e['day'],
                  totalAmount == 0.0
                      ? 0.0
                      : (e['amount'] as double) / totalAmount),
            );
          }).toList(),
        ]),
      ),
    );
  }
}
