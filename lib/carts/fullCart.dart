import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/carts/cartProducts.dart';
import 'package:last_mile/components/style.dart';
import 'package:last_mile/credentials/loginPage.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/orders/orderDetails.dart';
import 'package:last_mile/credentials/signUpPage.dart';
import 'package:last_mile/customization/index.dart';
import '../global.dart';
import '../main.dart';
import '../orders/DeliveryStatus.dart';
import '../Settings.dart';
import '../customization/colors.dart';
import '../favourites/favourites.dart';
import '../models/Cart.dart';
import 'dart:io' show Platform;

class FullCart extends StatefulWidget {
  final CartModel cart;
  final int a;
  static var subtotal = 0.0, shipping = 0.0, total = 0.0;

  FullCart({Key key, this.cart, this.a}) : super(key: key);

  @override
  _FullCart createState() => _FullCart(this.cart, this.a);
}

class _FullCart extends State<FullCart> {
  final CartModel cart;
  final int a;
  _FullCart stateObject;
  var listheight = 80.0;
  List<CartModel> searchResults;
  int _selectedIndex = 0;
  bool isActive=true;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  _FullCart(this.cart, this.a);

  String _radioValue; //Initial definition of radio button value
  String choice;

  @override
  void initState() {
    FullCart.subtotal = 0.0;
    FullCart.shipping = 0.0;
    FullCart.total = 0.0;
    var a = globalcart.length;
    if (a == 0) {
      setState(() {
        listheight = 80.0;

      });
    } else if (a == 1) {
      setState(() {
        listheight = 100.0;
      });
    } else if (a == 2) {
      setState(() {
        listheight = 180.0;
      });
    } else {
      setState(() {
        listheight = 260.0;
      });
    }
    generatecostt(context);
    //FullCart.generatecost(context);
    setState(() {
      _radioValue = "one";
    });
    super.initState();
    searchResults = globalcart;
  }

