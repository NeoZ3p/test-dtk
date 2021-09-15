class Order {
  String name, phoneNumber;

  Order(
    this.name,
    this.phoneNumber,
  );

  @override
  String toString() => "Order: {name: $name, phoneNumber: $phoneNumber}";
}
