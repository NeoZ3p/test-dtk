import 'package:flutter/material.dart';

import 'order_tile.dart';

class OrdersList extends StatefulWidget {
  bool isSelectedMode;
  List<Map<String, dynamic>> selectedRows;
  List<Map<String, dynamic>> orderList;

  OrdersList(this.isSelectedMode, this.selectedRows, this.orderList, {Key? key})
      : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OrderItem(
        widget.orderList[index]["order"].name,
        widget.orderList[index]["order"].phoneNumber,
        widget.orderList[index]["isSelected"],
        widget.orderList[index]["order"].total,
        index,
      ),
      itemCount: widget.orderList.length,
    );
  }

  Widget OrderItem(
      String name, String phoneNumber, bool isSelected, int total, int index) {
    return ListTile(
      onTap: () {
        widget.isSelectedMode
            ? setState(() {
                widget.orderList[index]["isSelected"] =
                    !widget.orderList[index]["isSelected"];
                if (widget.orderList[index]["isSelected"]) {
                  widget.selectedRows.add({
                    "isSelected": true,
                    "order": Order(
                      name,
                      phoneNumber,
                      total,
                    ),
                  });
                } else if (!widget.orderList[index]["isSelected"]) {
                  widget.selectedRows.removeWhere((element) =>
                      element["order"].name ==
                      widget.orderList[index]["order"].name);
                }
              })
            : null;
        print('-----');
        widget.orderList.forEach((e) => print('\n$e'));
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
