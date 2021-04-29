//
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:last_mile/CategoryCarts.dart';
//import 'package:last_mile/product_page.dart';
//
//
//import 'DecorListing.dart';
//import 'cart.dart';
//import 'index.dart';
//import 'productlisting.dart';
//import 'models/Decor.dart';
//import 'models/product.dart';
//
//
//
//class DecorCard extends StatefulWidget {
//  final Decor product;
//  final int ind;
//
//  const DecorCard({Key key,this.ind, this.product}) : super(key: key);
//  @override
//  DecorCards createState() => DecorCards(this.product,this.ind);
//
//}
//class DecorCards extends State<DecorCard> {
//  final int ind;
//  final Decor product;
//  @override
//  void initState() {
//    // TODO: implement initState
//
//    // img(image);
//
//
//    super.initState();
//    //img(image);
//
//  }
//  DecorCards(this.product,this.ind);
//  String img(image)
//  {
//
//
//    return image;
//
//  }
//  Widget cards(context){
//    int a = product.image.length;
//    if(a == 2){
//      return Padding(
//        padding: const EdgeInsets.only(top:14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: () {
//                setState(() {
//                  index = 0;
//                  image = product.image[index];
//                  return image;
//                  //img(image);
//                });
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[0],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 1;
//                  image = product.image[index];
//                  // img(image);
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[1],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//        ]),
//      );
//    }
//    else if(a ==3)
//    {
//      return Padding(
//        padding: const EdgeInsets.only(top:14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: () {
//                setState(() {
//                  index = 0;
//                });
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[0],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 1;
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[1],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 2;
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[2],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//        ]),
//      );
//    }
//    else if(a == 4)
//    {
//      return Padding(
//        padding: const EdgeInsets.only(top:14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: () {
//                setState(() {
//                  index = 0;
//                });
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[0],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 1;
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[1],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 2;
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[2],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 3;
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[3],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//
//        ]),
//      );
//    }
//    else if(a > 4)
//    {
//      return Padding(
//        padding: const EdgeInsets.only(top:14.0),
//        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: () {
//                setState(() {
//                  index = 0;
//                });
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[0],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 1;
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[1],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 2;
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[2],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 3;
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[3],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(right: 5.0),
//            child:   GestureDetector(
//              onTap: (){
//                setState(() {
//                  index = 4;
//                });
//
//              },
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.black),
//                ),
//                height: 50,
//                width: 50,
//                child: Image.asset(
//                  product.image[4],
//                  fit: BoxFit.fill,
//
//                ),
//              ),
//            ),
//          ),
//        ]),
//      );
//    }
//    else
//    {
//      return
//        Padding(
//          padding: EdgeInsets.only(right: 5.0),
//          child:   GestureDetector(
//            onTap: () {
//              setState(() {
//                index = 0;
//              });
//            },
//            child: Container(
//              decoration: BoxDecoration(
//                border: Border.all(color: Colors.black),
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
//
//  }
//
//  void picture(image)
//  {
//    index = 0;
//    image= product.image[index];
//    showModalBottomSheet(
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(24.0),
//        ),
//        context: context,
//        builder: (BuildContext bc){
//          return DecorCarts(product:decors[ind]);
//        }
//
//
//    );
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//        padding: const EdgeInsets.symmetric(horizontal: 8.0),
//        child: Container(
//            padding: EdgeInsets.all(0.0,),
//            child: InkWell(
//              onTap: () =>
//
//                  setState(() {
//                    picture(image);
//                  }),
//
//                child: Container(
//                    padding: EdgeInsets.all(8.0,),
//                    height: MediaQuery.of(context).size.height,
//                    decoration: BoxDecoration(
//
//                      color: Colors.green,,
//                    ),
//                    child: Column(
//                      mainAxisSize: MainAxisSize.min,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Padding(
//                          padding: EdgeInsets.only(left:0.0),
//                          child: Container(
//                            height: 100,
//                            width: 120,
//                            child: Image.asset(
//
//                                      product.image[0],
//                                      fit: BoxFit.fill,
//                                    ),
//                          ),
//                        ),
//
//
//                        Align(
//                          alignment: Alignment.center,
//                          child: Padding(
//                            padding: EdgeInsets.only(top:8.0,),
//                            child: Text(
//                              product.name,
//                              textAlign: TextAlign.left,
//                              style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w300,color: Colors.black),
//                            ),
//                          ),
//                        ),
//
//
//                        Padding(
//                          padding: EdgeInsets.only(top:8.0,),
//                          child: Text(
//                            '\$${product.price[0] ?? 0.0}',
//                            textAlign: TextAlign.left,
//                            style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.black),
//                          ),
//                        ),
//
//
//                      ],
//                    )
//
//
//
//                )
//            )
//        )
//    );
//  }
//}
//
//
//
