import 'package:flutter/material.dart';
import 'package:portfolio_2/models/shop.dart';
import 'package:portfolio_2/pages/cart_page.dart';
import 'package:portfolio_2/pages/favorite_page.dart';
import 'package:portfolio_2/pages/intro_page.dart';
import 'package:portfolio_2/pages/shop_page.dart';
import 'package:portfolio_2/themes/light_mode.dart';
import 'package:portfolio_2/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightmode,

      routes: {
        AppRoutes.IntroPage: (context) => const IntroPage(),
        AppRoutes.ShopPage: (context) => const ShopPage(),
        AppRoutes.CartPage: (context) => const CartPage(),
        AppRoutes.FavoritePage: (context) => const FavoritePage(),
      },
    );
  }
}
