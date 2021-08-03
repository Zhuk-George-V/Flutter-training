import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {Key? key, this.transactions, required this.deleteTransaction})
      : super(key: key);
  final transactions;
  final Function deleteTransaction;
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) => Center(
              child: Column(
                children: [
                  Text(
                    'There is no info',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  deleteTransaction: deleteTransaction);
            },
          );
  }
}
