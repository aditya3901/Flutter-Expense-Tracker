import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date!.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final _newTx = Transaction(
      DateTime.now().toString(),
      title,
      amount,
      date,
    );
    setState(() {
      _userTransactions.add(_newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(int deleteIndex) {
    setState(() {
      _userTransactions.removeAt(deleteIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'OpenSans',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'OpenSans',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expense Tracker",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: const Icon(Icons.add),
              );
            }),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Chart(_recentTransactions),
              TransactionList(_userTransactions, _deleteTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () => _startAddNewTransaction(context),
            child: const Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
