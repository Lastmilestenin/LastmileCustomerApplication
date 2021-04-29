import 'package:flutter/material.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/favourites/favourite_list.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/models/Cart.dart';
import 'package:last_mile/purchased/purchasedList.dart';

import '../search/SearchPage.dart';
import '../services/ServicesProvided.dart';
import '../Settings.dart';
import '../carts/cart.dart';
import '../carts/cartListing.dart';
import '../customization/colors.dart';
import '../favourites/favourites.dart';
import '../carts/fullCart.dart';
import 'ordersHistory.dart';

class DeliveryStatus extends StatefulWidget {
  int a;
  DeliveryStatus(this.a);
  @override
  _FavouritesState createState() => _FavouritesState(this.a);
}

class _FavouritesState extends State<DeliveryStatus> {
  int a;
  _FavouritesState(this.a);
  bool isActive=true;
  String timelines = 'Delivery Status';
  String selectedTimeline = 'All of your delivery history and subscriptions are maintained here';
  Widget appBar (){
    return  Container(
      padding: EdgeInsets.only(top:20.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => MainPage(0,0,0, "" , "")))),
          Text('Delivery Status',style: TextStyle(fontSize: 15,color: lightblack,fontFamily: 'aveb'),),
          IconButton(
              icon: Icon(Icons.search,color: Colors.white,)),
        ],
      ),
    );
  }
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
      if(_selectedIndex == 1){
     //   Navigator.of(context).push(MaterialPageRoute(builder:(_)=>DeliveryStatus()));
      }
      else if(_selectedIndex == 2){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => FullCart(a: a,)));
      }
      else if(_selectedIndex == 3){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Favourites(a)));
      }
      else if(_selectedIndex == 4){
        Navigator.of(context).push(MaterialPageRoute(builder:(_)=>Setting(a,'Paypal')));
      }
      else{
        Navigator.of(context).push(MaterialPageRoute(builder:(_)=>MainPage(0,0,a,"" , "")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(child: Image.asset('assets/Icons-icon-home.png',color: Colors.black,)),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Container(child: Image.asset('assets/Symbols.png',color: isActive ? Color.fromRGBO(60, 111, 102, 1)
                : Colors.black,)),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Container(child: Image.asset('assets/Icons-icon-shopping-bag.png',color: Colors.black,)),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Container(child: Image.asset('assets/Icons-icon-bookmark.png',color: Colors.black,)),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Container(child: Image.asset('assets/Icons-icon-settings.png',color: Colors.black,)),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
      ),
     
      body: SingleChildScrollView(
        child: Container(
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
                        color: lightGrey),
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Last Purchased',style: TextStyle(fontSize: 20.0,fontFamily: 'aveh',color: lightblack),
                    ),
                    Spacer(),
                    Text(
                      'See All ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'aveh',
                        color: green,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:3),
                      child: Image.asset("assets/doublearrow.png"),
                    )

                  ],
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: PurchasedList(),

                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'On their way',style: TextStyle(fontSize: 18.0,fontFamily: 'aveh',color: lightblack),
                          ),
                          Spacer(),
                          InkWell(
                            child: Text(
                              'See All ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'aveh',
                                color: green,
                              ),
                            ),
                            onTap: ()=> Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) => OrderHistory())),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:3),
                            child: Image.asset("assets/doublearrow.png"),
                          )

                        ],
                      ),
                      Text(inprogressList.length.toString(),style: TextStyle(fontSize: 18.0,fontFamily: 'aveh',color: lightblack),),
                    ],
                  )
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Scheduled',style: TextStyle(fontSize: 18.0,fontFamily: 'aveh',color: lightblack),
                            ),
                            Spacer(),
                            InkWell(
                              child: Text(
                                'See All ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'aveh',
                                  color: green,
                                ),
                              ),
                              onTap: ()=>  Navigator.of(context).push(MaterialPageRoute(builder:(_)=>ServicesProvided(a))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:3),
                              child: Image.asset("assets/doublearrow.png"),
                            )

                          ],
                        ),
                        Text('4',style: TextStyle(fontSize: 18.0,fontFamily: 'aveh',color: lightblack),),
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Delivery History',style: TextStyle(fontSize: 18.0,fontFamily: 'aveh',color: lightblack),
                            ),
                            Spacer(),
                            InkWell(
                              child: Text(
                                'See All ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'aveh',
                                  color: green,
                                ),
                              ),
                              onTap: ()=> Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) => OrderHistory())),  ),
                            Padding(
                              padding: const EdgeInsets.only(top:3),
                              child: Image.asset("assets/doublearrow.png"),
                            )

                          ],
                        ),
                        Text('4',style: TextStyle(fontSize: 18.0,fontFamily: 'aveh',color: lightblack),),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
