import 'package:go_router/go_router.dart';
import 'package:layout_ideas/pdp/product_page.dart';
import 'package:layout_ideas/plp/product_list_page.dart';
import 'package:layout_ideas/product.dart';

final routerConfig = GoRouter(
    debugLogDiagnostics: true,
    routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(
            title: 'Flutter Demo Home Page',
            products: ProductsRepository.loadProducts(),
          ),
      routes: [
        GoRoute(
            path: 'product',
            builder: (context, state) {
              return ProductScreen(product: state.extra as Product);
            }),
      ]),
]);
