import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Interfaces/choose_button.dart';

class IOSChooseButtonWidget extends ChooseButton {
  final Function(DateTime?) callBack;
  const IOSChooseButtonWidget({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    final currentContext = context;
    return CupertinoButton(
      child: const Text("Select"),
      onPressed: () {
        getDatePicker(currentContext, callBack);
      },
    );
  }

  @override
  Future getDatePicker(
      BuildContext context, Function(DateTime) callBack) async {
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 500,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                minimumDate: DateTime(1990),
                maximumDate: DateTime.now(),
                use24hFormat: true,
                onDateTimeChanged: (val) {
                  callBack(val);
                },
              ),
            ),
            CupertinoButton(
              child: Text("OK"),
              onPressed: () =>
                  Navigator.maybeOf(context)?.pop(), // TODO: Ошибка здесь
            ),
          ],
        ),
      ),
    );
  }
}

class AndroidChooseButtonWidget extends ChooseButton {
  final Function(DateTime?) callBack;
  const AndroidChooseButtonWidget({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("Select"),
      onPressed: () {
        getDatePicker(context, callBack);
      },
    );
  }

  @override
  Future getDatePicker(
      BuildContext context, Function(DateTime?) callBack) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        callBack(value);
      },
    );
  }
}
