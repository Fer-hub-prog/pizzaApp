import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../cart/cart_state.dart';

class OrderResultPage extends StatelessWidget {
  const OrderResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartState();
    final ok = cart.lastPaymentSuccess == true;
    final id = cart.lastOrderId ?? '-';

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado do Pedido')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              ok ? Icons.check_circle : Icons.error,
              size: 64,
              color: ok ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 12),
            Text(
              ok
                  ? 'Pedido #$id confirmado!'
                  : 'Falha no pagamento do pedido #$id',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/tracking'),
              child: const Text('Acompanhar entrega'),
            ),
            TextButton(
              onPressed: () {
                cart.clear();
                context.go('/catalog');
              },
              child: const Text('Fazer novo pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
