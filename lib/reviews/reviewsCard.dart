import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:last_mile/orders/OrderListing.dart';
import 'package:last_mile/carts/cartProducts.dart';
import 'package:last_mile/models/Reviews.dart';
import 'package:last_mile/orders/orderStatus.dart';

import '../customization/colors.dart';
import '../models/Cart.dart';
import '../models/Orders.dart';


class ReviewsCard extends StatelessWidget {

  final Reviews reviews;

  const ReviewsCard({Key key, this.reviews}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 0.0),

      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Row(
                children: <Widget>[
                  Container(

                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                      child:Image.asset(

                        reviews.image,

                        fit: BoxFit.fill,
                      ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0,top: 10.0),
                        child: Text(reviews.name,style: TextStyle(fontSize: 16.0,color: lightblack,fontFamily: 'aveb'),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20.0,top: 5.0),
                            child: RatingBar(
                              initialRating: reviews.ratings,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 13,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: lightbrown,
                                size: 5,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                        //  Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: 70.0,top: 10.0),
                            child: Text(reviews.date,style: TextStyle(fontSize: 12.0,color: lightblack,fontFamily: 'aveb'),),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 50.0,top: 10.0),
                  child: Text(reviews.review,style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top:20.0,left: 0.0),
                      child: InkWell(
                        child: Container(

                          width: MediaQuery.of(context).size.width /3,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(5.0),
                          ),

                          child: Center(
                              child: new Text("Helpful?",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0))),



                        ),
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(top:20.0,left: 20.0),
                      child: InkWell(
                        child: Container(

                          width: MediaQuery.of(context).size.width /3,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black,),
                            borderRadius: BorderRadius.circular(5.0),
                          ),

                          child: Center(
                              child: new Text("Not Helpful?",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0))),



                        ),
                      )
                  ),
                ],
              ),
              Divider(endIndent: 20.0,indent: 20.0,)
            ],
          ),
        ),
      ),
    );
  }


}
