import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
 DateTime _selectedDate;
  void _submittData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
  

    if (enteredTitle.isEmpty || enteredAmount <= 0 ?? true) {
    } else
      widget.addTx(titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now()).then((pickedDate) {
          if (pickedDate == null){
            return;
          }setState(() {
            _selectedDate =pickedDate;
          });
          
           


        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleController,
            onSubmitted: (_) => _submittData(),
            //    onChanged: (val)=> titleInput=val,
          ),
          TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Betrag"),
              controller: amountController,
              onSubmitted: (_) => _submittData()
              //   onChanged: (val)=> amountInput=val,
              ),
          Container(
            height: 70,
            child: Row(
              children: [
                Text(_selectedDate==null? "Kein Datum gewählt":'Gewähltes Datum  ${DateFormat.yMEd().format(_selectedDate)}'),
                TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      "Datum",
                      style: TextStyle(color: Colors.teal),
                    ))
              ],
            ),
          ),
          TextButton(
              onPressed: _submittData,
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
