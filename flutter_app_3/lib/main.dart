import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import 'widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // colorScheme: ColorScheme,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'OpenSans',
                fontSize: 24,
                fontWeight: FontWeight.w700),
            headline5: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'OpenSans',
                fontSize: 15,
                fontWeight: FontWeight.w400),
            headline1: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 22,
                fontWeight: FontWeight.w700)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
        ),
      ),
      home: const MyHomePage(title: 'Budget App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: DateTime.now().toString(),
      amount: 90,
      title: 'Car',
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 40,
      title: 'Bar',
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 40,
      title: 'Bar',
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
  ];

  List<Transaction> get _resentTransactions {
    return _userTransaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  bool get isLandscape {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }

  get heigh {
    return MediaQuery.of(context).padding.top;
  }

  void startAddNewFunction(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return (isLandscape)
            ? Container(
                height: MediaQuery.of(context).size.height - heigh,
                child: SingleChildScrollView(
                  child: GestureDetector(
                    child: NewTransaction(
                      createTransaction: _creatTransaction,
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: GestureDetector(
                  child: NewTransaction(
                    createTransaction: _creatTransaction,
                  ),
                ),
              );
      },
    );
  }

  void _creatTransaction(String title, double amount, DateTime date) {
    setState(() {
      _userTransaction.add(
        Transaction(
          id: DateTime.now().toString(),
          amount: amount,
          title: title,
          date: date,
        ),
      );
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  bool _turnChart = false;

  List<Widget> _buildPortraitMod(MediaQueryData mediaQuery, appBar) {
    return [
      Container(
        child: Chart(_resentTransactions),
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.25,
      ),
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.75,
        child: TransactionList(
          transactions: _resentTransactions,
          deleteTransaction: _deleteTransaction,
        ),
      ),
    ];
  }

  List<Widget> _buildLandscapeMod(MediaQueryData mediaQuery, appBar) {
    return [
      _turnChart
          ? Container(
              child: Chart(_resentTransactions),
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.8,
            )
          : Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  1,
              child: TransactionList(
                transactions: _resentTransactions,
                deleteTransaction: _deleteTransaction,
              ),
            ),
    ];
  }

  PreferredSizeWidget _buildAppBar() {
    final appBar = AppBar(
      actions: [
        //landscape
        if (isLandscape)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Show chart'),
              Switch(
                  value: _turnChart,
                  onChanged: (val) {
                    setState(() {
                      _turnChart = val;
                    });
                  }),
            ],
          ),
        //portrait
        if (!isLandscape)
          IconButton(
            onPressed: () => startAddNewFunction(context),
            icon: Icon(
              Icons.add,
            ),
          )
      ],
      title: Text(
        widget.title,
        style: TextStyle(),
      ),
    );

    return appBar;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewFunction(context),
      ),
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //landscape mode
            if (isLandscape)
              ..._buildLandscapeMod(mediaQuery, _buildAppBar())
            //portrait mod
            else
              ..._buildPortraitMod(mediaQuery, _buildAppBar())
          ],
        ),
      ),
    );
  }
}
