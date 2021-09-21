import 'package:dtk_test/check_modal.dart';
import 'package:dtk_test/orders_list.dart';
import 'package:flutter/material.dart';

import 'multiselect_controller.dart';
import 'order_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  final List<Order> orders = [
    Order("Dimedrol", "1", 150),
    Order("Analgin", "2", 150),
    Order("Smth", "3", 150),
    Order("Wtf", "4", 150),
    Order("Anything", "5", 150),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MyMultiSelectController controller = MyMultiSelectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test-dtk"),
      ),
      body: OrdersList(
        controller: controller,
        orderList: widget.orders,
      ),
      floatingActionButton: controller.isSelectingMode
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    if (controller.selectedIndexes.isEmpty) {
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CheckModal(
                          initialOrders: controller.selectedIndexes
                              .map((i) => widget.orders[i])
                              .toList(),
                        ),
                      ),
                    );
                  },
                  child: const Icon(Icons.print),
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    setState(() {
                      controller.isSelectingMode = false;
                      controller.selectedIndexes.clear();
                    });
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            )
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  controller.isSelectingMode = true;
                });
              },
              child: const Icon(Icons.receipt),
            ),
    );
  }
}
