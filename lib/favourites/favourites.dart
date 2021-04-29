import 'package:flutter/material.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/models/favourite.dart';
import 'package:last_mile/orders/DeliveryStatus.dart';
import 'package:last_mile/favourites/favourite_list.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/models/Cart.dart';
import 'package:last_mile/models/Orders.dart';
import 'package:last_mile/orders/ordersCard.dart';

import '../main.dart';
import '../search/SearchPage.dart';
import '../services/ServicesProvided.dart';
import '../Settings.dart';
import '../carts/cart.dart';
import '../carts/cartListing.dart';
import '../customization/colors.dart';
import '../carts/fullCart.dart';
import '../orders/ordersHistory.dart';
import '../storeNearSeeAll.dart';

class Favourites extends StatefulWidget {
  int a;

  Favourites(this.a);

  @override
  _FavouritesState createState() => _FavouritesState(this.a);
}

class _FavouritesState extends State<Favourites> {
  int a;
  bool isActive=true;
  _FavouritesState(this.a);

  Widget appBar() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.clear),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Text(
            'Favourites'.toUpperCase(),
            style: TextStyle(fontSize: 15, fontFamily: 'sansb',color: lightblack),
          ),
          IconButton(icon: Icon(Icons.search),

          ),
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
      if(_selectedIndex==0){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SearchPage(0)));
      }
      if (_selectedIndex == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => StoreNearSeeAll()));
      } else if (_selectedIndex == 2) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FullCart(
              a: 0,
            )));
      } else if (_selectedIndex == 3) {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (_) => Favourites(0)));
      } else if (_selectedIndex == 4) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Setting(0, 'Paypal')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
      //         color: Colors.black,
      //       )),
      //       title: Text(''),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Container(
      //           child: Image.asset(
      //         'assets/Icons-icon-bookmark.png',
      //             color: isActive ? Color.fromRGBO(60, 111, 102, 1)
      //                 : Colors.black,
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
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: FavouriteList(),
              ),
              Spacer(),
//              Padding(
//                  padding: EdgeInsets.only(left: 60.0),
//                  child: InkWell(
//
//                    child: Container(
//
//                      width: MediaQuery.of(context).size.width /1.5,
//                      height: 50,
//                      decoration: BoxDecoration(
//                        color: Color.fromRGBO(60, 111, 102, 1),
//                        border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
//                        borderRadius: BorderRadius.circular(25.0),
//                      ),
//
//                      child: Center(
//                          child: new Text("Adjust Favourites",
//                              style: const TextStyle(
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.w300,
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0))),
//
//
//
//                    ),
//                  )
//              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: 0.0, top: 0.0, left: 60.0, right: 75.0),
                  child: InkWell(
                    onTap: () {
                      _showDialog();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                          child: new Text("CLEAR FAVOURITES",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'sansb',
                                  letterSpacing: 2.2,
                                  fontSize: 15.0))),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
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
          content: Container(
            child: Text(
              'Clear Favourites',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),

          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Row(
              children: [
                InkWell(
//                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                            builder: (_) => OrderDetails(
//                                'R88 Block 16/ Fedral B Area Karachi / Pakistan'))),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: green,
                      border: Border.all(color: green),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                        child: new Text("NO",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                fontSize: 15.0))),
                  ),
                ),
                SizedBox(width: 10,),
                InkWell(
                  onTap: () {
                    globalfav = new List();
                    final String encodedData = Favourite.encodeMusics(globalfav);
                    MyApp.sharedPreferences.setString("fav", encodedData);

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) =>
                            MainPage(0, 0, 0, "" , "")));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(60, 111, 102, 1),
                      border: Border.all(
                        color: Color.fromRGBO(60, 111, 102, 1),
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                        child: new Text("YES",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                fontSize: 15.0))),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
