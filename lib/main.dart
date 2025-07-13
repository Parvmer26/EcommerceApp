import 'package:ecommerce_app/cart_page.dart';
import 'package:ecommerce_app/settings_page.dart';
import 'package:ecommerce_app/shop.dart';
import 'package:ecommerce_app/shop_page.dart';
import 'package:ecommerce_app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>ThemeProvider()),
    ChangeNotifierProvider(create: (context)=>Shop()),
  ],child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      themeMode: context.watch<ThemeProvider>().getThemeValue() ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      routes: {
        '/intro_page':(context) => IntroPage(),
        '/shop_page':(context) => ShopPage(),
        '/cart_page':(context) => CartPage(),
        '/settings_page':(context) => SettingsPage()
      },
    );
  }
}