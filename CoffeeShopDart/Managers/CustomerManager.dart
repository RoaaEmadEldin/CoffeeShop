import '../Database/CustomerDatabase.dart';
import '../Enums/CustomerType.dart';
import '../Models/Customer.dart';

class CustomerManager{
  late Customer customer;

  CustomerManager();

  bool isLogin(String name, String password){
    if (CustomerDatabase().isCustomerExist(name, password)){
      customer = CustomerDatabase().getCustomer(name, password)!;
      return true;
    }
    return false;
  }

  void signUp(String name, String password){
    customer = Customer(name: name, password: password);
    CustomerDatabase().addNewCustomer(customer);
  }
}