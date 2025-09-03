class Flavor { final String id; final String name; final double price; const Flavor(this.id, this.name, this.price); }
class Crust { final String id; final String name; final double price; const Crust(this.id, this.name, this.price); }
class Dough { final String id; final String name; final double price; const Dough(this.id, this.name, this.price); }
class Drink { final String id; final String name; final double price; const Drink(this.id, this.name, this.price); }

class Address {
  final String street; final String number; final String district; final String city; final String complement;
  const Address({required this.street, required this.number, required this.district, required this.city, this.complement = ''});
}

enum PaymentMethod { credit, debit, pix, cash }

class Order {
  final String id;
  final List<Flavor> flavors;
  final Crust crust;
  final Dough dough;
  final List<Drink> drinks;
  final Address address;
  final PaymentMethod paymentMethod;
  final double changeNeeded; // 0 se não houver troco
  final double total;

  const Order({
    required this.id,
    required this.flavors,
    required this.crust,
    required this.dough,
    required this.drinks,
    required this.address,
    required this.paymentMethod,
    required this.changeNeeded,
    required this.total,
  });
}