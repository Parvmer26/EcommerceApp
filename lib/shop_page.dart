import 'package:ecommerce_app/my_drawer.dart';
import 'package:ecommerce_app/myproduct_tile.dart';
import 'package:ecommerce_app/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Shop Page",style: TextStyle(fontFamily: 'bebas'),),
        actions: [
          IconButton(onPressed: ()=>Navigator.pushNamed(context ,"/cart_page"), icon: Icon(Icons.shopping_cart,))
        ],
      ),
      drawer: const MyDrawer(),
      // backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          SizedBox(height: 25,),
          Center(child: const Text('Pick from the selected list of premium products',
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'bebas',
          ),
          )),
         SizedBox(
            height: 590,
            child: ListView.builder(
                itemCount: products.length,
                padding: EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //   get each products from shop
                  final product = products[index];

                  //   return it as product tile UI
                  return MyproductTile(product: product);
                }),
          ),
        ],

      ),
    );
  }
}
