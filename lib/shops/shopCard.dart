

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/classes/Distance.dart';
import 'package:last_mile/components/style.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/customization/splashscreen.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/models/Decor.dart';
import 'package:last_mile/models/product.dart';
import 'package:last_mile/models/shops.dart';
import 'package:last_mile/models/vendor.dart';
import 'package:last_mile/products/product_page.dart';
import 'package:progress_dialog/progress_dialog.dart';


class ShopCard extends StatefulWidget {
  final Vendor vendor;
  final Shops shop;


   ShopCard({Key key, this.vendor , this.shop}) : super(key: key);

  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
   int a = 0;
   ProgressDialog pr;

   waitactivity(int index) async {
     await Future.delayed(const Duration(seconds: 2), (){
       if(API.success == 'true'){
         pr.hide();
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => MainPage(widget.vendor.address,widget.vendor.rating,widget.vendor.id , widget.vendor.name , vendorimage)));
       }
       else{
         waitactivity(index);
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(context);
    var size = MediaQuery.of(context).size;
    Product product;
    Decor decor;

    if(Distance.distance(SplashScreen.center.latitude, SplashScreen.center.longitude, double.parse(widget.vendor.latitude), double.parse(widget.vendor.longitude)) <7000)
    {
      return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 25),
          child: InkWell(
            onTap: (){
            
              vendorname = widget.vendor.name;
              vendorid = widget.vendor.id;
              vendorrating = widget.vendor.rating;
              vendorimage=widget.vendor.image;

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainPage(widget.vendor.address,widget.vendor.rating,widget.vendor.id , widget.vendor.name , vendorimage)));
            } ,
            child:
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: size.width/1,
                height: size.height / 8.6,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: Image.network(
                           widget.vendor.image,
                          fit: BoxFit.fill,
                          height: 100,
                          width: 120,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.vendor.name,style: robr)),
                        RatingBar(
                                                        initialRating: double.parse(widget.vendor.rating == null? '0.0':widget.vendor.rating),
                          unratedColor: Colors.grey[300],

                          minRating: double.parse(widget.vendor.rating.toString()),
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          // itemPadding: EdgeInsets.all(15.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xFF69CF02),
                          ),
                          // onRatingUpdate: (rating) {
                          //   print(rating);
                          // },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
//
//             Card(
//               child: ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(5)),
//                   child: Container(
//                       padding: EdgeInsets.all(10.0,),
//                       height: MediaQuery.of(context).size.height/3,
//                       width: MediaQuery.of(context).size.width/3,
//                       color: Colors.white,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             height: 70,
//                             width: MediaQuery.of(context).size.width/3,
//                             child: Center(
//                               child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(5),
//                                   child: Image.network(vendor.image,fit: BoxFit.fill,width: MediaQuery.of(context).size.width/3,height: 70,))
//                             ),
//                           ),
//
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                               padding: EdgeInsets.only(top:4.0,),
//                               child: Text(
//                                 vendor.name,
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: 'aveb'),
//                               ),
//                             ),
//                           ),
//
//
//
// //                          Align(
// //                            alignment: Alignment.center,
// //                            child: Padding(
// //                              padding: EdgeInsets.only(top:4.0,),
// //                              child: Text(
// //                                shop.deliverytime,
// //                                textAlign: TextAlign.left,
// //                                style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w300,color: Colors.black),
// //                              ),
// //                            ),
// //                          ),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                               padding: EdgeInsets.only(top:4.0,),
//                               child: RatingBar(
//                                 initialRating: double.parse(vendor.rating == null? '0.0':vendor.rating),
//                                 minRating: 1,
//                                 direction: Axis.horizontal,
//                                 allowHalfRating: true,
//                                 itemSize: 15,
//                                 itemCount: 5,
//                                 itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//                                 itemBuilder: (context, _) => Icon(
//                                   Icons.star,
//                                   color: Colors.green,
//                                   size: 1,
//                                 ),
// //                              onRatingUpdate: (rating) {
// //                                print(rating);
// //                              },
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                   )
//               ),
//             ),
          )
      );

    }
    else{
      return Container();
    }

  }
}



