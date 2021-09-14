class OrderTile {
  String name, phoneNumber;
  bool isSelected;

  OrderTile(
    this.name,
    this.phoneNumber,
    this.isSelected,
  );

  @override
  String toString() =>
      "OrderTile: {name: $name, phoneNumber: $phoneNumber, isSelected: $isSelected}";
}
