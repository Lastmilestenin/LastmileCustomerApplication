// import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:last_mile/components/style.dart';

import '../categorySeeAll.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:last_mile/components/style.dart';
// import 'package:last_mile/customization/index.dart';
// import 'package:last_mile/profile/profile.dart';
// import 'package:last_mile/search/SearchPage.dart';
//
// import '../global.dart';


class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  TabController _tabController;

  @override

  Widget build(BuildContext context) {

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
    //               child: Text("",
    //                 //     globaladdressvar.toString(),
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
    //           InkWell(onTap: () {
    //             //  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()),);
    //           },
    //             child: CircleAvatar(
    //               backgroundImage: AssetImage('assets/rectangle.jpg'),
    //               radius: 25.0,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    var size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xFFF7F7F7),

      body: Container(
        height: size.height/1,
        width: size.width/1,
        child: SingleChildScrollView(
          child: Column(
              children: [
                globalAppbar(),
                SizedBox(height: 12,),
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
                              position % 2 == 0 ? 'assets/rectangle(1).jpg' : 'assets/rectangle.jpg',
                              fit: BoxFit.fill,
                            ),
                        ),
                      );
                    },
                  ),
                ),
                //shop details
                Container(
                  margin: EdgeInsets.all(20),
                  height: size.height/8.5,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Habbit', style: sansb22,),
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
                      Container(
                          width: size.width,
                          child: Text('A ONE-STOP COMPLETE HOME SOLUTION  ',maxLines: 1, style: robr10,)),
                      Text('Time: 10:00 am - 11:00 pm Location: ABC Road, Karachi Pakistan', style: robr10,),
                      Text('Location: ABC Road, Karachi Pakistan', style: robr10,),
                    ],
                  ),
                ),
                //shop search
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.1,
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
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 15, right: 15),
                        hintText: "Search"),
                  ),
                ),
                SizedBox(height: 10),
                heading(text: 'Featured Products', onTap: () {}),
                //featured stores list
                Container(

                    height: MediaQuery.of(context).size.height / 3.6,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration( color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: MediaQuery.of(context).size.height / 3.6,
                              width: MediaQuery.of(context).size.width/2.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: Image.asset(
                                      'assets/rectangle(1).jpg',
                                      fit: BoxFit.fill,
                                      width: 165,
                                      height: 135,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8, right: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:size.width,
                                          child: Text(

                                            'Two chairs with table',style: TextStyle(
                                              fontFamily: 'roboto'
                                          ),
                                            maxLines: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3.0),
                                          child: Text('£ 5.000',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'roboto')),
                                        ),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
                //All prducts
                heading(text: 'All Products', onTap: () {}),

//             Container(
//               width: size.width/1,
//
//               padding: const EdgeInsets.all(8.0),
//
// color: Colors.white,
//               child: ContainedTabBarView(
//                 tabs: [
//                   Text('Bedding', style: robr12black,),
//                   Text('Little Habbits',style: robr12black),
//                   Text('Little Habbits',style: robr12black),
//                   Text('Little Habbits',style: robr12black),
//                   Text('Little Habbits',style: robr12),
//                   Text('Little Habbits',style: robr12),
//
//                 ],
//                 views: [
//                   Container(color: Colors.red),
//                   Container(color: Colors.green)
//                 ],
//                 onChange: (index) => print(index),
//               ),
//             )
              ]),
        ),
      ),),);
  }
}


class heading extends StatelessWidget {
  @override
  Function onTap;
  String text;
  heading({@required this.text, @required this.onTap});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 30),
      child: Container(
          width: MediaQuery.of(context).size.width / 1,
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sansb'),
              ),
              Spacer(),
              InkWell(
                onTap: onTap,
                child: Container(
                  child: Row(
                    children: [
                      Text(('See all'),
                          style: TextStyle(
                              color: Color(0xFFC3C6F66),
                              fontSize: 14,
                              fontFamily: 'sansr')),
                      Icon(
                        Icons.double_arrow_sharp,
                        size: 12,
                        color: Color(0xFFC3C6F66),
                      )
                    ],
                  ),
                ),
              )

            ],
          )),
    );
  }
}