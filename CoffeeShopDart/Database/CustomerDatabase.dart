import '../Models/Customer.dart';
import '../Enums/CustomerType.dart';
import '../TypeDefs/TypeDefs.dart';

class CustomerDatabase {
  // SINGLETON PATTERN ------------------------------
  static final CustomerDatabase _instance = CustomerDatabase._privateConstructor();
  CustomerDatabase._privateConstructor();

  factory CustomerDatabase() {
    return _instance;
  }

  // DATA -------------------------------------------
  Set<Customer> customers = {};

  CustomerCategorize categorize = ((totalSpent) {
    if (totalSpent == 0.0)
      return CustomerType.New;
    else if (totalSpent < 250.0)
      return CustomerType.Regular;
    else
      return CustomerType.VIP;
  });

  void addNewCustomer(Customer customer) {
    customers.add(customer);
  }

  Set<Customer> categorizeCustomer(double totalSpent) {
    return customers.where((customer) =>
    customer.type == categorize(totalSpent)).toSet();
  }

  bool isCustomerExist(String name, String password){
    for(Customer customer in customers){
      if (customer.name == name && customer.password == password){
        return true;
      }
    }
    return false;
  }

  Customer? getCustomer(String name, String password){
    for(Customer customer in customers){
      if (customer.name == name && customer.password == password){
        return customer;
      }
    }
    return null;
  }

}