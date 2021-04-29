import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/carts/fullCart.dart';
import 'package:last_mile/category/categoryListing.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/global.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/models/Cart.dart';
import 'package:last_mile/models/Decor.dart';
import 'package:last_mile/models/category.dart';
import 'package:last_mile/models/favourite.dart';
import 'package:last_mile/models/laundry.dart';
import 'package:last_mile/products/product_page.dart';
import 'package:last_mile/products/productdetail.dart';
import 'package:last_mile/products/productlisting.dart';
import 'package:last_mile/reviews/reviewPage.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../customization/color_list.dart';
import '../main.dart';
import '../models/product.dart';

class Carts extends StatefulWidget {
  final Product product;
  final Category category;
  final Laundry laundry;
  final int laund;
  final int inds;
  final int indexes;
  final int Vendorid;

  const Carts(
      {Key key,
      this.product,
      this.category,
      this.laundry,
      this.inds,
      this.indexes,
      this.laund,
      this.Vendorid})
      : super(key: key);

  @override
  Cart createState() => Cart(this.product, this.category, this.laundry,
      this.inds, this.indexes, this.laund,this.Vendorid );
}

class Cart extends State<Carts> {
  final Product product;
  final Category category;
  final Laundry laundry;
  final int inds;
  final int indexes;
  final int laund;
  final int Vendorid;

  double _variantswidth = 6.7;
  ProgressDialog pr;
  var diff = "";

  Cart(this.product, this.category, this.laundry, this.inds, this.indexes,
      this.laund,this.Vendorid);

  var sample;

  void initState() {
    pr = new ProgressDialog(context);
    if (inds == 1) {
      sample = product;
      int a = sample.image.length;
      if (a == 1) {
        _variantswidth = 6.7;
      } else if (a == 2) {
        _variantswidth = 3.5;
      } else if (a == 3) {
        _variantswidth = 2.5;
      } else if (a == 4) {
        _variantswidth = 1.8;
      } else if (a >= 5) {
        _variantswidth = 1.4;
      }
    } else if (inds == 2) {
      sample = laundry;
    } else {
      sample = category;
    }
    index = 0;
    // TODO: implement initState
    super.initState();
  }

  saveonfav(int ind) {
    if (globalfav == null) {
      globalfav = new List();
    }
    var a = globalfav.where((element) =>
        element.unique == sample.id[0].toString() + sample.id[ind].toString());
    if (a.length == 0) {
      globalfav.add(
        Favourite(
            unique: sample.id[0].toString() + sample.id[ind].toString(),
            id: sample.id[ind],
            name: sample.name,
            image: sample.image[ind],
            price: sample.price[ind]),
      );
      final String encodedData = Favourite.encodeMusics(globalfav);
      MyApp.sharedPreferences.setString("fav", encodedData);
    } else {
      globalfav.removeWhere((element) =>
          element.unique ==
          sample.id[0].toString() + sample.id[ind].toString());
      final String encodedData = Favourite.encodeMusics(globalfav);
      MyApp.sharedPreferences.setString("fav", encodedData);
//      setState(() {
//        fav = sample.fav[ind];
//      });
    }
  }

