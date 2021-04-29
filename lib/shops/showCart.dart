import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:last_mile/carts/fullCart.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/models/Decor.dart';
import 'package:last_mile/models/product.dart';

import '../main.dart';
import '../models/Cart.dart';


class ShowCarts extends StatefulWidget {

  final CartModel cart;
  final BuildContext context;
  var subtotal, shipping , total;

  ShowCarts({this.cart , this.context});

  @override
  _ShowCartsState createState() => _ShowCartsState();
}

class _ShowCartsState extends State<ShowCarts> {
  var _itemCount = 1;
  @override
  Widget build(BuildContext context) {

    return Container(
            height: 79,
            color: Colors.transparent,

            padding: EdgeInsets.all(2.0,),
            child: InkWell(

                    child: Container(
                        padding: EdgeInsets.all(2.0,),
                      //  height: MediaQuery.of(context).size.height/2.2,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),

                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
//                          Padding(
//                            padding: EdgeInsets.only(top: 10.0),
//                            child: Text('ORDER DETAILS',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
//                          ),
                            Row(
                              mainAxisSize: MainAxisSize.max,

                              children: <Widget>[
                                Container(
                                  height: 70,
                                  width: 80,
                                  child: Center(
                                    child: Image(image: NetworkImage(widget.cart.image),
                                     // radius: 80,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.only(top:4.0,),
                                      child: Container(
                                        width: 200,
                                        child: Text(
                                          widget.cart.name,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 13.0,color: Colors.black,fontFamily: 'aveb'),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(top:4.0,),
                                      child: Text(
                                        '\$${widget.cart.price ?? 0.0}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0,color: Colors.black,fontFamily: 'aveh'),
                                      ),
                                    ),

                                  ],
                                ),
                                //Spacer(),
//                                new Row(
//                                  children: <Widget>[
//                                    widget.cart.quantity!=0 ? new  IconButton(icon: new Icon(Icons.remove,color: Colors.black,),onPressed: ()=>setState(()=>widget.cart.quantity--),):new Container(),
//                                    new Text(widget.cart.quantity.toString(), style: TextStyle(fontFamily: 'aveb'),),
//                                    new IconButton(icon: new Icon(Icons.add, color: Colors.black,),onPressed: ()=>setState(()=> increment()))
//                                  ],
//                                ),
                              ],
                            ),
                          ],

                        )



                    )

            )
        );
  }

//  increment(){
//    widget.cart.quantity = int.parse(widget.cart.quantity.toString())+ 1;
//    var i = globalcart.indexWhere((element) => element.unique == widget.cart.unique.toString());
//
////    globalcart.insert(i, CartModel(unique: widget.cart.unique.toString() ,
////        id: widget.cart.id,
////        name: widget.cart.name,
////        image: widget.cart.image,
////        price: widget.cart.price,
////        quantity: widget.cart.quantity));
//
//    final String encodedData = CartModel.encodeMusics(globalcart);
//    MyApp.sharedPreferences.setString("cart", encodedData);
//
//
//    setState(() {
//      FullCart.subtotal += double.parse(widget.cart.price);
//      FullCart.total = FullCart.subtotal+ FullCart.shipping;
//
//      //FullCart.generatecost(context);
//    });
//
//
//  }

  decrement(){

  }
}















































