import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
      return ChangeNotifierProvider.value(
          // builder : (ctx) => Products() , deprecated
          // create:(ctx)=>Products(),
          value:Products(),
          child: MaterialApp(
          title: 'Shop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor:Colors.deepOrange,
            fontFamily:'Lato'
            ),
          home: ProductsOverviewScreen(),
          routes:{
            ProductDetailScreen.routeName:(ctx)=>ProductDetailScreen()
          }
          ),
    );
  }
}
