import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cart = CartState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text('Sabores', style: TextStyle(fontWeight: FontWeight.bold)),
          ...cart.flavors.map((f) => ListTile(
                dense: true,
                title: Text(f.name),
                trailing: Text('R\$ ${f.price.toStringAsFixed(2)}'),
              )),
          const Divider(),
          ListTile(
            title: Text('Borda: ${cart.crust?.name ?? '—'}'),
            trailing: Text('R\$ ${(cart.crust?.price ?? 0).toStringAsFixed(2)}'),
          ),
          ListTile(
            title: Text('Massa: ${cart.dough?.name ?? '—'}'),
            trailing: Text('R\$ ${(cart.dough?.price ?? 0).toStringAsFixed(2)}'),
          ),
          const Divider(),
          const Text('Bebidas', style: TextStyle(fontWeight: FontWeight.bold)),
          ...cart.drinks.map((d) => ListTile(
                dense: true,
                title: Text(d.name),
                trailing: Text('R\$ ${d.price.toStringAsFixed(2)}'),
              )),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            trailing: Text('R\$ ${cart.total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.go('/address'),
            child: const Text('Confirmar Endereço'),
          ),
          TextButton(
            onPressed: () {
              cart.clear();
              setState(() {});
            },
            child: const Text('Limpar carrinho'),
          ),
        ],
      ),
    );
  }
}