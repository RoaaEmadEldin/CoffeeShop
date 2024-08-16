import '../Models/Coffee/Coffee.dart';
import '../Models/Coffee/CoffeeBuilder.dart';
import '../Enums/Addons.dart';
import '../TypeDefs/TypeDefs.dart';

class CoffeeManager{
  Coffee coffee;

  CoffeeManager(this.coffee);


  void addAddon(Addon newAddon){
    coffee.addons.add(newAddon);
    updateCoffeePrice();
  }

  void updateCoffeePrice(){
    coffee.price = coffee.size.price + Addon.Coffee.price
                  + coffee.addons.fold(0, (sum, addon) => sum + addon.price);
  }

  double calculateCoffeePrice(){
    return coffee.price;
  }

  Coffee customizeCoffee(Customizer customizer){
    // Initialize the builder with the initial attributes of the coffee
    CoffeeBuilder builder = CoffeeBuilder(name: coffee.name)
        ..size = coffee.size
        ..addons.addAll(coffee.addons);

    // Update the builder with the customized attributes
    customizer(builder);

    // Build the new customized coffee
    return builder.build();
  }


}