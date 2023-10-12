import 'package:finance/Models/transaction.dart';

class TransactionsBlock {
  static TransactionsBlock? _instance;

  TransactionsBlock._internal();

  factory TransactionsBlock() {
    _instance ??= TransactionsBlock._internal();
    return _instance!;
  }

  final List<Transaction> _transactions = [
    Transaction(name: "Кроссовки", count: 1000, date: DateTime(2023, 2, 24)),
    Transaction(name: "Абибас штаны", count: 500, date: DateTime(2023, 2, 23)),
    Transaction(name: "Гуси шапка", count: 1000, date: DateTime(2023, 2, 21)),
  ];

  final List<Function> _callBacks = [];

  List<Transaction> get transactions => _transactions;
  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    for (var element in _callBacks) {
      element();
    }
  }

  bool deleteTransaction(Transaction transaction) {
    bool result = transactions.remove(transaction);
    for (var element in _callBacks) {
      element();
    }
    return result;
  }

  void addCallBack(Function callback) => _callBacks.add(callback);
  bool deleteCallBack(Function callback) => _callBacks.remove(callback);
}
