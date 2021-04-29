
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:last_mile/decors/Decors.dart';
import 'package:last_mile/products/product_list.dart';
import 'package:last_mile/reviews/reviewList.dart';
import '../category/cateogry_listPage.dart';
import '../customization/colors.dart';



class ReviewPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

String timelines = 'Reviews';

class _MainPageState extends State<ReviewPage> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget appBar = Container(
      padding: EdgeInsets.only(top:10.0),

      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.of(context).pop(),),


        ],
      ),
    );
    return Scaffold(

        body: Container(
         // height: MediaQuery.of(context).size.height,
          color: Colors.grey[50],


          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.of(context).pop(),),
                              Padding(
                                padding: EdgeInsets.only(top:0.0),
                                child:  Text(
                                  timelines,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: darkGrey),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.clear,color: Colors.transparent,), ),
                            ],
                          ),
                        ),
                        RatingBar(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 20,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.green,
                            size: 5,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child:Container(
                                  padding: EdgeInsets.all(10.0,),
                                  height: MediaQuery.of(context).size.height/1.2,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],


                                  ),
                                  child: ReviewList(),
                                )
                            ),
                          ],
                        ),





                      ],
                    ),
                  ),
                ] ),
          ),
        ),
      );
  }
}

