import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: TextField(
                controller: titleController,
                onSubmitted: (val) => submitData(),
                // onChanged: (val) => titleInput = val,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                  hintText: "Macbook Air M1",
                ),
              ),
            ),
            TextField(
              controller: amountController,
              onSubmitted: (val) => submitData(),
              // onChanged: (val) => amountInput = val,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Amount",
                hintText: "12.42",
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