  generatecostt(BuildContext context) {
    for (var cost in globalcart) {
      FullCart.subtotal += double.parse(cost.price.toString()) *
          double.parse(cost.qty.toString());
    }
    setState(() {
      FullCart.subtotal;
      FullCart.shipping = 0.0;
      FullCart.total = FullCart.subtotal + FullCart.shipping;
    });
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          shippingmethod = 'one';
          shippingprice = 0.0;
          globalshippingtype = '(Free)';
          FullCart.shipping = 0.0;
          FullCart.total = FullCart.subtotal + FullCart.shipping;
          break;
        case 'two':
          choice = value;
          shippingmethod = 'one';
          FullCart.shipping = 40.0;
          shippingprice = 40.0;
          globalshippingtype = '(Express)';
          FullCart.total = FullCart.subtotal + FullCart.shipping;
          break;
        case 'three':
          choice = value;
          shippingmethod = 'one';
          shippingprice = 80.0;
          FullCart.shipping = 80.0;
          globalshippingtype = '(Premium)';
          FullCart.total = FullCart.subtotal + FullCart.shipping;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => DeliveryStatus(a)));
      } else if (_selectedIndex == 0) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => MainPage(0, 0, a, "", "")));
      } else if (_selectedIndex == 2) {
//        Navigator.of(context)
//            .push(MaterialPageRoute(builder: (_) => FullCart(cart:cart[0])));
      } else if (_selectedIndex == 3) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Favourites(a)));
      } else if (_selectedIndex == 4) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Setting(a, 'Paypal')));
      }
    });
  }

  static void _showDialog(BuildContext context) {
    // flutter defined function

    if (MyApp.sharedPreferences.getString('token') != null) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => OrderDetails(adr:globaladdressvar)));
    } else {
      if (!Platform.isIOS) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24))),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20),
                        child: Text(
                          'Sign in',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, fontFamily: 'sansb'),
                        ),
                      ),

                      Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 10),
                          child: InkWell(
                            // onTap: () => Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (_) =>
                            //             OrderDetails(adr:globaladdressvar))),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: 50,
                              decoration: BoxDecoration(
                                color: green,
                                border: Border.all(color: green),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Center(
                                  child: new Text("CONTINUE AS GUEST",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          letterSpacing: 2.2,
                                          fontFamily: 'sansb'))),
                            ),
                          )),

                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20),
                        child: Text(
                          'Already have an account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: lightblack,
                              fontFamily: 'aveh'),
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 111, 102, 1),
                            border: Border.all(
                              color: Color.fromRGBO(60, 111, 102, 1),
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => LoginPage())),
                            child: Center(
                              child: new Text("Login".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2.2,
                                      fontFamily: 'robotob',
                                      fontSize: 15.0)),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 111, 102, 1),
                            border: Border.all(
                              color: Color.fromRGBO(60, 111, 102, 1),
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => SignUpPage())),
                            child: Center(
                              child: new Text("Sign up".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 2.2,
                                      fontFamily: 'sansb',
                                      fontSize: 15.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      } else {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return CupertinoAlertDialog(



//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24),bottomRight: Radius.circular(24),bottomLeft: Radius.circular(24))),
//            <Widget>
              actions: [
                CupertinoDialogAction(child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Sign in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0, fontFamily: 'aveh', color: Colors.black),
                    ),
                    Spacer(),
                    Icon(Icons.cancel,size: 30,),
                  ],
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                ),
                CupertinoDialogAction(

                    isDefaultAction: true,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: green,
                        border: Border.all(color: green),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                          child: new Text("CONTINUE AS GUEST",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 2.2,
                                  fontFamily: 'aveb'))),
                    ),
                  // onPressed: () => Navigator.of(context)
                  //               .push(MaterialPageRoute(builder: (_) => OrderDetails(adr:globaladdressvar))),
                ),

                CupertinoDialogAction(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Already have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                          color: lightblack,
                          fontFamily: 'aveh'),
                    ),
                  ),
                ),

                CupertinoDialogAction(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(60, 111, 102, 1),
                      border: Border.all(
                        color: Color.fromRGBO(60, 111, 102, 1),
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                        child: new Text("Login".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.2,
                                fontFamily: 'aveb',
                                fontSize: 15.0))),
                  ),
                  onPressed:() => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => LoginPage())),
                ),

                CupertinoDialogAction(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(60, 111, 102, 1),
                      border: Border.all(
                        color: Color.fromRGBO(60, 111, 102, 1),
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                        child: new Text("Sign up".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.2,
                                fontFamily: 'aveb',
                                fontSize: 15.0))),

                  ),
                  onPressed:() => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SignUpPage())),
                ),

                // usually buttons at the bottom of the dialog
