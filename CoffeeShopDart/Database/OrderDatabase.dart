import '../Models/Order.dart';
import '../TypeDefs/TypeDefs.dart';

class OrderDatabase{
  // SINGLETON PATTERN ----------------
  static final OrderDatabase _instance = OrderDatabase._privateConstructor();
  OrderDatabase._privateConstructor();

  factory OrderDatabase(){
    return _instance;
  }

  // DATA -----------------------------
  Set<Order> orders = {};

  void addNewOrder(Order newOrder){
    orders.add(newOrder);
  }

  List<Order> filterOrders(Filter filter){
    return orders.where(filter).toList();
  }

  List<Order> sortOrders(Sort sorter){
    orders.toList().sort(sorter);
    return orders.toList();
  }
}