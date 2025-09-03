import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Endereço de Entrega')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/payment'),
          child: const Text('Ir para Pagamento'),
        ),
      ),
    );
  }
}