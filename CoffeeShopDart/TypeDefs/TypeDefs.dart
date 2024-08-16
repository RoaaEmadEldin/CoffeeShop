import '../Models/Coffee/CoffeeBuilder.dart';
import '../Enums/CustomerType.dart';
import '../Models/Order.dart';

typedef Customizer = void Function(CoffeeBuilder);

typedef CustomerCategorize = CustomerType Function(double totalSpent);

typedef Filter = bool Function(Order order);

typedef Sort = int Function(Order order1, Order order2);