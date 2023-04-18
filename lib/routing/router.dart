import 'package:go_router/go_router.dart';
import 'package:layout_ideas/form/password_signin.dart';
import 'package:layout_ideas/pdp/product_page.dart';
import 'package:layout_ideas/plp/product_list_page.dart';
import 'package:layout_ideas/product.dart';
import 'package:layout_ideas/signin/login_register_page.dart';

import '../signin/password_page.dart';

final routerConfig = GoRouter(debugLogDiagnostics: true, routes: [
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
        GoRoute(
            path: 'login',
            builder: (context, state) {
              return const LoginPage();
            },
            routes: [
              GoRoute(
                path: "password",
                builder: (context, state) => const PasswordPage(),
              )
            ]),
      ]),
]);
