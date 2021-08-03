import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({required this.createTransaction}) {
    print('Constructor');
  }
  final Function createTransaction;

  @override
  State<NewTransaction> createState() {
    print('crate State');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  @override
  void initState() {
    print('initState');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('$oldWidget didUpdateW');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  final textController = TextEditingController();

  final amountController = TextEditingController();

  late DateTime selectedDate = DateTime.now();
  void pressCreateTransaction() {
    final inputText = textController.text;
    final inputAmount = double.parse(amountController.text);
    final inputDate = selectedDate;

    if (inputAmount <= 0 || inputText.isEmpty) {
      print('data isnt correct');
    } else {
      widget.createTransaction(
        inputText,
        inputAmount,
        inputDate,
      );
      Navigator.pop(context);
    }
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        selectedDate = date;
      });
    });
  }
  //copyright variables

  bool get isLandscape {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    double viewIns = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      padding: EdgeInsets.only(bottom: (isLandscape) ? viewIns : viewIns + 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            onSubmitted: (_) => pressCreateTransaction(),
            controller: textController,
            decoration: InputDecoration(
              labelText: 'Title',
              icon: Icon(
                Icons.text_fields_outlined,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onSubmitted: (_) => pressCreateTransaction(),
            controller: amountController,
            decoration: InputDecoration(
              labelText: 'Amount',
              icon: Icon(
                Icons.attach_money_outlined,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isLandscape)
                  Text(
                      // selectedDate.toString() == null
                      //     ? 'No date chosen'
                      //     : formatDate(selectedDate, [yyyy, mm, dd])
                      'Your Date : ${formatDate(selectedDate, [
                        yyyy,
                        '/',
                        mm,
                        '/',
                        dd
                      ])}'),
                TextButton(
                  onPressed: () {
                    presentDatePicker();
                  },
                  child: Text(
                    'Chose date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => pressCreateTransaction(),
                child: Text('Add a transaction'),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
