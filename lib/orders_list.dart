import 'package:flutter/material.dart';

import 'order_tile.dart';

class OrdersList extends StatefulWidget {
  bool isSelectedMode;
  List<OrderTile> selectedRows;

  OrdersList(this.isSelectedMode, this.selectedRows, {Key? key})
      : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  List<OrderTile> orders = [
    OrderTile("OrderName", "79145431323", false),
    OrderTile("OrderName", "79145431323", false),
    OrderTile("OrderName", "79145431323", false),
    OrderTile("OrderName", "79145431323", false),
    OrderTile("OrderName", "79145431323", false),
    OrderTile("OrderName", "79145431323", false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OrderItem(
        orders[index].name,
        orders[index].phoneNumber,
        orders[index].isSelected,
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
                orders[index].isSelected = !orders[index].isSelected;
                if (orders[index].isSelected) {
                  widget.selectedRows.add(OrderTile(name, phoneNumber, true));
                } else if (!orders[index].isSelected) {
                  widget.selectedRows.removeWhere(
                      (element) => element.name == orders[index].name);
                }
              })
            : null;
      },
      leading: widget.isSelectedMode
          ? isSelected
              ? const Icon(Icons.check_circle)
              : const Icon(Icons.check_circle_outline)
          : null,
      title: Text(name),
      subtitle: Text(phoneNumber),
      trailing: const CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }
}
