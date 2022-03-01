import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/pages/tabs_page.dart';

import 'bloc/cart_bloc.dart';

void main() {
  runApp(const MyApp());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartBloc>.value(
          value: CartBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopping Cart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DefaultTabController(
          length: 2,
          child: TabsPage(),
        ),
      ),
    );
  }
}
