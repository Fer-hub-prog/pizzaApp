import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderResultPage extends StatelessWidget {
  const OrderResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pedido Confirmado')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Pedido #123 confirmado (simulado)!'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/tracking'),
              child: const Text('Acompanhar Entrega'),
            ),
          ],
        ),
      ),
    );
  }
}