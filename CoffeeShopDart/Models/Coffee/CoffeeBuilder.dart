import 'Coffee.dart';
import '../../Enums/Addons.dart';
import '../../Enums/SizeEnum.dart';

class CoffeeBuilder{
  String name;
  Size size;
  Set<Addon> addons = {};

  CoffeeBuilder({required this.name, this.size = Size.Small});

  CoffeeBuilder withSize(Size size){
    this.size = size;
    return this;
  }

  CoffeeBuilder addAddons(Set<Addon> addons){
    this.addons.addAll(addons);
    return this;
  }

  Coffee build(){
    return addons.isEmpty ? Coffee.CoffeeFactory(this.name, this.size) : Coffee.CoffeeFactory(this.name, this.size, this.addons);
  }
}