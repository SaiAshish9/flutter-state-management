import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title,this.price);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
// listen:false restricts widget to build whenever notify listeners changes
    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  // alignment: Alignment.center,
                  height: 300,
                  child:
                      Image.network(loadedProduct.imageUrl, fit: BoxFit.cover)),
              SizedBox(height: 10),
              Text('\$${loadedProduct.price}',
                  style: TextStyle(color: Colors.grey, fontSize: 20)),
              SizedBox(height: 10),
              Container(
                padding:EdgeInsets.symmetric(horizontal:10),
                width: double.infinity,
                child: Text(loadedProduct.description,
                    textAlign: TextAlign.center, softWrap: true),
              )
            ],
          ),
        ));
  }
}
