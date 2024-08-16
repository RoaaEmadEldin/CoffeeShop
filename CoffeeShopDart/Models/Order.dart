import 'Coffee/Coffee.dart';
import '../Enums/OrderStatus.dart';

class Order{
  static int _idCounter = 1;
  int customerID;
  int orderID;
  OrderStatus status;
  List<Coffee> orderedCoffee;
  DateTime date = DateTime.now();
  double totalPrice = 0.0;

  // Default Constructor ------------------------------------------
  Order({required this.customerID, required this.status, List<Coffee>? orderedCoffee})
  : this.orderedCoffee = orderedCoffee ?? [],
    this.orderID = _idCounter++;


  // toString -----------------------------------------------------
  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.write('------ Order Details ------\n');
    buffer.write('Order Status: ${status.name}\n');
    buffer.write('Ordered Coffee: ');
    for(Coffee coffee in orderedCoffee){
      buffer.write(coffee);
    }
    buffer.write('\nTotal Price: \$$totalPrice\n');
    buffer.write('---------------------------');
    return buffer.toString();
  }
}