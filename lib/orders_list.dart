import 'package:flutter/material.dart';

import 'multiselect_controller.dart';
import 'order_tile.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({
    required this.controller,
    required this.orderList,
    Key? key,
  }) : super(key: key);

  final List<Order> orderList;
  final MyMultiSelectController controller;

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OrderItem(
        isSelectingMode: widget.controller.isSelectingMode,
        name: widget.orderList[index].name,
        phoneNumber: widget.orderList[index].phoneNumber,
        total: widget.orderList[index].total,
        index: index,
        isSelected: widget.controller.isSelected(index),
        onTap: () {
          if (widget.controller.isSelectingMode) {
            setState(() {
              widget.controller.toggle(index);
            });
          }
        },
      ),
      itemCount: widget.orderList.length,
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem(
      {required this.isSelectingMode,
      required this.name,
      required this.phoneNumber,
      required this.total,
      required this.index,
      required this.onTap,
      required this.isSelected,
      Key? key})
      : super(key: key);

  final String name, phoneNumber;
  final int total, index;
  final bool isSelectingMode;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: isSelectingMode
          ? isSelected
              ? const Icon(Icons.check_circle, color: Colors.blue)
              : const Icon(
                  Icons.circle_outlined,
                  color: Colors.blue,
                )
          : null,
      selected: isSelectingMode && isSelected,
      title: Text(name),
      subtitle: Text(phoneNumber),
      trailing: const CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }
}
