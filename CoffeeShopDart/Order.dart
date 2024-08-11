import 'Coffee.dart';
import 'Enums/OrderStatus.dart';

class Order{
  // int orderID;
  OrderStatus status;
  List<Coffee> orderedCoffee;
  DateTime date = DateTime.now();

  Order({required this.status, this.orderedCoffee = const []});

  int calculateTotalPrice(){
    return orderedCoffee.fold(0, (sum, coffee) => sum + coffee.price);
  }

}