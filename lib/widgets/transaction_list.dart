import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(int) deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: (transactions.isNotEmpty)
          ? ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: FittedBox(
                            child: Text(
                                "\$${transactions[index].amount?.toStringAsFixed(2)}"),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date!),
                        style: const TextStyle(
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          deleteTransaction(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 28,
                        ),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                );
              },
            )
          : SizedBox(
              height: 400,
              child: Image.asset("lib/assets/images/waiting.png"),
            ),
    );
  }
}
