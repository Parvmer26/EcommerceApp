import 'package:flutter/services.dart';

import 'my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children :[
              // logo
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Icon(
                  Icons.shop_2_sharp,
                  size: 100,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),



            //   shop tile
            Container(
                margin: EdgeInsets.only(top: 40),
                child: MyListTile(text: 'Shop', icon: Icons.home_filled, onTap: (){
                //   pop drawer
                  Navigator.pop(context);

                })),
            //   cart title
            MyListTile(text: 'Cart', icon: Icons.shopping_cart, onTap: (){
              //   go to cart page
              Navigator.pushNamed(context, '/cart_page');
            //   settings title

            }),
              // settings title
              MyListTile(text: 'Settings', icon: Icons.settings_sharp, onTap: (){
                //   go to cart page
                Navigator.pushNamed(context, '/settings_page');
                //   settings title

              })
            ],
          ),

        //   exit shop title
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                  child: MyListTile(text: 'Menu', icon: Icons.menu, onTap: (){
                    Navigator.pushNamed(context, '/intro_page');
                  })
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: MyListTile(text: 'Exit', icon: Icons.logout, onTap: (){
                    SystemNavigator.pop();
                  })
              ),

            ],
          ),

        ],
      ),
    );
  }
}