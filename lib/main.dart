import 'package:flutter/material.dart';
import 'package:selling_car/pages/HomePage.dart';
import 'package:selling_car/pages/Product_Detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Mulish',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/product-detail': (context) {
          final Map<String, dynamic> product =
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return ProductDetail(product: product);
        },
      },
    );
  }
}