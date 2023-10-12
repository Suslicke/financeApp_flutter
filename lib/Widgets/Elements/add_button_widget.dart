import 'package:finance/Widgets/Elements/Interfaces/add_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AndroidAddButtonWidget extends AddButton {
  final DateTime? transactionDate;
  final TextEditingController amoutController;
  final TextEditingController titleController;

  const AndroidAddButtonWidget(
      {super.key,
      required this.transactionDate,
      required this.amoutController,
      required this.titleController});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        super.onPressed(
            context, transactionDate, amoutController, titleController);
      },
      child: const Text("Add"),
    );
  }
}

class IOSAddButtonWidget extends AddButton {
  final DateTime? transactionDate;
  final TextEditingController amoutController;
  final TextEditingController titleController;

  const IOSAddButtonWidget(
      {super.key,
      required this.transactionDate,
      required this.amoutController,
      required this.titleController});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        super.onPressed(
            context, transactionDate, amoutController, titleController);
      },
      child: const Text("Add"),
    );
  }
}
