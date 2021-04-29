//import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:last_mile/carts/cartListing.dart';
//import 'package:last_mile/carts/fullCart.dart';
//import 'package:last_mile/customization/index.dart';
//import 'package:last_mile/models/Cart.dart';
//import 'package:last_mile/shops/showCart.dart';
//
//import '../main.dart';
//
//class CartProduct extends StatefulWidget {
//  BuildContext context;
//  CartProduct(this.context);
//  @override
//  _CartProductPageState createState() => _CartProductPageState(this.context);
//
//}
//class _CartProductPageState extends State<CartProduct> {
//  BuildContext context;
//  _CartProductPageState(this.context);
//  List<CartModel> searchResults;
//  TextEditingController searchController = TextEditingController();
//  var height = 80.0;
//  @override
//  void initState() {
//    // TODO: implement initState
//    var a = globalcart.length;
//    if(a == 0){
//      setState(() {
//        height = 80.0;
//      });
//    }else if(a == 1){
//      setState(() {
//        height = 100.0;
//      });
//    }else if(a == 2){
//      setState(() {
//        height = 180.0;
//      });
//    }else{
//      setState(() {
//        height = 260.0;
//      });
//    }
//    super.initState();
//    searchResults = globalcart;
//
//  }
//  @override
//  Widget build(BuildContext context) {
//    return
//      SizedBox(
//      height: height,
//      width: MediaQuery.of(context).size.width/1.1,
//      child: ListView.builder(
//        shrinkWrap: false,
//          scrollDirection: Axis.vertical,
//          itemCount: globalcart.length,
//          itemBuilder: (_, index) {
//            return Dismissible(
//              key: ObjectKey(globalcart[index]),
//              background: Container(color: Colors.red),
//              direction: DismissDirection.horizontal,
//              child: ShowCarts(
//               cart: globalcart[index],
//                context: context,
//              ),
//              onDismissed: (directioon){
//                var save = globalcart[index];
//
//                globalcart.removeWhere((element) => element.unique ==  globalcart[index].unique);
//                final String encodedData = CartModel.encodeMusics(globalcart);
//                MyApp.sharedPreferences.setString("cart", encodedData);
//
//
//                setheight();
//                Scaffold.of(context).showSnackBar(SnackBar(
//                    content: Text("Item deleted"),
////                    action: SnackBarAction(
////                        label: "UNDO",
////                        onPressed: () {
////                          //To undo del  etion
//////                          setState(() {
//////                            globalcart.insert(index, save);
//////                          });
////
////                        })
//                ));
//              },
//            );
//          }
//      ),
//    );
//  }
//  setheight(){
//    var a = globalcart.length;
//    setState(() {
//      if(a == 0){
//        setState(() {
//          height = 80.0;
//        });
//      }else if(a == 1){
//        setState(() {
//          height = 100.0;
//        });
//      }else if(a == 2){
//        setState(() {
//          height = 180.0;
//        });
//      }else{
//        setState(() {
//          height = 260.0;
//        });
//      }
//    });
//
//  }
//}
//
//
