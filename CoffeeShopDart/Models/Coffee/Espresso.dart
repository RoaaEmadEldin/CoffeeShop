import 'Coffee.dart';
import '../../Enums/Addons.dart';
import '../../Enums/SizeEnum.dart';

class Espresso extends Coffee{
  // Default Constructor ------------------------------
  Espresso(Size size) : super(name: "Espresso", size: size){
    price = super.price;
  }


  // Named Constructor --------------------------------
  Espresso.CustomEspresso({required Size cSize, required Set<Addon> cAddons})
      : super.CustomCoffee(name: "Espresso", size: cSize, addons: cAddons){
    price = super.price + addons.fold(0, (sum, addon) => sum + addon.price);
  }

}