import 'package:flutter/material.dart';

import 'package:date_format/date_format.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            formatDate(transaction.date, [dd, ' ', MM, ' ', yyyy]),
            style: Theme.of(context).textTheme.headline5,
          ),
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '\$${transaction.amount.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ),
          trailing: MediaQuery.of(context).size.width > 360
              ? TextButton.icon(
                  onPressed: () {
                    deleteTransaction(transaction.id.toString());
                  },
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () {
                    deleteTransaction(transaction.id.toString());
                  },
                ),
        ),
      ),
    );
  }
}
