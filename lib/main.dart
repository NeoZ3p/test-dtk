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
  List<Map<String, dynamic>> selectedRows = [];
  List<Map<String, dynamic>> orders = [
    {
      "isSelected": false,
      "order": Order("Dimedrol", "1", 150),
    },
    {
      "isSelected": false,
      "order": Order("Analgin", "2", 150),
    },
    {
      "isSelected": false,
      "order": Order("Smth", "3", 150),
    },
    {
      "isSelected": false,
      "order": Order("Wtf", "4", 150),
    },
    {
      "isSelected": false,
      "order": Order("Anything", "5", 150),
    },
  ];

  get getTotal {
    num counter = 0;
    for (var order in orders) {
      counter += order["order"].total;
    }
    return counter;
  }

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
              orders,
            ),
          ),
          if (isSelectedMode)
            OutlinedButton(
              onPressed: () {
                selectedRows.isNotEmpty
                    ? print(selectedRows)
                    : showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                                title: const Text("Error"),
                                content: const Text("Select at least 1 order"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Okey"))
                                ]));
              },
              child: const Text("Start create check"),
            ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
      floatingActionButton: isSelectedMode
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    if (selectedRows.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          title: const Text("Creating a check"),
                          content: Builder(
                            builder: (context) {
                              // ignore: sized_box_for_whitespace
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (context, index) =>
                                            ListTile(
                                          leading: Text(selectedRows[index]
                                                  ["order"]
                                              .name),
                                          subtitle: Text(selectedRows[index]
                                                  ["order"]
                                              .phoneNumber),
                                          trailing: const CircleAvatar(
                                            child: Icon(Icons.person),
                                          ),
                                        ),
                                        itemCount: selectedRows.length,
                                      ),
                                    ),
                                    // Text(
                                    //   selectedRows
                                    //       .reduce((prevOrder, nextOrder) =>
                                    //           prevOrder["order"].total +
                                    //           nextOrder["order"].total)
                                    //       .toString(),
                                    // ),
                                  ],
                                ),
                              );
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Create a check"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Icon(Icons.receipt),
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    setState(() {
                      isSelectedMode = false;
                    });
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            )
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  isSelectedMode = true;
                });
              },
              child: const Icon(Icons.add),
            ),
    );
  }
}
