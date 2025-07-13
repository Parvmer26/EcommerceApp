import 'package:ecommerce_app/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
// product for sale
final List<Product> _shop= [
  // product 1
  Product(
    name: "Round Shaped Glasses",
    price: 2899,
    description: 'This round shaped glasses are made by pure metal and it contains a UV protection glasses which helps you from sunrays',
    imagePath: 'assets/glasses1.jpg'
  ),
//   product 2
  Product(
      name: "D-square Aviator Glasses",
      price: 2499,
      description: 'The D-square sunglasses gives you a vintage look and suits good on your face with UV protection glasses',
      imagePath: 'assets/glasses2.jpg'
  ),
// product 3
  Product(
      name: "D-square Aviator Glasses(UV)",
      price: 2999,
      description: 'The D-square sunglasses gives you a vintage look and suits good on your face with UV protection glasses with UV protection glasses',
      imagePath: 'assets/glass9.png'
  ),
// product 4
  Product(
      name: "Bottega Veneta",
      price: 1499,
      description: 'Luxurious glasses with UV protection helps you to see the sun-light and also with golden strips in it',
      imagePath: 'assets/glasses4.jpg'
  ),
  // product 5
  Product(
      name: "Modern Glasses",
      price: 1999,
      description: 'This modern glasses comes with a great design and looks , this square cuts in glass and golden finish give it vintage look',
      imagePath: 'assets/glasses5.jpg'
  ),
  // product 6
  Product(
      name: "Round Gold Glasses",
      price: 1899,
      description: 'This round shaped glasses comes with a golden finish with in it and looks cool and gives you a nice look',
      imagePath: 'assets/glasses6.jpg'
  ),
  // product 7
  Product(
      name: "Transparent Glasses",
      price: 1199,
      description: 'This Transparent glasses are totally transparent and comes with UV protection and protects you from UV-rays',
      imagePath: 'assets/glasses7.jpg'
  ),
];

// user cart

  List<Product> _cart = [];

// get product list

  List<Product> get shop => _shop;

// get user cart

  List<Product> get cart => _cart;

// add item in cart
void addTocart(Product item){
  _cart.add(item);
  notifyListeners();
}
// remove item from cart
void removeFromcart(Product item){
  _cart.remove(item);
  notifyListeners();
}
}