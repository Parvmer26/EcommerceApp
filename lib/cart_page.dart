import 'package:ecommerce_app/my_button.dart';
import 'package:ecommerce_app/product.dart';
import 'package:ecommerce_app/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromcart(BuildContext context,Product product) {
    // confirm to remove cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Remove this item from your cart ?",style: TextStyle(fontFamily: 'bebas'),),
          actions: [
            //   cancel
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel',style: TextStyle(fontFamily: 'bebas'),),
            ),
            //   yes
            MaterialButton(onPressed: (){
              // pop dialog box
              Navigator.pop(context);
              //   add to cart
              context.read<Shop>().removeFromcart(product);
            },
              child: Text('Yes',style: TextStyle(fontFamily: 'bebas'),),
            ),
          ],
        ));
  }

  void payButtonPressed(BuildContext context){
    showDialog(context: context, builder: (context)=>const AlertDialog(
      content: Text('User wants to pay ! Connect this app to your payment Backend',style: TextStyle(fontFamily: 'abels'),),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // get access of cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // foregroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Cart Page',style: TextStyle(fontFamily: 'bebas'),),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
      ?Center(child: const Text('Your cart is empty..',style: TextStyle(color: Colors.grey,fontFamily: 'bebas'),))
             : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
          //   get individual item in cart
            final item = cart[index];

          //   return as a card tile UI
            return ListTile(
              title: Text(item.name,style: TextStyle(fontFamily: 'bebas',fontSize: 18),),
              subtitle: Text('\₹ ' + item.price.toStringAsFixed(2),style: TextStyle(fontFamily: 'abels',fontWeight: FontWeight.w600,fontSize: 13),),
              trailing: IconButton(onPressed: ()=> removeItemFromcart(context,item), icon:const Icon(Icons.remove_circle_sharp)),
            );
          })),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
                child: MyButton(onTap: ()=>payButtonPressed(context),
                    child: Text('PAY NOW',style: TextStyle(fontFamily: 'abels',fontWeight: FontWeight.w600,fontSize: 14,color: Theme.of(context).colorScheme.surface),))),
          )
        ],
      ),
    );
  }
}
