import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/products/productCard.dart';
import 'package:last_mile/profile/profile.dart';
import 'categorySeeAll.dart';
import 'customization/index.dart';
import 'models/product.dart';
import 'shops/shopCard.dart';
import 'package:last_mile/global.dart';
import 'package:last_mile/components/style.dart';

class FeatureProductsSeeAll extends StatefulWidget {
  final Product product;
  final int ind;


  const FeatureProductsSeeAll({Key key,this.ind, this.product}) : super(key: key);

  @override
  _FeatureProductsSeeAllState createState() => _FeatureProductsSeeAllState(this.product,this.ind);
}

class _FeatureProductsSeeAllState extends State<FeatureProductsSeeAll> {
  final int ind;
  final Product product;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);
    super.initState();
    //img(image);

  }
  _FeatureProductsSeeAllState(this.product,this.ind);
  String img(image)
  {


    return image;

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
    //               backgroundImage: AssetImage('assets/rectangle.jpg'),
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
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    globalAppbar(),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          height: 50,
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
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Featured Stores',
                          style: sansb22,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: GridView.builder(
                            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.9,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: vendorList.length,
                            itemBuilder: (_, index) {
                              return MainPage.productlist[index].status=="1"?ProductCard(
                                ind: index,
                                product: MainPage.productlist[index],
                              ):Container(
                                // height: 100,
                                width: 350,
                                child: Center(child: Text("No item")),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
