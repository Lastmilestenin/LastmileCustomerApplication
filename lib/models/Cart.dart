import 'dart:convert';

import 'package:last_mile/global.dart';


class CartModel{
  var image;
  var name;
  var price;
  var id;
  var unique;
  var qty;
  var vendorId;
  var subtotal;

  var subscribe;
  var package;
  var dated;





  CartModel({this.image, this.name, this.price, this.id, this.unique, this.qty,this.vendorId , this.subtotal,this.subscribe,this.package,this.dated});


  factory CartModel.fromJson(Map<String, dynamic> jsonData) {
    return CartModel(
      id: jsonData['id'],
      name: jsonData['name'],
      image: jsonData['image'],
      price: jsonData['price'],
      unique: jsonData['unique'],
      qty: jsonData['quantity'],
      vendorId: jsonData['vid'],
      subtotal: jsonData['subtotal'],
        subscribe: jsonData['subscribe'],
        package:jsonData['package'],
      dated:jsonData['dated'],
    );
  }

  static Map<String, dynamic> toMap(CartModel cart) => {
    'id': cart.id,
    'image': cart.image,
    'name': cart.name,
    'price': cart.price,
    'unique': cart.unique,
    'quantity': cart.qty,
    'vendorId': cart.vendorId,
    'subtotal': cart.subtotal,
    'subscribe':cart.subscribe,
    'package':cart.package,
    'dated':cart.dated,
  };

  static String encodeMusics(List<CartModel> cart) => json.encode(
    cart
        .map<Map<dynamic, dynamic>>((music) => CartModel.toMap(music))
        .toList(),
  );

  static List<CartModel> decodeMusics(String musics){
    if(musics != null){
      return (json.decode(musics) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
    }
    else{
      return new List();
    }
  }
}