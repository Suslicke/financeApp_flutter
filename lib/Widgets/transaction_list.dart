import 'package:finance/Block/transaction_block.dart';
import 'package:finance/Widgets/transaction_element.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  late Function callback;
  @override
  void initState() {
    callback = () {
      setState(() {});
    };
    TransactionsBlock().addCallBack(callback);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // child: ListView(
        //   shrinkWrap: true,
        //   children: Transaction.getMock()
        //       .map((transaction) => TransactionElement(transaction: transaction))
        //       .toList(),
        // ),
        Expanded(
      child: ListView.builder(
        itemBuilder: (context, position) {
          return TransactionElement(
              transaction: TransactionsBlock().transactions[position]);
        },
        itemCount: TransactionsBlock().transactions.length,
      ),
    );
  }

  @override
  void dispose() {
    TransactionsBlock().deleteCallBack(callback);
    super.dispose();
  }
}
