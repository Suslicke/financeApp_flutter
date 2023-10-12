import 'package:finance/Widgets/Elements/add_button_widget.dart';
import 'package:finance/Widgets/Elements/choose_button_widget.dart';
import 'package:finance/Widgets/Elements/page_scaffold_widget.dart';
import 'package:flutter/material.dart';

import 'package:finance/Widgets/Elements/Interfaces/page_scaffold.dart';

import 'package:finance/Widgets/Elements/Interfaces/choose_button.dart';

import 'package:finance/Widgets/Elements/Interfaces/add_button.dart';

import '../Interfaces/abstract_factory.dart';

class AndroidFactory implements Factory {
  @override
  AddButton getAddButton(
      DateTime? transactionDate,
      TextEditingController amoutController,
      TextEditingController titleController) {
    return AndroidAddButtonWidget(
        transactionDate: transactionDate,
        amoutController: amoutController,
        titleController: titleController);
  }

  @override
  CrossAxisAlignment getAddButtonPosition() {
    return CrossAxisAlignment.end;
  }

  @override
  ChooseButton getChooseButton(Function(DateTime?) callBack) {
    return AndroidChooseButtonWidget(callBack: callBack);
  }

  @override
  PageScaffold getPageScaffold(Widget pageBody) {
    return PageAndroidScaffoldWidget(pageBody: pageBody);
  }
}
