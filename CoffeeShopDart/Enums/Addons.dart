enum Addon{
  
  coffee(price: 20),
  sugar(price: 5),
  milk(price: 10),
  caramel(price: 15);

  const Addon({required this.price});
  final int price;

}