import 'package:finance/Widgets/Elements/Interfaces/add_button.dart';
import 'package:finance/Widgets/Elements/Interfaces/choose_button.dart';
import 'package:finance/Widgets/Elements/Interfaces/page_scaffold.dart';
import 'package:flutter/widgets.dart';

abstract class Factory {
  PageScaffold getPageScaffold(Widget pageBody);
  AddButton getAddButton(
      DateTime? transactionDate,
      TextEditingController amoutController,
      TextEditingController titleController);
  ChooseButton getChooseButton(Function(DateTime?) callBack);
  CrossAxisAlignment getAddButtonPosition();
}
