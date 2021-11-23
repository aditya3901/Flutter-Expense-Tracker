import 'package:expense_tracker/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 18),
                child: const Card(
                  child: Center(child: Text("Chart")),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
