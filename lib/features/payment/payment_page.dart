import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../cart/cart_state.dart';
import '../../data/models/pizza_models.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final cart = CartState();
  PaymentMethod? _method;

  Future<double> _askCashChange(BuildContext context) async {
    final controller = TextEditingController();
    final value = await showDialog<double>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Vai precisar de troco?'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'Valor para troco (ex: 100.00)'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, 0.0), child: const Text('Não')),
          TextButton(onPressed: () {
            final v = double.tryParse(controller.text.replaceAll(',', '.')) ?? 0.0;
            Navigator.pop(context, v);
          }, child: const Text('Confirmar')),
        ],
      ),
    );
    return value ?? 0.0;
  }

  Future<bool> _simulatePayment(PaymentMethod method) async {
    await Future.delayed(const Duration(seconds: 2));
    if (method == PaymentMethod.pix || method == PaymentMethod.cash) return true;
    return Random().nextBool(); // crédito/débito
  }

  Future<void> _sendWhatsApp(String message) async {
    const phone = '+5511999998888'; // ajuste para testar
    final uri = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(message)}');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _onPay() async {
    if (_method == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione um método de pagamento.')),
      );
      return;
    }

    if (_method == PaymentMethod.cash) {
      cart.cashChange = await _askCashChange(context);
    }

    cart.paymentMethod = _method;
    cart.lastOrderId = DateTime.now().millisecondsSinceEpoch.toString();

    final ok = await _simulatePayment(_method!);
    cart.lastPaymentSuccess = ok;

    final msg = ok
        ? 'Pedido #${cart.lastOrderId} confirmado! Total R\$ ${cart.total.toStringAsFixed(2)}. Entrega em 35–45 min.'
        : 'Pagamento não aprovado para o pedido #${cart.lastOrderId}. Tente novamente.';

    await _sendWhatsApp(msg);
    if (!mounted) return;
    context.go('/order-result');
  }

  @override
  Widget build(BuildContext context) {
    final total = cart.total.toStringAsFixed(2);
    return Scaffold(
      appBar: AppBar(title: const Text('Pagamento')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text('Total do pedido: R\$ $total',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          const Text('Selecione o método:', style: TextStyle(fontWeight: FontWeight.bold)),
          RadioListTile<PaymentMethod>(
            value: PaymentMethod.credit, groupValue: _method,
            onChanged: (v) => setState(()=> _method = v),
            title: const Text('Cartão de crédito')),
          RadioListTile<PaymentMethod>(
            value: PaymentMethod.debit, groupValue: _method,
            onChanged: (v) => setState(()=> _method = v),
            title: const Text('Cartão de débito')),
          RadioListTile<PaymentMethod>(
            value: PaymentMethod.pix, groupValue: _method,
            onChanged: (v) => setState(()=> _method = v),
            title: const Text('Pix (simulado)')),
          RadioListTile<PaymentMethod>(
            value: PaymentMethod.cash, groupValue: _method,
            onChanged: (v) => setState(()=> _method = v),
            title: const Text('Dinheiro (perguntar troco)')),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: _onPay, child: const Text('Pagar')),
          TextButton(onPressed: () => context.go('/cart'), child: const Text('Voltar ao carrinho')),
        ],
      ),
    );
  }
}