//                Center(
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20),
//                        child: Text('Sign in',textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0 , fontFamily: 'aveh'),),
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
//                          child: InkWell(
//                            onTap: () => Navigator.of(context)
//                                .push(MaterialPageRoute(builder: (_) => OrderDetails(globaladdressvar))),
//                            child: Container(
//
//                              width: MediaQuery.of(context).size.width /1.5,
//                              height: 50,
//                              decoration: BoxDecoration(
//                                color: green,
//                                border: Border.all(color: green),
//                                borderRadius: BorderRadius.circular(25.0),
//                              ),
//
//                              child: Center(
//                                child: new Text("CONTINUE AS GUEST",
//                                  style: const TextStyle(
//                                      color: Colors.white,
//                                      fontSize: 15.0,
//                                      letterSpacing: 2.2,
//                                      fontFamily: 'aveb'
//                                  )
//                                )
//                              ),
//                            ),
//                          )
//                      ),
//
//                      Padding(
//                        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20),
//                        child: Text('Already have an account?',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0,color: lightblack, fontFamily: 'aveh'),),
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
//                        child: Container(
//
//                          width: MediaQuery.of(context).size.width /1.5,
//                          height: 50,
//                          decoration: BoxDecoration(
//                            color: Color.fromRGBO(60, 111, 102, 1),
//                            border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
//                            borderRadius: BorderRadius.circular(25.0),
//                          ),
//
//                          child: InkWell(
//                            onTap: () =>
//                                Navigator.of(context)
//                                    .push(MaterialPageRoute(builder: (_) => LoginPage())),
//                            child: Center(
//                                child: new Text("Login".toUpperCase(),
//                                    style: const TextStyle(
//                                        color: Colors.white,
//                                        letterSpacing: 2.2,
//                                        fontFamily: 'aveb',
//                                        fontSize: 15.0))),
//                          ),
//                        ),
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
//                        child: Container(
//
//                          width: MediaQuery.of(context).size.width /1.5,
//                          height: 50,
//                          decoration: BoxDecoration(
//                            color: Color.fromRGBO(60, 111, 102, 1),
//                            border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
//                            borderRadius: BorderRadius.circular(25.0),
//                          ),
//
//                          child: InkWell(
//                            onTap: () =>
//                                Navigator.of(context)
//                                    .push(MaterialPageRoute(builder: (_) => SignUpPage())),
//                            child: Center(
//                                child: new Text("Sign up".toUpperCase(),
//                                    style: const TextStyle(
//                                        color: Colors.white,
//                                        letterSpacing: 2.2,
//                                        fontFamily: 'aveb',
//                                        fontSize: 15.0))),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                )
              ],
            );
          },
        );
      }
    }
  }

  //Widget one = CartProduct();

  Widget topHeader = Padding(
      padding: const EdgeInsets.only(left: 17.0),
      child: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Text(
          'Order Items',style: sansb18heading,
        ),
      ));

  Widget positioncard(BuildContext context) {
    return Positioned(
      bottom: 1.0,
      child: Padding(
        padding: EdgeInsets.only(top: 0.0),
        child: Container(
            height:169,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24), topLeft: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 20, right: 20.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Subtotal',style: robrwhite,
                        ),
                        Spacer(),
                        Text(
                          '\$' + FullCart.subtotal.toString(),
                          style: robrwhite
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 7, right: 20.0,bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Shipping',
                            style: //TextStyle(color: Colors.white)
                            robrwhite
                        ),
                        Spacer(),
                        Text(
                          globalshippingtype +
                              ' - \$' +
                              FullCart.shipping.toString(),
                            style: robrwhite
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 5, right: 20.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'TOTAL',
                          style: robr16bwhite,
                        ),
                        Spacer(),
                        Text(
                          '\$' + FullCart.total.toString(),
                          style: robr16bwhite
                        ),
                      ],
                    )),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                    child: Padding(

                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(

                       onTap:() {
                         userid=MyApp.sharedPreferences.getString("userid").toString();
                       //  API.getuseloc(getlocationsURL+userid);
                        _showDialog(context);
                       },
                        child: Container(

                          width: MediaQuery.of(context).size.width /1.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 111, 102, 1),
                            border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                            borderRadius: BorderRadius.circular(25.0),
                          ),

                          child: Center(
                              child: new Text("PLACE ORDER",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'sansb',
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0))),



                        ),
                      ),
                    )),
                SizedBox(height: 5,)
              ],
            )),
      ),
    );
  }


  Widget CartProduct(BuildContext context) {
    return Center(
      child: Container(
        // height: listheight,
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height/4.8 ,
        child: ListView.builder(
          // shrinkWrap: false,
          //   scrollDirection: Axis.vertical,
            itemCount: globalcart.length,
            itemBuilder: (_, index) {
              return ShowCarts(globalcart[index], context,) ;
              // ShowCarts(globalcart[index], context,)
            }),
      ),
    );
  }

  Widget ShowCarts(CartModel cart, BuildContext context) {
    return InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 70,
              width: 70,
              child: Center(
                child: Image(
                  image: NetworkImage(cart.image),
                  //radius: 80,
                ),
              ),
            ),
            SizedBox(width: 5,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 4.0,
                  ),
                  child: Container(
                    width: 130,
                    child: Text(
                      cart.name,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontFamily: 'aveb'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 4.0,
                  ),
                  child: Text(
                    '\$${cart.price ?? 0.0}',
                    textAlign: TextAlign.center,
                    style: robrb
                  ),
                ),
              ],
            ),
            Spacer(),
            new Row(
              children: <Widget>[
                cart.qty != 0
                    ? new IconButton(
                        icon: new Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                        onPressed: () =>
                            setState(() => decrement(cart)),
                      )
                    : new Container(),
                new Text(
                  cart.qty.toString(),
                  style: TextStyle(fontFamily: 'aveb'),
                ),
                new IconButton(
                    icon: new Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: () =>
                        setState(() => increment(cart)))
              ],
            ),
          ],
        ));
  }

  // Widget ShowCarts(CartModel cart, BuildContext context) {
  //   return InkWell(
  //       child: Row(
  //         //  mainAxisSize: MainAxisSize.max,
  //         children: <Widget>[
  //           Container(
  //             height: 70,
  //             width: 60,
  //             child: Center(
  //               child: Image(
  //                 image: NetworkImage(cart.image),
  //                 // radius: 80,
  //               ),
  //             ),
  //           ),
  //           SizedBox(width: 5,),
  //           Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Padding(
  //                 padding: EdgeInsets.only(
  //                   top: 0.0,
  //                 ),
  //                 child: Text(
  //                   cart.name,
  //                   textAlign: TextAlign.left,
  //                   style: TextStyle(
  //                       fontSize: 13.0,
  //                       color: Colors.black,
  //                       fontFamily: 'aveb'),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(
  //                   top: 4.0,
  //                 ),
  //                 child: Text(
  //                   '\$${cart.price ?? 0.0}',
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                       fontSize: 20.0,
  //                       color: Colors.black,
  //                       fontFamily: 'aveh'),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 60,width: 50,),
  //           new Row(
  //             children: <Widget>[
  //               cart.quantity != 0
  //                   ? new IconButton(
  //                 icon: new Icon(
  //                   Icons.remove,
  //                   color: Colors.black,
  //                 ),
  //                 onPressed: () =>
  //                     setState(() => decrement(cart)),
  //               )
  //                   : new Container(),
  //               new Text(
  //                 cart.quantity.toString(),
  //                 style: TextStyle(fontFamily: 'aveb'),
  //               ),
  //               new IconButton(
  //                   icon: new Icon(
  //                     Icons.add,
  //                     color: Colors.black,
  //                   ),
  //                   onPressed: () =>
  //                       setState(() => increment(cart)))
  //             ],
  //           ),
  //         ],
  //       ));
  //
  // }


  increment(CartModel cart) {
    cart.qty = int.parse(cart.qty.toString()) + 1;
//    var i = globalcart.indexWhere((element) => element.unique == cart.unique.toString());
//    globalcart.replaceRange(i, i+1, [CartModel(
//        unique: cart.unique ,
//        id: cart.id,
//        name: cart.name,
//        image: cart.image,
//        price: cart.price,
//        quantity: cart.quantity),]);
    final String encodedData = CartModel.encodeMusics(globalcart);
    MyApp.sharedPreferences.setString("cart", encodedData);
    setState(() {
      FullCart.subtotal += double.parse(cart.price);
      FullCart.total = FullCart.subtotal + FullCart.shipping;
    });
  }

  decrement(CartModel cart) {
    cart.qty = int.parse(cart.qty.toString()) - 1;
    if (cart.qty > 0) {
      final String encodedData = CartModel.encodeMusics(globalcart);
      MyApp.sharedPreferences.setString("cart", encodedData);
      setState(() {
        FullCart.subtotal -= double.parse(cart.price);
        FullCart.total = FullCart.subtotal + FullCart.shipping;
      });
    } else {
      cart.qty = int.parse(cart.qty.toString()) - 1;
      globalcart.removeWhere((element) => element.unique == cart.unique);
      final String encodedData = CartModel.encodeMusics(globalcart);
      MyApp.sharedPreferences.setString("cart", encodedData);

      setheight();
      setState(() {
        FullCart.subtotal -= double.parse(cart.price);
        FullCart.total = FullCart.subtotal + FullCart.shipping;
      });
      Get.snackbar(
        "DELETE",
        "Item deleted",
        icon: Icon(Icons.delete),
        shouldIconPulse: true,
        barBlur: 20,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        isDismissible: true,
        duration: Duration(seconds: 4),
      );
    }
  }


  setheight() {
    var a = globalcart.length;
    setState(() {
      if (a == 0) {
        setState(() {
          listheight = 80.0;
        });
      } else if (a == 1) {
        setState(() {
          listheight = 100.0;
        });
      } else if (a == 2) {
        setState(() {
          listheight = 180.0;
        });
      } else {
        setState(() {
          listheight = 260.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      padding: EdgeInsets.only(top: 20.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
        },
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }
              // } Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (_) => MainPage(0,0,0 , " " , ""))),
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.31,
              child: Center(
                child: Text(
                  'Order Details',
                  style: sansb18heading,
                ),
              ),
            )
          ],
        ),
      ),
    );
    Widget carts = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 15.0),
          child: Text(
            'Shipping Method',
            style: sansb18heading
          ),
        ),
        Row(
          children: <Widget>[
            new Radio(
              activeColor: green,
              value: 'one',
              groupValue: _radioValue,
              onChanged: radioButtonChanges,
            ),
            new Text(
              'Standard Shipping (16 days)',
              style: robr
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: new Text(
                'FREE',
                style: robrgreen
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            new Radio(
              activeColor: green,
              value: 'two',
              groupValue: _radioValue,
              onChanged: radioButtonChanges,
            ),
            new Text(
              'Express (8 days)',
              style:robr
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: new Text(
                '\$40',
                style:robr
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            new Radio( activeColor: green,
              value: 'three',
              groupValue: _radioValue,
              onChanged: radioButtonChanges,
            ),
            new Text(
              'Premium (1 day)',
              style:robr
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: new Text(
                '\$80',
                style: robr
              ),
            )
          ],
        ),
      ],
    );

    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Container(
      //           child: Image.asset(
      //         'assets/Icons-icon-home.png',
      //         color: Colors.black,
      //       )),
      //       title: Text(''),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Container(
      //           child: Image.asset(
      //         'assets/Symbols.png',
      //         color: Colors.black,
      //       )),
      //       title: Text(''),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Container(
      //           child: Image.asset(
      //         'assets/Icons-icon-shopping-bag.png',
      //             color: isActive ? Color.fromRGBO(60, 111, 102, 1)
      //                 : Colors.black,
      //       )),
      //       title: Text(''),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Container(
      //           child: Image.asset(
      //         'assets/Icons-icon-bookmark.png',
      //       )),
      //       title: Text(''),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Container(
      //           child: Image.asset(
      //         'assets/Icons-icon-settings.png',
      //         color: Colors.black,
      //       )),
      //       title: Text(''),
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.2, 0.1],
            colors: [
              Colors.black,
              Colors.grey[100],
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 90.0),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(0.0),
                    height: MediaQuery.of(context).size.height / 1,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.2, 0.1],
                        colors: [
                          Colors.black,
                          Colors.white,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        topHeader,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: globalcart.length == 0 ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Center(
                                child: Text("Please Add Items in cart",
                                  style:
                                  TextStyle(fontSize: 14.0, fontFamily: 'aveb', color: lightblack),
                                ),
                              ),
                            ),
                          ): CartProduct(context),
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: carts,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              positioncard(context),
              appBar,
            ],
          ),
        ),
      ),
    );
  }
}
