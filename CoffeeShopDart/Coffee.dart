import 'Enums/Addons.dart';
import 'Enums/SizeEnum.dart';

class Coffee{
  String name;
  int price;
  final Size size;
  final List<Addon> addons = [Addon.coffee];

  Coffee({required this.name, required this.size}): this.price = Addon.coffee.price;

  void addAddon(Addon newAddon){
    addons.add(newAddon);
  }

}