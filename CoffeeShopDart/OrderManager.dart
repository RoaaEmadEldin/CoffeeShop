import 'Order.dart';

typedef Filter = bool Function(Order order);
typedef Sort = int Function(Order order1, Order order2);


class OrderManager{
  List<Order> orders = [];

  void addNewOrder(Order newOrder){
    orders.add(newOrder);
  }

  List<Order> filterOrders(Filter filter){
    return orders.where(filter).toList();
  }

  List<Order> sortOrders(Sort sorter){
    orders.sort(sorter);
    return orders;
  }

}