import 'Database/CustomerDatabase.dart';
import 'Database/Menu.dart';
import 'Database/OrderDatabase.dart';
import 'Managers/CustomerManager.dart';
import 'Managers/CustomerOrderManager.dart';
import 'Models/Coffee/Coffee.dart';
import 'Models/Customer.dart';
import 'Enums/Addons.dart';
import 'Enums/OrderStatus.dart';
import 'Enums/SizeEnum.dart';
import 'Models/Order.dart';
import 'dart:io';

void main(){
  OrderDatabase();
  CustomerDatabase();

  print("------ Welcome To Our Coffee Shop ------");
  print("1. Login\n2. Sign Up");
  print("Your Choice: ");
  String choice = stdin.readLineSync()!;

  print("Enter Your Username: ");
  String name = stdin.readLineSync()!;
  print("Enter Your Password: ");
  String password = stdin.readLineSync()!;

  CustomerManager customerManager = CustomerManager();
  CustomerOrderManager manager = CustomerOrderManager(customerManager);

  bool accessEnabled = false;
  switch(choice){
    case ('1'):
      {
        if (!customerManager.isLogin(name, password)) {
          print("There is No User with such Credentials!");
        }
        else accessEnabled = true;
        break;
      }
    case ('2'):
      {
        customerManager.signUp(name, password);
        accessEnabled = true;
        break;
      }
  }

  if(accessEnabled){
    Customer customer = CustomerDatabase().getCustomer(name, password)!;
    bool continueShopping = true;
    while(continueShopping) {
      Menu().viewHomeMenu();
      choice = stdin.readLineSync()!;
      switch (choice) {
        case ('1'):
          {
            manager.createOrder(
                Order(customerID: customer.id, status: OrderStatus.Pending));
            bool showMenu = true;
            while (showMenu) {
              Menu().viewCoffeeMenu();
              print("Choose Your Coffee: ");
              String coffeeChoice = stdin.readLineSync()!;
              String coffeeName = "";
              switch (coffeeChoice) {
                case('0'):
                  showMenu = false;
                  break;
                case('1'):
                  coffeeName = "Iced Coffee";
                  break;
                case('2'):
                  coffeeName = "Espresso";
                  break;
                case('3'):
                  coffeeName = "Latte";
                  break;
              }
              if (showMenu) {
                Menu().viewCoffeeSizeChoices();
                print("Choose Your Coffee Size: ");
                coffeeChoice = stdin.readLineSync()!;
                Size coffeeSize = Size.Small;
                switch (coffeeChoice) {
                  case('1'):
                    coffeeSize = Size.Small;
                    break;
                  case('2'):
                    coffeeSize = Size.Medium;
                    break;
                  case('3'):
                    coffeeSize = Size.Large;
                    break;
                }
                Coffee coffee = Coffee.CoffeeFactory(coffeeName, coffeeSize);
                manager.orderManager.addCoffee(coffee);

                Menu().viewCustomizingChoice();
                String customChoice = stdin.readLineSync()!;
                switch (customChoice) {
                  case('1'):
                    {
                      Menu().viewAddonsMenu();
                      print("Choose Your Desired Addon: ");
                      Set<Addon> addons = {};
                      bool showMenu = true;
                      while (showMenu) {
                        stdout.write('=> ');
                        String addonNum = stdin.readLineSync()!;
                        switch (addonNum) {
                          case('0'):
                            {
                              manager.orderManager.order.status = OrderStatus.Completed;
                              showMenu = false;
                              break;
                            }
                          case('1'):
                            addons.add(Addon.Caramel);
                            break;
                          case('2'):
                            addons.add(Addon.WhippedCream);
                            break;
                          case('3'):
                            addons.add(Addon.Coffee);
                            break;
                          case('4'):
                            addons.add(Addon.Sugar);
                            break;
                          case('5'):
                            addons.add(Addon.Chocolate);
                            break;
                          case('6'):
                            addons.add(Addon.Ice);
                            break;
                          case('7'):
                            addons.add(Addon.Milk);
                            break;
                        }
                      }
                      manager.customizeOrder(coffee, (builder) {
                        builder.addAddons(addons);
                      });
                      break;
                    }
                  case('2'):
                    break;
                }
                Order order = manager.orderManager.order;
                manager.saveNewOrder(order);
                print(order);
              }
            }
          }
        case('2'):
          {
            List<Order> orders = manager.getCustomerOrders(customer);
            orders.forEach(print);
            bool showMenu = true;
            while (showMenu) {
              Menu().viewingOrderMenu();
              print("Your Choice: ");
              String menuChoice = stdin.readLineSync()!;
              switch (menuChoice) {
                case('0'):
                  showMenu = false;
                  break;
                case('1'):
                  {
                    print(
                        "Enter the Order Status to Search for: P(Pending), C(Completed): ");
                    String status = stdin.readLineSync()!;
                    OrderStatus orderStatus = OrderStatus.Pending;
                    if (status == 'C') orderStatus = OrderStatus.Completed;
                    List<Order> orders = OrderDatabase().filterOrders((order) =>
                    order.status == orderStatus &&
                        order.customerID == customer.id
                    );
                    orders.forEach(print);
                    break;
                  }
                case('2'):
                  {
                    print("Enter the Price Limit to Search for: ");
                    String priceInput = stdin.readLineSync()!;
                    double price = double.parse(priceInput);
                    List<Order> orders = OrderDatabase().filterOrders((order) =>
                    order.totalPrice <= price && order.customerID == customer.id
                    );
                    orders.forEach(print);
                    break;
                  }
                case('3'):
                  {
                    print(
                        "Enter the Type of Coffee to Search for: L(Latte), E(Espresso), I(Iced Coffee):");
                    String type = stdin.readLineSync()!;
                    String coffeeType = "Latte";
                    if (type == 'E')
                      coffeeType = "Espresso";
                    else if (type == 'I') coffeeType = "Iced Coffee";
                    List<Order> orders = OrderDatabase().filterOrders((order) {
                      return order.orderedCoffee.any((coffee) =>
                      coffee.name == coffeeType)
                          && order.customerID == customer.id;
                    });
                    orders.forEach(print);
                    break;
                  }
                case('4'):
                  {
                    List<Order> orders = OrderDatabase().sortOrders((order1,
                        order2) => order1.date.compareTo(order2.date));
                    orders.forEach(print);
                    break;
                  }
                case('5'):
                  {
                    List<Order> orders = OrderDatabase().sortOrders((order1,
                        order2) =>
                        order1.totalPrice.compareTo(order2.totalPrice));
                    orders.forEach(print);
                    break;
                  }
              }
            }
          }
        case('3'):
            continueShopping = false;
            break;
      }
    }

  }
}
