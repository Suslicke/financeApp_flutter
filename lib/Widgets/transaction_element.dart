import 'dart:io';

import 'package:finance/Block/transaction_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/transaction.dart';

// ignore: must_be_immutable
class TransactionElement extends StatelessWidget {
  Transaction transaction;

  TransactionElement({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    width: 5,
                    color: Theme.of(context).primaryColor,
                  ),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "${transaction.count.toStringAsFixed(2)} ₽",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const VerticalDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Divider(
                  height: 5,
                ),
                Text(
                  transaction.dateString,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(),
            ),
            Platform.isIOS
                ? GestureDetector(
                    child: const Icon(
                      CupertinoIcons.bin_xmark,
                      color: Colors.red,
                    ),
                    onTap: () {
                      TransactionsBlock().deleteTransaction(transaction);
                    },
                  )
                : IconButton(
                    onPressed: () {
                      TransactionsBlock().deleteTransaction(transaction);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
          ]),
        ),
      ),
    );
  }
}
