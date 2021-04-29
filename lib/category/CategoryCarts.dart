import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_mile/carts/fullCart.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/models/Decor.dart';
import 'package:last_mile/models/category.dart';

import '../mainPage.dart';
import '../models/product.dart';

class CategoryCarts extends StatefulWidget {
  final Category product;

  const CategoryCarts({Key key, this.product}) : super(key: key);
  @override
  CategoryCart createState() => CategoryCart(this.product);

}
class CategoryCart extends State<CategoryCarts> {


  final Category product;

  CategoryCart(this.product);

//  int a;
//  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }
  Widget cards(context){
    int a = product.image.length;
    if(a == 2){
      return Padding(
        padding: const EdgeInsets.only(top:14.0),
        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                  image = product.image[index];
                  return image;
                  //img(image);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 1;
                  image = product.image[index];
                  // img(image);
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[1],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
        ]),
      );
    }
    else if(a ==3)
    {
      return Padding(
        padding: const EdgeInsets.only(top:14.0),
        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 1;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[1],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 2;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[2],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
        ]),
      );
    }
    else if(a == 4)
    {
      return Padding(
        padding: const EdgeInsets.only(top:14.0),
        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 1;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[1],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 2;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[2],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 3;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[3],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),

        ]),
      );
    }
    else if(a > 4)
    {
      return Padding(
        padding: const EdgeInsets.only(top:14.0),
        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 1;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[1],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 2;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[2],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 3;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[3],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 4;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[4],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
        ]),
      );
    }
    else
    {
      return
        Padding(
          padding: EdgeInsets.only(right: 5.0),
          child:   GestureDetector(
            onTap: () {
              setState(() {
                index = 0;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              height: 50,
              width: 50,
              child: Image.asset(
                product.image[0],
                fit: BoxFit.fill,

              ),
            ),
          ),
        );
    }

  }

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    // index = 0;

    var image= product.image[index];
    var disc = product.desc[index];
    var pric = product.price[index];
    return Container(
          height: MediaQuery.of(context).size.height/1.5,
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
            physics: NeverScrollableScrollPhysics(),
//          controller: _scrollController,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.only( bottom: 10.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(

                              image,
                              fit: BoxFit.fill,

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:14.0),
                          child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                            cards(context),
                          ]),
                        ),
                      ],
                    ),
                   Container(
                     color: Colors.white,
                     child:  Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[

                         Padding(
                           padding: EdgeInsets.only(top:15.0,bottom: 5.0),
                           child: Text(product.name ?? 'sadasdasd',
                             style:
                             TextStyle(color: Colors.black, fontSize: 20.0,fontFamily: 'aveh'),),
                         ),
                         Padding(
                           padding: EdgeInsets.only(top:10.0,bottom: 5.0),
                           child: Text(disc ?? 'sadasdasd',textAlign: TextAlign.center,
                             style:
                             TextStyle(color: Colors.green, fontSize: 16.0),),
                         ),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Padding(
                               padding: EdgeInsets.only(top:4.0,),
                               child: RatingBar(
                                 initialRating: product.ratings,
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
                                 onRatingUpdate: (rating) {
                                   print(rating);
                                 },
                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.only(left:10.0,top: 4.0),
                               child: Text(product.totalRatings+ " ratings"??'No Ratings',
                                 style:
                                 TextStyle(color: Colors.black, fontSize: 10.0),),
                             ),
                           ],
                         ),
                         Padding(
                           padding: EdgeInsets.only(top:5.0,bottom: 5.0),
                           child: Text('\$${pric ?? 0.0}',
                             style:
                             TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold),),
                         ),
                         Padding(
                             padding: EdgeInsets.only(top:10.0,bottom: 20.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 InkWell(
                                   onTap: (){
                                     isFavorite = !isFavorite;
                                     setState(() {
                                       //   c = Colors.green,;
                                     });
                                   },
                                   child: Container(

                                     width: 50,
                                     height: 50,
                                     decoration: BoxDecoration(
                                       color: Color.fromRGBO(220,220,220,1),
                                       border: Border.all(color: Colors.white,),
                                       borderRadius: BorderRadius.circular(25.0),
                                     ),
                                     child: Center(
                                         child: isFavorite ? Icon(
                                           Icons.bookmark,
                                           color: Color.fromRGBO(60, 111, 102, 1),
                                         ): Icon(Icons.bookmark)),


                                   ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                     Navigator.of(context).pop();
                                     Navigator.of(context).push(MaterialPageRoute(
                                         builder: (_) => FullCart(
                                           a: 0,
                                         )));
                                   },
                                   //Navigator.of(context).push(MaterialPageRoute(builder:(_)=>MainPage(1,1,0, "" ,""))),
                                   child: Container(

                                     width: MediaQuery.of(context).size.width /1.8,
                                     height: 50,
                                     decoration: BoxDecoration(
                                       color: Color.fromRGBO(60, 111, 102, 1),
                                       border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                                       borderRadius: BorderRadius.circular(25.0),
                                     ),
                                     child: Center(
                                         child: new Text("ADD TO CART",
                                             style: const TextStyle(
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.w300,
                                                 fontStyle: FontStyle.normal,
                                                 fontSize: 15.0))),


                                   ),
                                 ),
                                 InkWell(
                                     onTap: (){

                                     },
                                   child: Container(

                                     width: 50,
                                     height: 50,
                                     decoration: BoxDecoration(
                                       color: Color.fromRGBO(220,220,220,1),
                                       border: Border.all(color: Colors.white,),
                                       borderRadius: BorderRadius.circular(25.0),
                                     ),
                                     child: Center(
                                         child: new IconButton(icon: SvgPicture.asset('assets/shares.svg')))),


                                   ),

                               ],
                             )
                         ),
                       ],
                     ),
                   )


                  ],
                ),
              )


            ],
          ),
        );


  }
}




















/**/