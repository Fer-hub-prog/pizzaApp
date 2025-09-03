
import 'package:go_router/go_router.dart';

import '../../features/catalog/catalog_page.dart';
import '../../features/cart/cart_page.dart';
import '../../features/address/address_page.dart';
import '../../features/payment/payment_page.dart';
import '../../features/order/order_result_page.dart';
import '../../features/tracking/tracking_page.dart';

final appRouter = GoRouter(
  initialLocation: '/catalog',
  routes: [
    GoRoute(path: '/catalog', builder: (c, s) => const CatalogPage()),
    GoRoute(path: '/cart', builder: (c, s) => const CartPage()),
    GoRoute(path: '/address', builder: (c, s) => const AddressPage()),
    GoRoute(path: '/payment', builder: (c, s) => const PaymentPage()),
    GoRoute(path: '/order-result', builder: (c, s) => const OrderResultPage()),
    GoRoute(path: '/tracking', builder: (c, s) => const TrackingPage()),
  ],
);
