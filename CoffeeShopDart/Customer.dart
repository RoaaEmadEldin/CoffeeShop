import 'Enums/CustomerType.dart';
import 'Order.dart';

class Customer{
  List<Order> orders = [];
  CustomerType type;

  Customer({required this.type});

  void makeNewOrder(Order order){
    orders.add(order);
  }

  
}