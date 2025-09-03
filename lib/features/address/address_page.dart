import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../cart/cart_state.dart';
import '../../data/models/pizza_models.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _street = TextEditingController();
  final _number = TextEditingController();
  final _district = TextEditingController();
  final _city = TextEditingController(text: 'São Paulo');
  final _complement = TextEditingController();

  @override
  void dispose() {
    _street.dispose(); _number.dispose(); _district.dispose();
    _city.dispose(); _complement.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Endereço de Entrega')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(controller: _street, decoration: const InputDecoration(labelText: 'Rua'),
              validator: (v) => (v==null || v.trim().isEmpty) ? 'Informe a rua' : null),
            TextFormField(controller: _number, decoration: const InputDecoration(labelText: 'Número'),
              validator: (v) => (v==null || v.trim().isEmpty) ? 'Informe o número' : null),
            TextFormField(controller: _district, decoration: const InputDecoration(labelText: 'Bairro'),
              validator: (v) => (v==null || v.trim().isEmpty) ? 'Informe o bairro' : null),
            TextFormField(controller: _city, decoration: const InputDecoration(labelText: 'Cidade'),
              validator: (v) => (v==null || v.trim().isEmpty) ? 'Informe a cidade' : null),
            TextFormField(controller: _complement, decoration: const InputDecoration(labelText: 'Complemento (opcional)')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                final cart = CartState();
                cart.address = Address(
                  street: _street.text.trim(),
                  number: _number.text.trim(),
                  district: _district.text.trim(),
                  city: _city.text.trim(),
                  complement: _complement.text.trim(),
                );
                context.go('/payment');
              },
              child: const Text('Ir para Pagamento'),
            )
          ],
        ),
      ),
    );
  }
}