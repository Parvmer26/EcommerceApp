import 'package:ecommerce_app/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //   logo
            Icon(
                Icons.shop_2_sharp,
              size: 75,
              color: Theme.of(context).colorScheme.secondary,
            ),

            SizedBox(height: 25,),

          //   title
            Text(
              "Cartify",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: Theme.of(context).colorScheme.secondary,
                fontSize: 45,
                fontFamily: 'abels',
              ),
            ),

            SizedBox(height: 10,),

            Text(
              "Premium Quality Products",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 16,
                fontFamily: 'abels'
              ),
            ),

            SizedBox(height: 25,),

            SizedBox(
              width: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(onTap: ()=> Navigator.pushNamed(context,'/shop_page'),
                     child: Icon(Icons.forward_outlined,color: Theme.of(context).colorScheme.onInverseSurface,)),
                  MyButton(onTap: ()=> SystemNavigator.pop(),
                      child: Icon(Icons.exit_to_app,color: Theme.of(context).colorScheme.onInverseSurface,)),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}