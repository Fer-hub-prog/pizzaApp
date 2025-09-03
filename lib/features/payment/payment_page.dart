import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagamento')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/order-result'),
              child: const Text('Confirmar (simulado)'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.go('/catalog'),
              child: const Text('Voltar ao Catálogo'),
            ),
          ],
        ),
      ),
    );
  }
}