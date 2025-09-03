import '../../data/models/pizza_models.dart';

class CartState {
  static final CartState _i = CartState._();
  CartState._();
  factory CartState() => _i;

  final List<Flavor> flavors = [];
  Crust? crust;
  Dough? dough;
  final List<Drink> drinks = [];

  double get total {
    final f = flavors.fold<double>(0, (s, e) => s + e.price);
    final c = (crust?.price ?? 0);
    final d = (dough?.price ?? 0);
    final dr = drinks.fold<double>(0, (s, e) => s + e.price);
    return f + c + d + dr;
  }

  void clear() {
    flavors.clear();
    crust = null;
    dough = null;
    drinks.clear();
  }
}