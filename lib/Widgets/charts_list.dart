import 'package:finance/Widgets/chart_element.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../Block/transaction_block.dart';

class ChartsList extends StatefulWidget {
  const ChartsList({super.key});

  @override
  State<ChartsList> createState() => _ChartsListState();
}

class _ChartsListState extends State<ChartsList> {
  @override
  void initState() {
    initializeDateFormatting();
    TransactionsBlock().addCallBack(() {
      setState(() {});
    });
    super.initState();
  }

  List<Map<String, dynamic>> get groupedTransactionsValues =>
      List.generate(7, (index) {
        final weekDay = DateTime.now()
            .subtract(Duration(days: DateTime.now().weekday - index - 1));
        // .subtract(Duration(days: DateTime.now().weekday - index - 1));
        var totalSum = 0.0;
        for (var transaction in TransactionsBlock().transactions) {
          if (transaction.date.day == weekDay.day &&
              transaction.date.month == weekDay.month &&
              transaction.date.year == weekDay.year) {
            totalSum += transaction.count;
          }
        }

        return {
          "day": DateFormat.E("ru_RU").format(weekDay),
          "num_day": DateFormat("dd").format(weekDay),
          "amount": totalSum
        };
      });

  double get totalSpending => groupedTransactionsValues.fold(
        0.0,
        (sum, element) => sum += element["amount"],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: groupedTransactionsValues
                .map(
                  (date) => ChartElement(
                    title: date["day"] + "/" + date["num_day"],
                    count: date["amount"],
                    procentCount: totalSpending == 0
                        ? 0.0
                        : date['amount'] / totalSpending,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
