import 'package:flutter/material.dart';

import 'order_tile.dart';

class OrdersList extends StatefulWidget {
  bool isSelectedMode;
  List<Map<String, dynamic>> selectedRows;

  OrdersList(this.isSelectedMode, this.selectedRows, {Key? key})
      : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  List<Map<String, dynamic>> orders = [
    {
      "isSelected": false,
      "order": Order("A", "1"),
    },
    {
      "isSelected": false,
      "order": Order("B", "2"),
    },
    {
      "isSelected": false,
      "order": Order("C", "3"),
    },
    {
      "isSelected": false,
      "order": Order("D", "4"),
    },
    {
      "isSelected": false,
      "order": Order("E", "5"),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OrderItem(
        orders[index]["order"].name,
        orders[index]["order"].phoneNumber,
        orders[index]["isSelected"],
        index,
      ),
      itemCount: orders.length,
    );
  }

  Widget OrderItem(
      String name, String phoneNumber, bool isSelected, int index) {
    return ListTile(
      onTap: () {
        widget.isSelectedMode
            ? setState(() {
                orders[index]["isSelected"] = !orders[index]["isSelected"];
                if (orders[index]["isSelected"]) {
                  widget.selectedRows.add({
                    "isSelected": true,
                    "order": Order(
                      name,
                      phoneNumber,
                    ),
                  });
                } else if (!orders[index]["isSelected"]) {
                  widget.selectedRows.removeWhere((element) =>
                      element["order"].name == orders[index]["order"].name);
                }
              })
            : null;
        print('-----');
        orders.forEach((e) => print('\n$e'));
      },
      leading: widget.isSelectedMode
          ? isSelected
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.circle_outlined)
          : null,
      title: Text(name),
      subtitle: Text(phoneNumber),
      trailing: const CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }
}
