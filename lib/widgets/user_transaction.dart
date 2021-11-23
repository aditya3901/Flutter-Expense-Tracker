import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction("T3", "Macbook Air", 16.32, DateTime.now()),
    Transaction("T4", "Galaxy F62", 36.78, DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final _newTx = Transaction(
      DateTime.now().toString(),
      title,
      amount,
      DateTime.now(),
    );
    setState(() {
      _userTransactions.add(_newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
