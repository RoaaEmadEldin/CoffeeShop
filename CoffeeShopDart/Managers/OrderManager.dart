import '../Models/Coffee/Coffee.dart';
import 'CoffeeManager.dart';
import '../Models/Order.dart';
import '../TypeDefs/TypeDefs.dart';


class OrderManager{
  Order order;

  // Default Constructor --------------------------
  OrderManager(this.order);

  // Adding New Coffee to the Order ---------------
  void addCoffee(Coffee coffee){
    order.orderedCoffee.add(coffee);
    order.totalPrice += coffee.price;
  }

  // Calculating the Order's Total Price ----------
  double calculateOrderTotalPrice(){
    order.totalPrice = order.orderedCoffee.fold(0, (sum, coffee) => sum + coffee.price);
    return order.totalPrice;
  }

  // Customizing Order ----------------------------
  void customizeOrder(Coffee oldCoffee, Customizer customizer){
    Coffee customizedCoffee = CoffeeManager(oldCoffee).customizeCoffee(customizer);
    updateOrder(oldCoffee: oldCoffee, newCoffee: customizedCoffee);
  }

  // Updating Order After Customization -----------
  void updateOrder({required Coffee oldCoffee, required Coffee newCoffee}){
    int index = order.orderedCoffee.indexOf(oldCoffee);
    if (index != -1) {
      order.orderedCoffee[index] = newCoffee;
    }
    calculateOrderTotalPrice();
  }
}