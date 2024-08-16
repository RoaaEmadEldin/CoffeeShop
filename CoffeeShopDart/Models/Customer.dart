import '../Enums/CustomerType.dart';

class Customer{
  static int _idCounter = 1;
  int id;
  String name;
  String password;
  CustomerType type;
  double totalSpent;

  // Default Constructor ------------------------------------
  Customer({required this.name, required this.password, this.type = CustomerType.New, this.totalSpent = 0})
      : this.id = _idCounter++;

  // toString -----------------------------------------------
  @override
  String toString() {
    return 'Customer Name: $name\nCustomer ID: $id\nCustomer Type: $type';
  }
}