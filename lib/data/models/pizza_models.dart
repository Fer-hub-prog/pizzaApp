// lib/data/models/pizza_models.dart

class Flavor {
  final String id;
  final String name;
  final double price;
  const Flavor(this.id, this.name, this.price);
}

class Crust {
  final String id;
  final String name;
  final double price;
  const Crust(this.id, this.name, this.price);
}

class Dough {
  final String id;
  final String name;
  final double price;
  const Dough(this.id, this.name, this.price);
}

class Drink {
  final String id;
  final String name;
  final double price;
  const Drink(this.id, this.name, this.price);
}

class Address {
  final String street;
  final String number;
  final String district;
  final String city;
  final String complement;

  const Address({
    required this.street,
    required this.number,
    required this.district,
    required this.city,
    this.complement = '',
  });
}

enum PaymentMethod { credit, debit, pix, cash }