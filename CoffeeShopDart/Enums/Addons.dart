enum Addon{

  Coffee(price: 20.0),
  Sugar(price: 5.0),
  Milk(price: 10.0),
  WhippedCream(price: 10.0),
  Chocolate(price: 15.0),
  Caramel(price: 15.0),
  Ice(price: 5.0);

  const Addon({required this.price});
  final double price;

  @override
  String toString() {
    String stringName = (this == Addon.Coffee) ? "Extra Coffee" : "${this.name}";
    return stringName;
  }

}