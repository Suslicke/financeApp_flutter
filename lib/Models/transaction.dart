import 'package:intl/intl.dart';

class Transaction {
  late int id;
  String name;
  double count;
  DateTime date;

  static int allID = 0;

  Transaction({required this.name, required this.count, required this.date}) {
    id = allID++;
  }

  String get dateString => DateFormat("dd.MM.yy").format(date);
}
