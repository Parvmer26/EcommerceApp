import 'package:ecommerce_app/product.dart';
import 'package:ecommerce_app/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyproductTile extends StatelessWidget {
  final Product product;

  const MyproductTile({
    super.key,
    required this.product,
  });

  // add to card pressed
  void addTocart(BuildContext context) {
    //   dialog box
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("add this item to your cart ?",style: TextStyle(fontFamily: 'bebas'),),
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
                  context.read<Shop>().addTocart(product);
                },
                  child: Text('Yes',style: TextStyle(fontFamily: 'bebas'),),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //   image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    child:Image.asset(product.imagePath),),
              ),
              SizedBox(
                height: 25,
              ),
              //   name
              Text(
                product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 26,fontFamily: 'bebas'),
              ),
              SizedBox(
                height: 10,
              ),
              //   description
              Text(
                product.description,
                style: TextStyle(
                  fontFamily: 'abels',
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
          //   product price + add to cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\₹ ' + product.price.toStringAsFixed(2),style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'bebas'),),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                    onPressed: () => addTocart(context), icon: Icon(Icons.add,color: Theme.of(context).colorScheme.inversePrimary,)),
              )
            ],
          )
        ],
      ),
    );
  }
}
