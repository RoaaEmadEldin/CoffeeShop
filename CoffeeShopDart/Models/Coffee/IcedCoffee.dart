import 'Coffee.dart';
import '../../Enums/Addons.dart';
import '../../Enums/SizeEnum.dart';

class IcedCoffee extends Coffee{
  // Default Constructor --------------------------------
  IcedCoffee(Size size) : super(name: "Iced Coffee", size: size){
    price = super.price + Addon.Milk.price + Addon.Sugar.price + Addon.Ice.price;
    addons.add(Addon.Milk);
    addons.add(Addon.Sugar);
    addons.add(Addon.Ice);
  }

  // Named Constructor -----------------------------------
  IcedCoffee.CustomIcedCoffee({required Size cSize, required Set<Addon> cAddons})
      : super.CustomCoffee(name: "Iced Coffee",size: cSize, addons: cAddons){
    price = super.price + addons.fold(0, (sum, addon) => sum + addon.price);
  }

}