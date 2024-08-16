import '../Enums/Addons.dart';

class Menu{
  static Set<String> coffee = {"Iced Coffee", "Espresso", "Latte"};
  static Set<Addon> addons = {Addon.Caramel, Addon.WhippedCream, Addon.Coffee, Addon.Sugar, Addon.Chocolate, Addon.Ice, Addon.Milk};

  void viewCoffeeMenu(){
    print("------- Coffee Menu -------");
    int counter = 1;
    coffee.forEach((coffee){
      print('$counter. $coffee');
      counter++;
    });
    print("0. Back");
    print("---------------------------");
  }

  void viewAddonsMenu(){
    print("------- Addons Menu -------");
    int counter = 1;
    addons.forEach((addon){
      print('$counter. $addon');
      counter++;
    });
    print("0.Exit");
    print("---------------------------");
  }

  void viewHomeMenu(){
    print("------- Home Menu -------");
    print("1. Place New Order");
    print("2. View My Orders");
    print("3. Exit");
    print("---------------------------");
  }

  void viewingOrderMenu(){
    print("Do You Want To: ");
    print("1. Filter Orders by Status");
    print("2. Filter Orders by Price");
    print("3. Filter Orders by Coffee Type");

    print("4. Sort Orders by Date");
    print("5. Sort Orders by Price");
    print("0. Back");
    print("---------------------------");
  }

  void viewCoffeeSizeChoices(){
    print("------- Available Sizes -------");
    print("1. Small");
    print("2. Medium");
    print("3. Large");
    print("-------------------------------");
  }

  void viewCustomizingChoice(){
    print("Do You Want To Customize Your Coffee?");
    print("1. Yes");
    print("2. No");
    print("Enter Your Choice: ");
  }
}