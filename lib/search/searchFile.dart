import 'dart:ui';
import 'package:last_mile/components/style.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../categorySeeAll.dart';


class SearchPAge extends StatefulWidget {
  @override
  _SearchPAgeState createState() => _SearchPAgeState();
}

class _SearchPAgeState extends State<SearchPAge> {
  final List<String> category = <String>[
    'assets/rectangle.jpg',
    'assets/rectangle.jpg',
    'assets/rectangle.jpg'
  ];
  final List<String> category_name = <String>['Delizia', 'Delizia', 'Delizia'];

  final List<String> featured = <String>[
    'assets/rectangle.jpg',
    'assets/rectangle.jpg',
    'assets/rectangle.jpg'
  ];
  final List<String> featured_name = <String>['Levis', 'Habbit', 'Denizen'];
  final List<String> featured_dt = <String>['15 mins', '15 mins', '15 mins'];
  final List<String> featured_rating = <String>[];

  final List<String> new_shops = <String>[
    'assets/rectangle.jpg',
    'assets/rectangle.jpg',
    'assets/rectangle.jpg'
  ];

  Widget search_field() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          height: 50,
          width: MediaQuery.of(context).size.width / 1.2,
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 15, right: 15),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black)),
          ),
        ));
  }

  Widget category_list() {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 20, top: 5),
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    '${category[index]}',
                    fit: BoxFit.fill,
                    width: 165,
                    height: 165,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 4),
                child: Text(
                  'delizia',
                  style: robr,
                ),
              ),
            ],
          );
        });
  }

  Widget featured_store_list() {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 20, top: 5),
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ShopScreen()),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 165,
                height: MediaQuery.of(context).size.height / 3.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.asset(
                          '${category[index]}',
                          fit: BoxFit.fill,
                          width: 165,
                          height: 110,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${featured_name[index]},', style: robr),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 18,
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('${featured_dt[index]}', style: robr10),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RatingBar(
                        unratedColor: Colors.grey[300],
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        // itemPadding: EdgeInsets.all(15.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color(0xFF69CF02),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget new_shops_card() {
    return PageView.builder(
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  position % 2 == 0
                      ? 'assets/rectangle.jpg'
                      : 'assets/rectangle.jpg',
                  fit: BoxFit.fill,
                )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // Widget appBar = Card(
    //   elevation: 5,
    //   child: Container(
    //     height: kToolbarHeight + MediaQuery.of(context).padding.top / 4,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15),
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           InkWell(
    //             child: Icon(Icons.arrow_back),
    //             onTap: () {
    //               Navigator.pop(context);
    //             },
    //           ),
    //           SizedBox(
    //             width: 15,
    //           ),
    //           Container(
    //             width: MediaQuery.of(context).size.width / 2,
    //             child: Center(
    //               child: Text(
    //                 '',
    //                 //    globaladdressvar.toString(),
    //                 style: TextStyle(
    //                     fontSize: 13,
    //                     fontWeight: FontWeight.w300,
    //                     fontFamily: 'aveb',
    //                     letterSpacing: 2.2),
    //                 maxLines: 1,
    //               ),
    //             ),
    //           ),
    //           Spacer(),
    //           InkWell(
    //             onTap: (){
    //               // Navigator.push(
    //               //   context,
    //               //   MaterialPageRoute(builder: (context) => Profile()),
    //               // );
    //             },
    //             child: CircleAvatar(
    //
    //               backgroundImage: AssetImage('assets/rectangle.jpg'),
    //               radius: 25.0,
    //
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF7F7F7),
          resizeToAvoidBottomInset: false,
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    globalAppbar(),
                    SizedBox(
                      height: 5,
                    ),

                    //slider

                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      // width:  MediaQuery.of(context).size.width/1,
                      child: PageView.builder(
                        itemBuilder: (context, position) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(30)),
                                child: Image.asset(
                                  position % 2 == 0
                                      ? 'assets/rectangle.jpg'
                                      : 'assets/rectangle(1).jpg',
                                  fit: BoxFit.fill,
                                )),
                          );
                        },
                      ),
                    ),
                    search_field(),
                    //category
                    heading(text: 'Category', onTap: () {}),
                    Container(
                        height: size.height / 3.6,
                        width: size.width,
                        child: category_list()),
                    //featured store
                    heading(text: 'Featured Stores', onTap: () {}),
                    Container(
                        height: size.height / 3.6,
                        width: size.width,
                        child: featured_store_list()),
                    SizedBox(
                      height: 10,
                    ),

//new shops
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 8, 8, 0),
                            child: Text('New Shops', style: sansb22),
                          ),
                          Container(
                              height: size.height / 3.6,
                              width: size.width / 1,
                              child: new_shops_card()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    heading(text: 'Store Near You', onTap: () {}),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: size.width,
                        height: size.height / 8.6,
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                child: Image.asset(
                                  'assets/rectangle.jpg',
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 120,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('The vape shop', style: robr),
                                RatingBar(
                                  unratedColor: Colors.grey[300],
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  // itemPadding: EdgeInsets.all(15.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color(0xFF69CF02),
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class heading extends StatelessWidget {
  @override
  Function onTap;
  String text;
  heading({@required this.text, @required this.onTap});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Container(
          width: MediaQuery.of(context).size.width / 1,
          child: Row(
            children: [
              Text(
                text,
                style: sansb22,
              ),
              Spacer(),
              Text(('See all'),
                  style: TextStyle(color: Color(0xFFC3C6F66), fontSize: 14)),
              InkWell(
                  onTap: onTap,
                  child: Icon(
                    Icons.double_arrow_sharp,
                    size: 12,
                    color: Color(0xFFC3C6F66),
                  ))
            ],
          )),
    );
  }
}
