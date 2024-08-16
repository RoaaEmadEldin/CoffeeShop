import '../../Enums/Addons.dart';
import '../../Enums/SizeEnum.dart';
import 'Espresso.dart';
import 'IcedCoffee.dart';
import 'Latte.dart';

abstract class Coffee{
  String name;
  double price;
  Size size;
  final Set<Addon> addons;

  // Default Constructor ---------------------------------------
  Coffee({this.name = "", required this.size})
      : this.price = Addon.Coffee.price + size.price,
        this.addons = {};

  // Named Constructor ------------------------------------------
  Coffee.CustomCoffee({required this.name, required this.size, required this.addons})
      : this.price = Addon.Coffee.price + size.price;

  // Factory Constructor ----------------------------------------
  factory Coffee.CoffeeFactory(String typeName, Size size, [Set<Addon>? addons]){
    if(typeName == "Latte") {
      return addons == null ? Latte(size) : Latte.CustomLatte(cSize: size, cAddons: addons);
    }
    if (typeName == "Espresso") {
      return addons == null ? Espresso(size) : Espresso.CustomEspresso(cSize: size, cAddons: addons);
    }
    if (typeName == "Iced Coffee") {
      return addons == null ? IcedCoffee(size) : IcedCoffee.CustomIcedCoffee(cSize: size, cAddons: addons);
    }

    throw ArgumentError("Unrecognized $typeName");
  }

  // toString ----------------------------------------------------
  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.write('\n  * ${size} $name ${addons.isEmpty ? '' : "with "}');
    int ln = addons.length;
    int i = 1;
    for (Addon addon in addons){
      if (i == ln) buffer.write('$addon');
      else buffer.write('$addon, ');
      i++;
    }
    buffer.write(' for total of \$$price');
    return buffer.toString();
  }
}