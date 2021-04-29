import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/carts/fullCart.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/models/Cart.dart';
import 'package:last_mile/models/Decor.dart';
import 'package:last_mile/models/category.dart';
import 'package:last_mile/models/favourite.dart';
import 'package:last_mile/onRide.dart';
import 'package:last_mile/products/product_list.dart';
import 'package:last_mile/customization/tabbarview.dart';
import 'package:last_mile/reviews/reviewList.dart';

import '../customization/colors.dart';
import '../main.dart';
import '../mainPage.dart';
import '../models/product.dart';
import '../global.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  final Category category;
  final int inds;

  const ProductDetail({Key key, this.product, this.category, this.inds})
      : super(key: key);

  @override
  ProductDetails createState() =>
      ProductDetails(this.product, this.category, this.inds);
}

class ProductDetails extends State<ProductDetail>
    with TickerProviderStateMixin<ProductDetail> {
  final Product product;
  final Category category;
  var selectedindex=0;
  final int inds;
  TabController tabController;
  TabController bottomTabController;
  var sample;
  double _variantswidth = 6.7;
  var diff = "";

  ProductDetails(this.product, this.category, this.inds);

  int ind;




//  int a;
//  @override
  void initState() {
    // TODO: implement initState
    ind= 0;
    if (inds == 1) {
      sample = product;
      int a = sample.image.length;
      if(a==1){
        _variantswidth = 6.7;
      } else if(a==2){
        _variantswidth = 3.5;
      } else if(a==3){
        _variantswidth = 2.5;
      } else if(a==4){
        _variantswidth = 1.8;
      }else if(a>=5){
        _variantswidth = 1.4;
      }
    } else {
      sample = category;
    }
    index = 0;
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    bottomTabController = TabController(length: 1, vsync: this);
  }

  var imag;
  var disc;
  var pric;
  var desc;

  Widget cards(context) {
    int a = sample.image.length;

    return Expanded(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: a,
            itemBuilder: (context, inde) {
              return Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = inde;
                              imag = sample.image[inde];
                              disc = sample.desc[inde];
                              pric = sample.price[inde];
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                              ),
                              height: 50,
                              width: 50,
                              child: Image(
                                image:
                                    NetworkImage(sample.image[inde]),
                              )),
                        ),
                      )
                    ]),
              );
            }
            ),
      ),
    );


  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // index = 0;

    imag = sample.image[index];
    disc = sample.desc[index];
    pric = sample.price[index];

    Widget tabBar = TabBar(
      tabs: [
        InkWell(child: Tab(text: 'Description'),
          onTap: (){
          setState(() {
            selectedindex=0;
          });

          },

        ),
        InkWell(child: Tab(text: 'Reviews'),
        onTap: (){
          setState(() {
            selectedindex=1;
          });

        },
        ),
      ],
      labelStyle: TextStyle(fontSize: 20.0, fontFamily: 'aveh'),
      unselectedLabelStyle:
          TextStyle(fontSize: 20.0, fontFamily: 'aveh'),
      labelColor: Colors.black,
      indicatorColor: Color.fromRGBO(60, 111, 102, 1),
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      // physics: NeverScrollableScrollPhysics(),
      isScrollable: true,
      controller: tabController,

    );

    Widget cont = Container(
      // height: MediaQuery.of(context).size.height/1.39,
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
      child: Column(
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.only(top: 25,left: 10),
          //   child: Row(
          //     children: [
          //       InkWell(
          //         onTap: (){
          //           Navigator.of(context).pop();
          //         },
          //           child: Icon(Icons.arrow_back)
          //       ),
          //     ],
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
                    child: Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                                child: Icon(Icons.arrow_back)
                            ),
                          ],
                        ),
                  ),
                  ClipRRect(
                    borderRadius:BorderRadius.circular(10),
                    child: Container(
                      height: 200,
                      width: 350,

                      child: Image(
                        image: NetworkImage(imag),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Container(
                      width:
                      MediaQuery.of(context).size.width / _variantswidth,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            cards(context),
                          ]),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        sample.name ?? 'sadasdasd',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,

                        child: Text(
                          disc ?? 'sadasdasd',
                          textAlign: TextAlign.center,

                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.green, fontSize: 16.0),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: 4.0,
                          ),
                          child: RatingBar(
                            initialRating: double.parse(sample.ratings[index]),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 20,
                            itemCount: 5,
                            itemPadding:
                                EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.green,
                              size: 1,
                            ),
//                                    onRatingUpdate: (rating) {
//                                      print(rating);
//                                    },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10.0, top: 4.0),
                          child: Text(
                            sample.totalRatings + " ratings" ??
                                'No Ratings',
                            style: TextStyle(
                                color: Colors.black, fontSize: 10.0),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0,),
                      child: Text(
                        '\$${pric ?? 0.0}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
//                            tabBar,
//                            TabBarView(
//                              controller: tabController,
//                              children: <Widget>[
//                                Container(color: Colors.yellow),
//                                Container(color: Colors.red),
//                                Container(color: Colors.purple),
////                                   TabView(
////                                    tabController: tabController,
////                                  ),
//                              ],
//                            )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          child: Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      saveonfav(index);
                      //isFavorite = !isFavorite;
                      setState(() {
                        //   c = Colors.green,;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(220, 220, 220, 1),
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                          child: globalfav.where((element) => element.unique == sample.id[0].toString()+ sample.id[index].toString()).length != 0
                              ? Icon(
                                  Icons.bookmark,
                                  color: Color.fromRGBO(60, 111, 102, 1),
                                )
                              : Icon(Icons.bookmark)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        diff = "add";
//                                  Addtocartbutton(diff);
                      });
                      saveoncart(index);
                      },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(60, 111, 102, 1),
                        border: Border.all(
                          color: Color.fromRGBO(60, 111, 102, 1),
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Addtocartbutton(diff),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //       width: 50,
                  //       height: 50,
                  //       decoration: BoxDecoration(
                  //         color: Color.fromRGBO(220, 220, 220, 1),
                  //         border: Border.all(
                  //           color: Colors.white,
                  //         ),
                  //         borderRadius: BorderRadius.circular(25.0),
                  //       ),
                  //       child: Center(
                  //           child: new IconButton(
                  //               icon: SvgPicture.asset('assets/shares.svg')))),
                  // ),
                ],
              )),
        ),
        body: Container(

          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            height: MediaQuery.of(context).size.height/1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
          //  height:1040,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  cont,
                  // Container(
                  //     height: 30,
                  //     child: tabBar),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20,right: 20),
                  //   child: Container(
                  //     height: 200,
                  //
                  //     child: TabBarView(
                  //       controller: bottomTabController,
                  //       physics: NeverScrollableScrollPhysics(),
                  //      // physics: NeverScrollableScrollPhysics(),
                  //       children: <Widget>[
                  //         SafeArea(
                  //           child: NestedScrollView(
                  //             body: TabView(
                  //               tabController: tabController,
                  //               desc: "•  "+sample.name,
                  //             ),
                  //             headerSliverBuilder: (BuildContext context,
                  //                 bool innerBoxIsScrolled) {
                  //               // These are the slivers that show up in the "outer" scroll view.
                  //               return <Widget>[
                  //                 SliverToBoxAdapter(),
                  //               ];
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        InkWell(
                          child: Container(

                            height: 40,
                            width: MediaQuery.of(context).size.width/2.3,
                            child: Center(

                              child: Text("Description", style: TextStyle(fontSize: 20.0, fontFamily: 'aveh'),),
                            ),
                            decoration: BoxDecoration(
                              border: Border(

                                bottom: BorderSide(width: 2.0, color: ind==0?Color.fromRGBO(60, 111, 102, 1):Colors.white),
                              ),
                              color: Colors.white,
                            ),


                          ),
                          onTap: (){
                            setState(() {

                              ind=0;
                            });
                          },
                        ),
                        InkWell(
                          child: Container(

                            height: 40,
                            width: MediaQuery.of(context).size.width/2.3,
                            child: Center(

                              child: Text("Reviews",style: TextStyle(fontSize: 20.0, fontFamily: 'aveh'),),),
                            decoration: BoxDecoration(
                              border: Border(

                                bottom: BorderSide(width: 2.0, color: ind==1?Color.fromRGBO(60, 111, 102, 1):Colors.white),
                              ),
                              color: Colors.white,
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              ind=1;
                            });

                          },
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: ind==0?true:false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 100,
                        child: Center(
                          child: Text( "•  "+sample.name,
                            //desc == null?Text("Hello") :desc,
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible:  ind==1?true:false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 300,
                        child: ReviewList(),

                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        'Similar Products',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontFamily: 'aveh'),
                      ),

                      ProductList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  waitaddtocart(int ind) async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (API.success == 'true') {
        globalcart.add(
          CartModel(
              unique: sample.id[0].toString() + sample.id[ind].toString(),
              id: sample.id[ind],
              name: sample.name,
              image: sample.image[ind],
              price: sample.price[ind],
              qty: 1,
              vendorId: vendorid,
              subtotal: "2",

          ),
        );
        final String encodedData = CartModel.encodeMusics(globalcart);
        MyApp.sharedPreferences.setString("cart", encodedData);
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FullCart(
              a: 0,
            )));
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (_) => MainPage(1, 0, 0, "", "")));
      } else if (API.success == 'error') {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FullCart(
              a: 0,
            )));
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (_) => MainPage(1, 0, 0, "", "error")));
      } else {
        waitaddtocart(ind);
      }
    });
  }

  saveoncart(int ind) {
    if (globalcart == null) {
      globalcart = new List();
    }
    var a = globalcart.where((element) =>
    element.unique == sample.id[0].toString() + sample.id[ind].toString());
    if (a.length == 0) {
      API.Addtocart(sample.id[ind], sample.name, 1, sample.price[ind]);
      waitaddtocart(ind);
    } else {
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => FullCart(
            a: 0,
          )));
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (_) => MainPage(1, 0, 0, "", "handle")));
//      globalcart.removeWhere((element) => element.unique ==  sample.id[0].toString()+ sample.id[ind].toString());
//      final String encodedData = CartModel.encodeMusics(globalcart);
//      MyApp.sharedPreferences.setString("cart", encodedData);
    }
  }

  Widget Addtocartbutton(var diff) {
    if (diff == "") {
      return Center(
          child: new Text("ADD TO CART",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0)));
    } else {
      diff = "";
      return Row(
        children: [
          Center(
              child: new Text("      ADD TO CART",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0))),

          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
          ),
        ],
      );
    }
  }

  saveonfav(int ind){
    if(globalfav == null){
      globalfav = new List();
    }
    var a = globalfav.where((element) => element.unique == sample.id[0].toString()+ sample.id[ind].toString());
    if(a.length ==  0){
      globalfav.add(Favourite(unique: sample.id[0].toString()+ sample.id[ind].toString(), id: sample.id[ind], name: sample.name,  image: sample.image[ind], price: sample.price[ind]),);
      final String encodedData = Favourite.encodeMusics(globalfav);
      MyApp.sharedPreferences.setString("fav", encodedData);
    }
    else{
      globalfav.removeWhere((element) => element.unique ==  sample.id[0].toString()+ sample.id[ind].toString());
      final String encodedData = Favourite.encodeMusics(globalfav);
      MyApp.sharedPreferences.setString("fav", encodedData);
//      setState(() {
//        fav = sample.fav[ind];
//      });
    }
  }

}

/**/
