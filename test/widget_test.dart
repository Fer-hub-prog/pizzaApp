import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_app/app.dart';

void main() {
  testWidgets('app builds', (tester) async {
    await tester.pumpWidget(const PizzaApp());
  });
}
