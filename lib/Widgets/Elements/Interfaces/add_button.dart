import 'package:flutter/material.dart';

import '../../../Block/transaction_block.dart';
import '../../../Models/transaction.dart';

abstract class AddButton extends StatelessWidget {
  const AddButton({super.key});

  void onPressed(
    BuildContext context,
    DateTime? transactionDate,
    TextEditingController amoutController,
    TextEditingController titleController,
  ) {
    if (double.tryParse(amoutController.text) == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error with Money")));
    }
    TransactionsBlock().addTransaction(
      Transaction(
          name: titleController.text,
          count: double.parse(amoutController.text),
          date: transactionDate ?? DateTime.now()),
    );
    Navigator.pop(context);
  }
}
