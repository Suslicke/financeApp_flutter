
import 'package:finance/Widgets/charts_list.dart';
import 'package:finance/Widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'Widgets/Factory/Classes/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 4, 50, 201),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color.fromARGB(255, 4, 50, 201),
              secondary: Colors.amber,
            ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final pageBody = SafeArea(
        child: Column(
      children: const [
        ChartsList(),
        TransactionList(),
      ],
    ));
    return Config().getFactory!.getPageScaffold(pageBody);
  }
}
