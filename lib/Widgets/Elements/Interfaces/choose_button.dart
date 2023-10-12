import 'package:flutter/widgets.dart';

abstract class ChooseButton extends StatelessWidget {
  const ChooseButton({super.key});

  Future getDatePicker(BuildContext context, Function(DateTime?) callBack);
}
