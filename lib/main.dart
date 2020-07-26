import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateManagement/screens/orders_screen.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          // builder : (ctx) => Products() , deprecated
          // create:(ctx)=>Products(),
          value: Products(),
        ),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value:Orders())
      ],
      child: MaterialApp(
          title: 'Shop',
          theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato'),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName:(ctx)=> OrdersScreen(),
          }),
    );
  }
}
