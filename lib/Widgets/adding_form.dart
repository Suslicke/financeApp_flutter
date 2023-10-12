import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Factory/Classes/config.dart';

class AddingForm extends StatefulWidget {
  const AddingForm({super.key});

  @override
  State<AddingForm> createState() => _AddingFormState();
}

class _AddingFormState extends State<AddingForm> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amoutController = TextEditingController();

  DateTime? transactionDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
        ),
        child: Column(
          crossAxisAlignment: Config().getFactory!.getAddButtonPosition(),
          children: [
            TextField(
              decoration: const InputDecoration(
                // hintText: "Name of Transaction",
                labelText: "Transaction",
              ),
              controller: _titleController,
            ),
            const Divider(color: Colors.transparent),
            TextField(
              decoration: const InputDecoration(
                // hintText: "Amount of Money",
                labelText: "Money",
              ),
              controller: _amoutController,
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            const Divider(color: Colors.transparent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Выбранная дата транзацкии"),
                transactionDate == null
                    ? Config().getFactory!.getChooseButton(
                        (dateTime) {
                          setState(() {
                            transactionDate = dateTime;
                          });
                        },
                      )
                    : Text(
                        DateFormat("dd.MM.yy").format(transactionDate!),
                      ),
              ],
            ),
            // : Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text("Выбранная дата транзацкии"),
            //       transactionDate == null
            //           ? TextButton(
            //               child: const Text("Select"),
            //               onPressed: () {
            //                 showDatePicker(
            //                   context: context,
            //                   initialDate: DateTime.now(),
            //                   firstDate: DateTime(1900),
            //                   lastDate: DateTime.now(),
            //                 ).then(
            //                   (value) {
            //                     setState(() {
            //                       transactionDate = value;
            //                     });
            //                   },
            //                 );
            //               },
            //             )
            //           : Text(
            //               DateFormat("dd.MM.yy").format(transactionDate!),
            //             ),
            //     ],
            //   ),
            const Divider(color: Colors.transparent),
            Config().getFactory!.getAddButton(
                  transactionDate,
                  _amoutController,
                  _titleController,
                ),
            // Platform.isIOS
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           Container(
            //             margin: const EdgeInsets.symmetric(horizontal: 20),
            //             child: CupertinoButton(
            //               color: Colors.red,
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               },
            //               child: const Text("Close"),
            //             ),
            //           ),
            //           CupertinoButton(
            //             color: Theme.of(context).primaryColor,
            //             onPressed: () {
            //               if (double.tryParse(_amoutController.text) == null) {
            //                 ScaffoldMessenger.of(context).showSnackBar(
            //                     const SnackBar(
            //                         content: Text("Error with Money")));
            //               }
            //               TransactionsBlock().addTransaction(
            //                 Transaction(
            //                     name: _titleController.text,
            //                     count: double.parse(_amoutController.text),
            //                     date: transactionDate ?? DateTime.now()),
            //               );
            //               Navigator.pop(context);
            //             },
            //             child: const Text("Add"),
            //           ),
            //         ],
            //       )
            //     : Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           Container(
            //             margin: const EdgeInsets.symmetric(horizontal: 20),
            //             child: ElevatedButton(
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               },
            //               child: const Text("Close"),
            //             ),
            //           ),
            //           ElevatedButton(
            //             onPressed: () {
            //               if (double.tryParse(_amoutController.text) == null) {
            //                 ScaffoldMessenger.of(context).showSnackBar(
            //                     const SnackBar(
            //                         content: Text("Error with Money")));
            //               }
            //               TransactionsBlock().addTransaction(
            //                 Transaction(
            //                     name: _titleController.text,
            //                     count: double.parse(_amoutController.text),
            //                     date: transactionDate ?? DateTime.now()),
            //               );
            //               Navigator.pop(context);
            //             },
            //             child: const Text("Add"),
            //           ),
            //         ],
            //       ),
          ],
        ),
      ),
    );
  }
}
