class Order {
  String name, phoneNumber;
  int total;

  Order(
    this.name,
    this.phoneNumber,
    this.total,
  );

  @override
  String toString() => "Order: {name: $name, phoneNumber: $phoneNumber}";
}
