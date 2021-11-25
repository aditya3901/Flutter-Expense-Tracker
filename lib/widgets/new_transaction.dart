import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextField(
              controller: titleController,
              onSubmitted: (val) => _submitData(),
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
            onSubmitted: (val) => _submitData(),
            // onChanged: (val) => amountInput = val,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Amount",
              hintText: "12.42",
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    (_selectedDate == null)
                        ? "No date chosen"
                        : "Picked Date : ${DateFormat.yMMMd().format(_selectedDate!)}",
                  ),
                ),
                TextButton(
                  onPressed: _openDatePicker,
                  child: Text(
                    "Choose Date",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: const Text(
              "Add Transaction",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