  waitaddtocart(int ind) async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (API.success == 'true') {
        globalcart.add(
          CartModel(
              unique: sample.id[0].toString() + sample.id[ind].toString(),
              id: sample.id[ind],
              name: sample.name,
              image: sample.image[ind],
              price: sample.price[ind],
              qty: 1,
              subtotal: sample.price[ind],
              vendorId: sample.vid,
            subscribe: subs,
            package: subs.toString()=="1"?package:null,
            dated: subs.toString()=="1"?Dated:null,


          ),
        );
        final String encodedData = CartModel.encodeMusics(globalcart);
        MyApp.sharedPreferences.setString("cart", encodedData);
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FullCart(
              a: 0,
            )));
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (_) => MainPage(1, 0, laund, "", "")));
      } else if (API.success == 'error') {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FullCart(
              a: 0,
            )));
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (_) => MainPage(1, 0, laund, "", "error")));
      } else {
        waitaddtocart(ind);
      }
    });
  }

  saveoncart(int ind) {
    if (globalcart == null) {
      globalcart = new List();
    }
    var a = globalcart.where((element) =>
        element.unique == sample.id[0].toString() + sample.id[ind].toString());
    if (a.length == 0) {
      API.Addtocart(sample.id[ind], sample.name, 1, sample.price[ind]);
      waitaddtocart(ind);
    } else {
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => FullCart(
            a: 0,
          )));
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
//      globalcart.removeWhere((element) => element.unique ==  sample.id[0].toString()+ sample.id[ind].toString());
//      final String encodedData = CartModel.encodeMusics(globalcart);
//      MyApp.sharedPreferences.setString("cart", encodedData);
    }
  }

  Widget Addtocartbutton(var diff) {
    if (diff == "") {
      return Center(

          child: Container(
            child: Container(

              width: MediaQuery.of(context).size.width /1.5,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(60, 111, 102, 1),
                border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                borderRadius: BorderRadius.circular(25.0),
              ),

              child:
              Center(
                  child: new Text(
                      subs.toString()!="1"?
                      "ADD TO CART":"SUBSCRIBE",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0))




              ),



            ),


          )
      );
    } else {
      diff = "";
      return Row(
        children: [
          Center(
              child: new Text("      ADD TO CART",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0))),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
          ),
        ],
      );
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  var imag;
  var disc;
  var pric;
  var subs;
  var fav;
  static const double itemExtent = 50.0;

  Widget cards(context) {
//    return
//      Padding(
//        padding: EdgeInsets.only(right: 5.0),
//        child:   GestureDetector(
//          onTap: () {
//            setState(() {
//              index = 0;
//            });
//          },
//          child: Container(
//              decoration: BoxDecoration(
//                border: Border.all(color: Colors.white),
//              ),
//              height: 50,
//              width: 50,
//              child:
//              CircleAvatar(
//                backgroundImage: NetworkImage(sample.image[1]),
//              )
//          ),
//        ),
//      );
    int a = sample.image.length;

    return Expanded(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: a,
            itemBuilder: (context, inde) {
              return Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = inde;
                              imag = sample.image[inde];
                              disc = sample.desc[inde];
                              pric = sample.price[inde];
                              subs=sample.subscription[inde];
                              fav = sample.fav[inde];
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                              ),
                              height: 50,
                              width: 50,
                              child: Image(
                                image:
                                    NetworkImage(sample.image[inde]),
                              )),
                        ),
                      )
                    ]),
              );
            }),
      ),
    );


  }

  String day ='Day';
  String week ='Week';
  String month ='Month';
  String package;
  String Dated;

  Color hexToColor(int rgb) => new Color(0xFF000000 + rgb);
  static DateTime selected;

  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            //  primarySwatch: buttonTextColor,//OK/Cancel button text color
            primaryColor: const Color.fromRGBO(60, 111, 102, 1),
            canvasColor: const Color.fromRGBO(60, 111, 102, 1),//Head background
            accentColor: const Color.fromRGBO(60, 111, 102, 1),//selection color
            //dialogBackgroundColor: Colors.white,//Background color
          ),
          child: child,
        );
      },
    );

    setState(() {
      if(selected != null)
      {
        day =selected.day.toString();
        week = selected.weekday.toString();
        month = selected.month.toString();
        Dated=selected.toString();
        setState(() {
          diff = "add";
        });
        saveoncart(index);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24),bottomRight: Radius.circular(24),bottomLeft: Radius.circular(24))),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20),
                      child: Text('Subscribe by',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              package="day";
                            });

                            _showDateTimePicker();
                          },
                          child: Container(

                            width: MediaQuery.of(context).size.width /1.5,
                            height: 50,
                            decoration: BoxDecoration(
                              color: green,
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(25.0),
                            ),

                            child: Center(
                                child: new Text("Daily",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.0))),



                          ),
                        )
                    ),


                    Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
                      child: Container(

                        width: MediaQuery.of(context).size.width /1.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(60, 111, 102, 1),
                          border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                        child: InkWell(
                          onTap: () {
                            setState(() {
                              package="week";
                            });
                            _showDateTimePicker();

                          },
                          child: Center(
                              child: new Text("Weekly",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0))),
                        ),



                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
                      child: Container(

                        width: MediaQuery.of(context).size.width /1.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(60, 111, 102, 1),
                          border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                        child: InkWell(
                          onTap: () {
                            setState(() {
                              package="month";
                            });
          _showDateTimePicker();
          },
                          child: Center(
                              child: new Text("Monthly",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0))),
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
    }
    // index = 0;
    imag = sample.image[index];
    disc = sample.desc[index];
    pric = sample.price[index];
    subs=sample.subscription[index];
    fav = sample.fav[index];

    return Container(
      height: MediaQuery.of(context).size.height/2.3,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, -3),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          color: Colors.white),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
//          controller: _scrollController,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Container(
                          height: 100,
                          width: 140,
                          child: Image(
                            image: NetworkImage(imag),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width / _variantswidth,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              cards(context),
                            ]),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0,left: 10,right: 10),
                      child: Text(
                        sample.name ?? 'sadasdasd',
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,

                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text(
                          disc ?? 'sadasdasd',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(color: Colors.green, fontSize: 16.0),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: 4.0,
                          ),
                          child: RatingBar(
                            initialRating: double.parse(sample.ratings[index]),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 20,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.green,
                              size: 1,
                            ),
//                            onRatingUpdate: (rating) {
//                              print(rating);
//                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, top: 4.0),
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => ReviewPage())),
                            child: Text(
                              sample.totalRatings + " ratings" ?? 'No Ratings',
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 15.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Text(
                        '\$${pric ?? 0.0}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                saveonfav(index);
                                //sample.fav[index] = !fav;
                                setState(() {
                                  //   c = Colors.green,;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(220, 220, 220, 1),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Center(
                                    child: globalfav.where((element) => element.unique == sample.id[0].toString() +
                                                        sample.id[index]
                                                            .toString())
                                                .length !=
                                            0
                                        ? Icon(
                                            Icons.bookmark,
                                            color:
                                                Color.fromRGBO(60, 111, 102, 1),
                                          )
                                        : Icon(Icons.bookmark)),
                              ),
                            ),
                            InkWell(
                              onTap: () {

                                if(  subs.toString()=="1")
                                  {
                                    _showDialog();

                                  }
                                else{
                                  setState(() {
                                    diff = "add";
//                                  Addtocartbutton(diff);
                                  });
                                  saveoncart(index);
                                }






                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.75,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(60, 111, 102, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(60, 111, 102, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Addtocartbutton(diff),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (inds == 1) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => ProductDetail(
                                            product: product,
                                            category: null,
                                            inds: inds,
                                          )));
                                } else if (inds == 0) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => ProductDetail(
                                            product: null,
                                            category: categories[indexes],
                                            inds: inds,
                                          )));
                                }
                              },
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(220, 220, 220, 1),
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Center(
                                      child: new IconButton(
                                          icon: SvgPicture.asset(
                                              'assets/shares.svg')))),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );



  }
}

/**/
