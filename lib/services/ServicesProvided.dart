import 'package:flutter/material.dart';
import 'package:last_mile/favourites/favourite_list.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/models/Cart.dart';
import 'package:last_mile/services/service_list.dart';

import '../search/SearchPage.dart';
import '../Settings.dart';
import '../carts/cart.dart';
import '../carts/cartListing.dart';
import '../customization/colors.dart';
import '../favourites/favourites.dart';
import '../carts/fullCart.dart';

class ServicesProvided extends StatefulWidget {

  int a;
  ServicesProvided(this.a);
  @override
  _FavouritesState createState() => _FavouritesState(this.a);
}

class _FavouritesState extends State<ServicesProvided> {
  int a;
  _FavouritesState(this.a);
  String timelines = 'Subscriptions';
  String selectedTimeline = 'Manage your premium subscriptions';
  Widget appBar (){
    return  Container(
      padding: EdgeInsets.only(top:20.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.search)),
          Text('Subscriptions',style: TextStyle(fontSize: 13,color: lightblack,fontFamily: 'aveb        '),),
          IconButton(
              icon: Icon(Icons.clear), onPressed: ()  =>Navigator.of(context).pop(),),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              appBar(),

              Padding(
                padding: EdgeInsets.only(top:20.0),
                child: Text(
                  timelines,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'aveh',
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20.0),
                child: Text(
                  selectedTimeline,
                  textAlign: TextAlign.center,
                  style: TextStyle(

                      fontSize: 14,
                      fontFamily: 'aveb',
                      color: lightblack),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: ServiceList(),

              ),

            ],
          ),

        ),
      ),
    );
  }
}
