import '../../data/models/pizza_models.dart';

const flavors = <Flavor>[
  Flavor('fz1', 'Mussarela', 34.90),
  Flavor('fz2', 'Calabresa', 36.90),
  Flavor('fz3', 'Frango c/ Catupiry', 39.90),
  Flavor('fz4', 'Portuguesa', 41.90),
];

const crusts = <Crust>[
  Crust('cr1', 'Tradicional', 0),
  Crust('cr2', 'Catupiry na borda', 6.90),
  Crust('cr3', 'Cheddar na borda', 6.90),
];

const doughs = <Dough>[
  Dough('dg1', 'Fina', 0),
  Dough('dg2', 'Média', 2.90),
  Dough('dg3', 'Grossa', 4.90),
];

const drinks = <Drink>[
  Drink('dr1', 'Refrigerante 350ml', 6.00),
  Drink('dr2', 'Refrigerante 2L', 12.00),
  Drink('dr3', 'Água 500ml', 4.50),
];