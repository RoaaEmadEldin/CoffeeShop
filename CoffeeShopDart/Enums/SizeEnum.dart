enum Size {
  Small(price: 10.0),
  Medium(price: 15.0),
  Large(price: 20.0);

  final double price;
  const Size({required this.price});

  @override
  String toString() {
    return this.name;
  }
}