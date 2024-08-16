import 'Coffee.dart';
import '../../Enums/Addons.dart';
import '../../Enums/SizeEnum.dart';

class Latte extends Coffee{
  // Default Constructor -------------------------------
  Latte(Size size) : super(name: "Latte", size: size){
    price = super.price + Addon.Milk.price + Addon.Sugar.price;
    addons.add(Addon.Milk);
    addons.add(Addon.Sugar);
  }

  // Named Constructor ----------------------------------
  Latte.CustomLatte({required Size cSize, required Set<Addon> cAddons})
  : super.CustomCoffee(name:"Latte", size: cSize, addons: cAddons){
    price = super.price + addons.fold(0, (sum, addon) => sum + addon.price);
  }

}