//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:last_mile/index.dart';
//import 'package:last_mile/mainPage.dart';
//import 'package:last_mile/models/Decor.dart';
//import 'package:last_mile/product_page.dart';
//import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
//
//
//import 'color_list.dart';
//import 'models/product.dart';
//class ShowCarts extends StatefulWidget {
//  final Product product;
//  final Decor decor;
//  int b;
//
//   ShowCarts( this.product,this.decor,this.b);
//  @override
//  ShowCart createState() => ShowCart(this.product,this.decor,b);
//
//}
//class ShowCart extends State<ShowCarts> {
//  final Product product;
//  final Decor decor;
//  int b;
//
//  ShowCart(this.product, this.decor, this.b);
//
////  int a;
////  @override
//  void initState() {
//    // TODO: implement initState
//
//    super.initState();
//
//  }
//
//
//  Widget decorcards(context) {
//    int a = decor.image.length;
//    if (a == 2) {
//      return Padding(
//        padding: const EdgeInsets.only(top: 14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 0;
//                      image = decor.image[index];
//                      return image;
//                      //img(image);
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[0],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 1;
//                      image = decor.image[index];
//                      // img(image);
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[1],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//            ]),
//      );
//    }
//    else if (a == 3) {
//      return Padding(
//        padding: const EdgeInsets.only(top: 14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 0;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[0],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 1;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[1],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 2;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[2],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//            ]),
//      );
//    }
//    else if (a == 4) {
//      return Padding(
//        padding: const EdgeInsets.only(top: 14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 0;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[0],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 1;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[1],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 2;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[2],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 3;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[3],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//
//            ]),
//      );
//    }
//    else if (a > 4) {
//      return Padding(
//        padding: const EdgeInsets.only(top: 14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 0;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[0],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 1;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[1],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 2;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[2],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 3;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[3],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 4;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      decor.image[4],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//            ]),
//      );
//    }
//    else {
//      return
//        Padding(
//          padding: EdgeInsets.only(right: 5.0),
//          child: GestureDetector(
//            onTap: () {
//              setState(() {
//                index = 0;
//              });
//            },
//            child: Container(
//              decoration: BoxDecoration(
//                border: Border.all(color: Colors.white),
//              ),
//              height: 50,
//              width: 50,
//              child: Image.asset(
//                decor.image[0],
//                fit: BoxFit.fill,
//
//              ),
//            ),
//          ),
//        );
//    }
//  }
//
//
//  Widget cards(context) {
//    int a = product.image.length;
//    if (a == 2) {
//      return Padding(
//        padding: const EdgeInsets.only(top: 14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 0;
//                      image = product.image[index];
//                      return image;
//                      //img(image);
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[0],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 1;
//                      image = product.image[index];
//                      // img(image);
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[1],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//            ]),
//      );
//    }
//    else if (a == 3) {
//      return Padding(
//        padding: const EdgeInsets.only(top: 14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 0;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[0],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 1;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[1],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 2;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[2],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//            ]),
//      );
//    }
//    else if (a == 4) {
//      return Padding(
//        padding: const EdgeInsets.only(top: 14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 0;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[0],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 1;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[1],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 2;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[2],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 3;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[3],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//
//            ]),
//      );
//    }
//    else if (a > 4) {
//      return Padding(
//        padding: const EdgeInsets.only(top: 14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 0;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[0],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 1;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[1],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 2;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[2],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 3;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[3],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(right: 5.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      index = 4;
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.white),
//                    ),
//                    height: 50,
//                    width: 50,
//                    child: Image.asset(
//                      product.image[4],
//                      fit: BoxFit.fill,
//
//                    ),
//                  ),
//                ),
//              ),
//            ]),
//      );
//    }
//    else {
//      return
//        Padding(
//          padding: EdgeInsets.only(right: 5.0),
//          child: GestureDetector(
//            onTap: () {
//              setState(() {
//                index = 0;
//              });
//            },
//            child: Container(
//              decoration: BoxDecoration(
//                border: Border.all(color: Colors.white),
//              ),
//              height: 50,
//              width: 50,
//              child: Image.asset(
//                product.image[0],
//                fit: BoxFit.fill,
//
//              ),
//            ),
//          ),
//        );
//    }
//  }
//
//  bool isFavorite = false;
//
//Widget card;
//Widget builds;
//
//
//  Widget decorbuild() {
//    var image= decor.image[index];
//
//    return Container(
//      height: MediaQuery.of(context).size.height/1.5,
//      decoration: BoxDecoration(
//          boxShadow: [
//            BoxShadow(
//                color: Color.fromRGBO(0, 0, 0, 0.05),
//                offset: Offset(0, -3),
//                blurRadius: 10)
//          ],
//          borderRadius: BorderRadius.only(
//              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
//          color: Colors.white),
//      child: ListView(
//        scrollDirection: Axis.vertical,
//        shrinkWrap: true,
//        physics: NeverScrollableScrollPhysics(),
////          controller: _scrollController,
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.all(8.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
////            mainAxisAlignment: MainAxisAlignment.center,
////            mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding:
//                      const EdgeInsets.only( bottom: 10.0),
//                      child: Container(
//                        height: 100,
//                        width: 100,
//                        child: Image.asset(
//
//                          image,
//                          fit: BoxFit.fill,
//
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top:5.0),
//                      child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
//                        card,
//                      ]),
//                    ),
//                  ],
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.min,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.only(top:15.0,bottom: 5.0),
//                      child: Text(decor.name ?? 'sadasdasd',
//                        style:
//                        TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top:10.0,bottom: 5.0),
//                      child: Text(decor.desc ?? 'sadasdasd',textAlign: TextAlign.center,
//                        style:
//                        TextStyle(color: Colors.green,, fontSize: 16.0),),
//                    ),
//                    Row(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      mainAxisSize: MainAxisSize.min,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Padding(
//                          padding: EdgeInsets.only(top:4.0,),
//                          child: RatingBar(
//                            initialRating: decor.ratings,
//                            minRating: 1,
//                            direction: Axis.horizontal,
//                            allowHalfRating: true,
//                            itemSize: 20,
//                            itemCount: 5,
//                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//                            itemBuilder: (context, _) => Icon(
//                              Icons.star,
//                              color: Colors.green,,
//                              size: 1,
//                            ),
//                            onRatingUpdate: (rating) {
//                              print(rating);
//                            },
//                          ),
//                        ),
//                        Padding(
//                          padding: EdgeInsets.only(left:10.0,top: 4.0),
//                          child: Text(decor.totalRatings+ " ratings"??'No Ratings',
//                            style:
//                            TextStyle(color: Colors.black, fontSize: 10.0),),
//                        ),
//                      ],
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top:5.0,bottom: 5.0),
//                      child: Text('\$${decor.price ?? 0.0}',
//                        style:
//                        TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),),
//                    ),
//                    Padding(
//                        padding: EdgeInsets.only(top:10.0,bottom: 20.0),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: <Widget>[
//                            InkWell(
//                              onTap: (){
//                                isFavorite = !isFavorite;
//                                setState(() {
//                                  //   c = Colors.green,;
//                                });
//                              },
//                              child: Container(
//
//                                width: 50,
//                                height: 50,
//                                decoration: BoxDecoration(
//                                  color: Color.fromRGBO(220,220,220,1),
//                                  border: Border.all(color: Colors.white,),
//                                  borderRadius: BorderRadius.circular(25.0),
//                                ),
//                                child: Center(
//                                    child: isFavorite ? Icon(
//                                      Icons.bookmark,
//                                      color: Color.fromRGBO(60, 111, 102, 1),
//                                    ): Icon(Icons.bookmark)),
//
//
//                              ),
//                            ),
//                            InkWell(
//
//                              child: Container(
//
//                                width: MediaQuery.of(context).size.width /1.8,
//                                height: 50,
//                                decoration: BoxDecoration(
//                                  color: Color.fromRGBO(60, 111, 102, 1),
//                                  border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
//                                  borderRadius: BorderRadius.circular(25.0),
//                                ),
//                                child: Center(
//                                    child: new Text("ADD TO CART",
//                                        style: const TextStyle(
//                                            color: Colors.white,
//                                            fontWeight: FontWeight.w300,
//                                            fontStyle: FontStyle.normal,
//                                            fontSize: 15.0))),
//
//
//                              ),
//                            ),
//                            InkWell(
//                              //  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>MapSearch())),
//                              child: Container(
//
//                                  width: 50,
//                                  height: 50,
//                                  decoration: BoxDecoration(
//                                    color: Color.fromRGBO(220,220,220,1),
//                                    border: Border.all(color: Colors.white,),
//                                    borderRadius: BorderRadius.circular(25.0),
//                                  ),
//                                  child: Center(
//                                      child: new IconButton(icon: SvgPicture.asset('assets/shares.svg')
//                                      )
//                                  )
//                              ),
//                            ),
//
//                          ],
//                        )
//                    ),
//                  ],
//                ),
//
//
//              ],
//            ),
//          )
//
//
//        ],
//      ),
//    );
//
//
//  }
//
//
//
//
//
//
//  Widget productbuild() {
//    var image= product.image[index];
//
//    return Container(
//      height: MediaQuery.of(context).size.height/1.5,
//      decoration: BoxDecoration(
//          boxShadow: [
//            BoxShadow(
//                color: Color.fromRGBO(0, 0, 0, 0.05),
//                offset: Offset(0, -3),
//                blurRadius: 10)
//          ],
//          borderRadius: BorderRadius.only(
//              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
//          color: Colors.white),
//      child: ListView(
//        scrollDirection: Axis.vertical,
//        shrinkWrap: true,
//        physics: NeverScrollableScrollPhysics(),
////          controller: _scrollController,
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.all(8.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
////            mainAxisAlignment: MainAxisAlignment.center,
////            mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding:
//                      const EdgeInsets.only( bottom: 10.0),
//                      child: Container(
//                        height: 100,
//                        width: 100,
//                        child: Image.asset(
//
//                          image,
//                          fit: BoxFit.fill,
//
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top:5.0),
//                      child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
//                        card,
//                      ]),
//                    ),
//                  ],
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.min,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.only(top:15.0,bottom: 5.0),
//                      child: Text(product.name ?? 'sadasdasd',
//                        style:
//                        TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top:10.0,bottom: 5.0),
//                      child: Text(product.desc ?? 'sadasdasd',textAlign: TextAlign.center,
//                        style:
//                        TextStyle(color: Colors.green,, fontSize: 16.0),),
//                    ),
//                    Row(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      mainAxisSize: MainAxisSize.min,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Padding(
//                          padding: EdgeInsets.only(top:4.0,),
//                          child: RatingBar(
//                            initialRating: product.ratings,
//                            minRating: 1,
//                            direction: Axis.horizontal,
//                            allowHalfRating: true,
//                            itemSize: 20,
//                            itemCount: 5,
//                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//                            itemBuilder: (context, _) => Icon(
//                              Icons.star,
//                              color: Colors.green,,
//                              size: 1,
//                            ),
//                            onRatingUpdate: (rating) {
//                              print(rating);
//                            },
//                          ),
//                        ),
//                        Padding(
//                          padding: EdgeInsets.only(left:10.0,top: 4.0),
//                          child: Text(product.totalRatings+ " ratings"??'No Ratings',
//                            style:
//                            TextStyle(color: Colors.black, fontSize: 10.0),),
//                        ),
//                      ],
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top:5.0,bottom: 5.0),
//                      child: Text('\$${product.price ?? 0.0}',
//                        style:
//                        TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),),
//                    ),
//                    Padding(
//                        padding: EdgeInsets.only(top:10.0,bottom: 20.0),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: <Widget>[
//                            InkWell(
//                              onTap: (){
//                                isFavorite = !isFavorite;
//                                setState(() {
//                                  //   c = Colors.green,;
//                                });
//                              },
//                              child: Container(
//
//                                width: 50,
//                                height: 50,
//                                decoration: BoxDecoration(
//                                  color: Color.fromRGBO(220,220,220,1),
//                                  border: Border.all(color: Colors.white,),
//                                  borderRadius: BorderRadius.circular(25.0),
//                                ),
//                                child: Center(
//                                    child: isFavorite ? Icon(
//                                      Icons.bookmark,
//                                      color: Color.fromRGBO(60, 111, 102, 1),
//                                    ): Icon(Icons.bookmark)),
//
//
//                              ),
//                            ),
//                            InkWell(
//
//                              child: Container(
//
//                                width: MediaQuery.of(context).size.width /1.8,
//                                height: 50,
//                                decoration: BoxDecoration(
//                                  color: Color.fromRGBO(60, 111, 102, 1),
//                                  border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
//                                  borderRadius: BorderRadius.circular(25.0),
//                                ),
//                                child: Center(
//                                    child: new Text("ADD TO CART",
//                                        style: const TextStyle(
//                                            color: Colors.white,
//                                            fontWeight: FontWeight.w300,
//                                            fontStyle: FontStyle.normal,
//                                            fontSize: 15.0))),
//
//
//                              ),
//                            ),
//                            InkWell(
//                              //  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>MapSearch())),
//                              child: Container(
//
//                                  width: 50,
//                                  height: 50,
//                                  decoration: BoxDecoration(
//                                    color: Color.fromRGBO(220,220,220,1),
//                                    border: Border.all(color: Colors.white,),
//                                    borderRadius: BorderRadius.circular(25.0),
//                                  ),
//                                  child: Center(
//                                      child: new IconButton(icon: SvgPicture.asset('assets/shares.svg')
//                                      )
//                                  )
//                              ),
//                            ),
//
//                          ],
//                        )
//                    ),
//                  ],
//                ),
//
//
//              ],
//            ),
//          )
//
//
//        ],
//      ),
//    );
//
//
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    if(b == 0){
//      card = cards(context);
//      builds = productbuild();
//    }
//    else{
//      card = decorcards(context);
//      builds = decorbuild();
//    }
//    return builds;
//
//  }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
///**/