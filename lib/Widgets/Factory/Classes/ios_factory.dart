import 'package:finance/Widgets/Elements/Interfaces/page_scaffold.dart';
import 'package:finance/Widgets/Elements/Interfaces/choose_button.dart';
import 'package:finance/Widgets/Elements/Interfaces/add_button.dart';
import 'package:finance/Widgets/Elements/add_button_widget.dart';
import 'package:finance/Widgets/Elements/choose_button_widget.dart';
import 'package:finance/Widgets/Elements/page_scaffold_widget.dart';
import 'package:flutter/cupertino.dart';
import '../Interfaces/abstract_factory.dart';

class IOSFactory implements Factory {
  @override
  AddButton getAddButton(
      DateTime? transactionDate,
      TextEditingController amoutController,
      TextEditingController titleController) {
    return IOSAddButtonWidget(
        transactionDate: transactionDate,
        amoutController: amoutController,
        titleController: titleController);
  }

  @override
  CrossAxisAlignment getAddButtonPosition() {
    return CrossAxisAlignment.center;
  }

  @override
  ChooseButton getChooseButton(Function(DateTime? p1) callBack) {
    return IOSChooseButtonWidget(callBack: callBack);
  }

  @override
  PageScaffold getPageScaffold(Widget pageBody) {
    return PageIOSScaffoldWidget(pageBody: pageBody);
  }
}
