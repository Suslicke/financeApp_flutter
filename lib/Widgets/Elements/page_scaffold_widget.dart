import 'package:finance/Widgets/Elements/Interfaces/page_scaffold.dart';
import 'package:finance/Widgets/Elements/add_transaction_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageAndroidScaffoldWidget extends PageScaffold {
  final Widget pageBody;

  const PageAndroidScaffoldWidget({
    super.key,
    required this.pageBody,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
      ),
      body: pageBody,
      floatingActionButton: AndroidAddTransactionWidget(),
    );
  }
}

class PageIOSScaffoldWidget extends PageScaffold {
  final Widget pageBody;
  const PageIOSScaffoldWidget({super.key, required this.pageBody});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: pageBody,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        middle: const Text(
          "Finance",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            IOSAddTransactionWidget(),
          ],
        ),
      ),
    );
  }
}
