import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tracking (simulado)')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Aqui entra o mapa do motoboy (próximas etapas).'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/catalog'),
              child: const Text('Fazer novo pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
