import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../cart/cart_state.dart';
import 'catalog_data.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final cart = CartState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monte sua Pizza')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/cart'),
        label: Text('Ir para o carrinho (R\$ ${cart.total.toStringAsFixed(2)})'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text('Sabores', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...flavors.map((f) => ListTile(
                title: Text('${f.name}'),
                subtitle: Text('R\$ ${f.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    cart.flavors.add(f);
                    setState(() {});
                  },
                ),
              )),

          const Divider(height: 24),
          const Text('Borda', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: crusts.map((c) {
              final selected = cart.crust?.id == c.id;
              return ChoiceChip(
                label: Text('${c.name} (+R\$ ${c.price.toStringAsFixed(2)})'),
                selected: selected,
                onSelected: (_) {
                  setState(() => cart.crust = c);
                },
              );
            }).toList(),
          ),

          const Divider(height: 24),
          const Text('Massa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: doughs.map((d) {
              final selected = cart.dough?.id == d.id;
              return ChoiceChip(
                label: Text('${d.name} (+R\$ ${d.price.toStringAsFixed(2)})'),
                selected: selected,
                onSelected: (_) {
                  setState(() => cart.dough = d);
                },
              );
            }).toList(),
          ),

          const Divider(height: 24),
          const Text('Bebidas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...drinks.map((d) => ListTile(
                title: Text(d.name),
                subtitle: Text('R\$ ${d.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    cart.drinks.add(d);
                    setState(() {});
                  },
                ),
              )),

          const SizedBox(height: 80),
        ],
      ),
    );
  }
}