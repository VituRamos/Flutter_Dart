import 'package:flutter/material.dart';
import 'package:portfolio_2/models/shop.dart';
import 'package:portfolio_2/pages/cart_page.dart';
import 'package:portfolio_2/pages/intro_page.dart';
import 'package:portfolio_2/pages/shop_page.dart';
import 'package:portfolio_2/themes/light_mode.dart';
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
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
