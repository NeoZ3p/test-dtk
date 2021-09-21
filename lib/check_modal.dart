import 'package:dtk_test/main.dart';
import 'package:flutter/material.dart';

import 'order_tile.dart';

class CheckModal extends StatefulWidget {
  const CheckModal({required this.initialOrders, Key? key}) : super(key: key);

  final List<Order> initialOrders;

  @override
  State<CheckModal> createState() => _CheckModalState();
}

class _CheckModalState extends State<CheckModal> {
  late List<Order> ordersToPrint;
  late int totalSum;

  @override
  void initState() {
    ordersToPrint = widget.initialOrders;
    totalSum = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creating a check"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: Text(ordersToPrint[index].name),
                subtitle: Wrap(children: [
                  Text(ordersToPrint[index].phoneNumber),
                  const SizedBox(width: 100),
                  Text("Total: ${ordersToPrint[index].total}"),
                ]),
                trailing: Wrap(
                  children: [
                    const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        // setState(() {
                        //Todo: реализовать метод удаления
                        //   ordersToPrint
                        //       .removeWhere((order) => ordersToPrint[index] == ...);
                        // });
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 24.0,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: ordersToPrint.length,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Total: ${ordersToPrint.map((order) => order.total).reduce((value, element) => value + element).toString()}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Center(
              child: TextButton(
                  onPressed: () {},
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Text(
                        "Add a check",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Icon(
                        Icons.add,
                        size: 70,
                        color: Colors.black,
                      ),
                    ],
                  )),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: const Text("You created a check"),
                        title: const Text("Nice"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MyHomePage()));
                            },
                            child: const Text("Okey"),
                          )
                        ],
                      ));
            },
            child: const Text("Create a check"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
