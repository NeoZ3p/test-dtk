import 'package:dtk_test/orders_list.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelectedMode = false;
  List<OrderTile> selectedRows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test-dtk"),
      ),
      body: Column(
        children: [
          Expanded(
              child: OrdersList(
            isSelectedMode,
            selectedRows,
          )),
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  isSelectedMode = !isSelectedMode;
                });
              },
              child: const Icon(Icons.add_a_photo)),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
