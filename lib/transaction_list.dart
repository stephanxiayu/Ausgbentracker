import 'package:ausgabenplaner/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Mach deinen Eintrag",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 300,
                    width: 300,
                    child: Lottie.network(
                        "https://assets5.lottiefiles.com/packages/lf20_ocib98vu.json")),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(elevation: 9,margin: EdgeInsets.symmetric(vertical: 8,horizontal:5 ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(padding: EdgeInsets.all(5),
                        
                        child: FittedBox(child: Text('${transactions[index].amount}\€'))),
                    ), title: Text(transactions[index].title,style: TextStyle(),),subtitle: Text(DateFormat.MMMd().format(transactions[index].date) ),trailing: IconButton(onPressed: (){deleteTx(transactions[index].id);},
                      icon: Icon(Icons.delete),
                    color: Colors.red,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
