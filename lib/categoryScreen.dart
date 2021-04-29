import 'package:flutter/material.dart';
import 'package:last_mile/categorySeeAll.dart';
import 'package:last_mile/profile/profile.dart';
import 'customization/colors.dart';
import 'customization/index.dart';
import 'shops/shopCard.dart';
import 'package:last_mile/global.dart';
import 'package:last_mile/components/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategoryScreen extends StatefulWidget {
  int index;
  CategoryScreen({Key key, this.index}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
    //           SizedBox(width: 15),
    //           Container(
    //             width: MediaQuery.of(context).size.width / 2,
    //             child: Center(
    //               child: Text(
    //                 globaladdressvar.toString(),
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
    //             onTap: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => Profile()),
    //               );
    //             },
    //             child: CircleAvatar(
    //               backgroundImage: AssetImage('assets/'),
    //               radius: 25.0,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFF7F7F7),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    globalAppbar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 4.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              height: 50,width:  MediaQuery.of(context).size.width*0.8,
                              //width: MediaQuery.of(context).size.width / 1.2,
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
                                    hintText: "Search",
                                    hintStyle: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          vendorcatlist[widget.index].name ==null?'Clothings':vendorcatlist[widget.index].name.toString(),
                          style: sansb22,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 18,bottom: 10, top: 10
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: GridView.builder(
                            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.9,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 12
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: vendorcatidlist.length,
                            itemBuilder: (_, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),color: Colors.white,
                                ),


                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Image.network(
                                          vendorcatidlist[index].image == null
                                              ? "https://upload.wikimedia.org/wikipedia/commons/3/32/Flag_of_Pakistan.svg"
                                              : vendorcatlist[index].image,

                                          width: MediaQuery.of(context).size.width/1,
                                          fit: BoxFit.fill,
                                          height: 110,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 8, 0),
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Container(
                                              child:  Text( vendorcatidlist[index].name, style: robr),
                                              width: 100,
                                            ),

                                            Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 18,
                                            )
                                          ]),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //   const EdgeInsets.only(left: 8.0),
                                    //   child: Text('', style: robr10),
                                    // ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 8.0),
                                      child: RatingBar(
                                        unratedColor: Colors.grey[300],
                                        initialRating: double.parse(4.toString()) ,
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
                                        // onRatingUpdate: (rating) {
                                        //   print(rating);
                                        // },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              //
                              //   Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //
                              //
                              //     //  lkh
                              //     Padding(
                              //       padding: const EdgeInsets.all(5.0),
                              //       child: InkWell(
                              //         onTap: () {
                              //           // Navigator.push(
                              //           //   context,
                              //           //   MaterialPageRoute(builder: (context) => CategoryScreen()),
                              //           // );
                              //         },
                              //         child: Container(
                              //           child: ClipRRect(
                              //             borderRadius: BorderRadius.circular(10),
                              //             child: Image.network(
                              //               vendorcatidlist[index].image == null
                              //                   ? "https://upload.wikimedia.org/wikipedia/commons/3/32/Flag_of_Pakistan.svg"
                              //                   : vendorcatlist[index].image,
                              //               fit: BoxFit.fill,
                              //               width: 165,
                              //               height: 165,
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     Padding(
                              //       padding:
                              //           const EdgeInsets.only(left: 10.0, right: 4),
                              //       child: Text(
                              //         vendorcatidlist[index].name,
                              //         style: robr,
                              //       ),
                              //     )
                              //
                              //     // Container(
                              //     //     height: size.height / 3.6,
                              //     //     width: size.width,
                              //     //     child: ListView.builder(
                              //     //         padding: const EdgeInsets.only(left: 20, top: 5),
                              //     //         scrollDirection: Axis.horizontal,
                              //     //         itemCount: vendorList.length,
                              //     //         itemBuilder: (BuildContext context, int index) {
                              //     //           return Distance.distance(SplashScreen.center.latitude, SplashScreen.center.longitude, double.parse(vendorList[index].latitude), double.parse(vendorList[index].longitude)) <7000 && vendorList[index].feature=="1"? Padding(
                              //     //             padding: const EdgeInsets.all(5.0),
                              //     //             child: InkWell(
                              //     //               onTap: () {
                              //     //                 Navigator.of(context)
                              //     //                     .push(MaterialPageRoute(builder: (_) => MainPage(0,0,vendorList[index].id , vendorList[index].name , "")));
                              //     //               },
                              //     //               child: Container(
                              //     //                 decoration: BoxDecoration(
                              //     //                   color: Colors.white,
                              //     //                   borderRadius: BorderRadius.circular(10),
                              //     //                 ),
                              //     //                 width: 165,
                              //     //                 height: MediaQuery.of(context).size.height / 3.6,
                              //     //                 child: Column(
                              //     //                   mainAxisAlignment:
                              //     //                   MainAxisAlignment.start,
                              //     //                   crossAxisAlignment:
                              //     //                   CrossAxisAlignment.start,
                              //     //                   children: [
                              //     //                     Padding(
                              //     //                       padding:
                              //     //                       const EdgeInsets.only(bottom: 5),
                              //     //                       child: ClipRRect(
                              //     //                         borderRadius: BorderRadius.only(
                              //     //                             topLeft: Radius.circular(10),
                              //     //                             topRight: Radius.circular(10)),
                              //     //                         child: Image.network(
                              //     //                           vendorList[index].image,
                              //     //                           fit: BoxFit.fill,
                              //     //                           width: 165,
                              //     //                           height: 110,
                              //     //                         ),
                              //     //                       ),
                              //     //                     ),
                              //     //                     Padding(
                              //     //                       padding: const EdgeInsets.fromLTRB(
                              //     //                           8, 8, 8, 0),
                              //     //                       child: Row(
                              //     //                           mainAxisAlignment:
                              //     //                           MainAxisAlignment
                              //     //                               .spaceBetween,
                              //     //                           children: [
                              //     //                             Container(
                              //     //                               child:  Text(vendorList[index].name, style: robr),
                              //     //                               width: 100,
                              //     //                             ),
                              //     //
                              //     //                             Icon(
                              //     //                               Icons.favorite,
                              //     //                               color: Colors.red,
                              //     //                               size: 18,
                              //     //                             )
                              //     //                           ]),
                              //     //                     ),
                              //     //                     Padding(
                              //     //                       padding:
                              //     //                       const EdgeInsets.only(left: 8.0),
                              //     //                       child: Text('', style: robr10),
                              //     //                     ),
                              //     //                     Padding(
                              //     //                       padding:
                              //     //                       const EdgeInsets.only(left: 8.0),
                              //     //                       child: RatingBar(
                              //     //                         unratedColor: Colors.grey[300],
                              //     //                         initialRating: double.parse(vendorList[index].rating.toString()) ,
                              //     //                         minRating: 1,
                              //     //                         direction: Axis.horizontal,
                              //     //                         allowHalfRating: true,
                              //     //                         itemCount: 5,
                              //     //                         itemSize: 20,
                              //     //                         // itemPadding: EdgeInsets.all(15.0),
                              //     //                         itemBuilder: (context, _) => Icon(
                              //     //                           Icons.star,
                              //     //                           color: Color(0xFF69CF02),
                              //     //                         ),
                              //     //                         // onRatingUpdate: (rating) {
                              //     //                         //   print(rating);
                              //     //                         // },
                              //     //                       ),
                              //     //                     ),
                              //     //                   ],
                              //     //                 ),
                              //     //               ),
                              //     //             ),
                              //     //           ):Container();
                              //     //
                              //     //         })),
                              //   ],
                              // );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
