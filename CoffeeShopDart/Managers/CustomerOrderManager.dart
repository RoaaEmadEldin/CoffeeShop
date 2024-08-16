import '../Database/CustomerDatabase.dart';
import '../Database/OrderDatabase.dart';
import '../Models/Coffee/Coffee.dart';
import '../Models/Customer.dart';
import '../TypeDefs/TypeDefs.dart';
import 'CustomerManager.dart';
import '../Models/Order.dart';
import 'OrderManager.dart';

class CustomerOrderManager{
  // final OrderDatabase orderDatabase = OrderDatabase();
  // final CustomerDatabase customerDatabase = CustomerDatabase();
  
  
  CustomerManager customerManager;
  late OrderManager orderManager;

  
  CustomerOrderManager(this.customerManager);

  List<Order> getCustomerOrders(Customer customer){
    return OrderDatabase().filterOrders((order) => customer.id == order.customerID);
  }

  void createOrder(Order order){
    orderManager = OrderManager(order);

  }

  void saveNewOrder(Order order){
    OrderDatabase().addNewOrder(order);
    int customerID = order.customerID;
    CustomerDatabase().customers.forEach((customer) {
      if (customer.id == customerID) {
        customer.totalSpent += order.totalPrice;
        customer.type = CustomerDatabase().categorize(customer.totalSpent);
      }
    });
  }

  void customizeOrder(Coffee coffee, Customizer customizer){
    orderManager.customizeOrder(coffee, customizer);
  }
}