import 'package:dtk_test/orders_list.dart';
import 'package:flutter/material.dart';

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
              child: const Text("Save"),
            ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isSelectedMode = !isSelectedMode;
          });
        },
        child: Icon(isSelectedMode ? Icons.cancel : Icons.add),
      ),
    );
  }
}
