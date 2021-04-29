import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_mile/carts/fullCart.dart';
import 'package:last_mile/favourites/favourites.dart';
import 'package:last_mile/orders/DeliveryStatus.dart';
import 'package:last_mile/search/searchingFor.dart';
import 'package:last_mile/shops/shopList.dart';
import 'package:last_mile/products/viewproduct.dart';
import 'package:rubber/rubber.dart';
import 'package:shimmer/shimmer.dart';
import 'package:last_mile/components/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Settings.dart';
import '../customization/index.dart';
import '../orderTracking.dart';
import 'advancefilters.dart';
import '../customization/colors.dart';
import '../products/productlisting.dart';
import '../models/product.dart';
import 'package:last_mile/profile/profile.dart';
import 'package:last_mile/global.dart';
import 'package:last_mile/categoryScreen.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:last_mile/categorySeeAll.dart';
import 'package:last_mile/FeaturedSeeAll.dart';
import 'package:last_mile/models/vendor.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/classes/Distance.dart';
import 'package:last_mile/customization/splashscreen.dart';
import 'package:last_mile/storeNearSeeAll.dart';



class SearchPage extends StatefulWidget {
  int a;

  SearchPage(this.a);
  @override
  _SearchPageState createState() => _SearchPageState(a);
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  int a;
  Widget three;
  _SearchPageState(this.a);

  String selectedPeriod;
  String selectedCategory;
  String selectedPrice;

  List<String> timeFilter = [
    'Brand',
    'New',
    'Latest',
    'Trending',
    'Discount',
  ];

  List<String> categoryFilter = [
    'Skull Candy',
    'Boat',
    'JBL',
    'Micromax',
    'Seg',
  ];

  List<String> priceFilter = [
    '\$50-200',
    '\$200-400',
    '\$400-800',
    '\$800-1000',
  ];

  List<Product> searchResults = [];

  TextEditingController searchController = TextEditingController();

  RubberAnimationController _controller;
  ProgressDialog pr;
  bool isActive = true;
  int _selectedIndex = 0;
  int c;
  int orders=0;


  @override
  void initState() {
     pr = ProgressDialog(context);
     getmyorders();
    if (a == 1) {
      one = topheader;
      two = _getLowerLayer();
      Future.delayed(Duration.zero, () {
        three = _getUpperLayer(context);
      });
//       WidgetsBinding.instance.addPostFrameCallback((_) async {
//         three = _getUpperLayer(context);
//       });
    } else {
      one = topheaders;
      two = ShopList();
      Future.delayed(Duration.zero, () {
        three = _search(context);
      });
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       three = _search(context);
//     });
    }
    _controller = RubberAnimationController(
        vsync: this,
        halfBoundValue: AnimationControllerValue(percentage: 0.4),
        upperBoundValue: AnimationControllerValue(percentage: 0.4),
        lowerBoundValue: AnimationControllerValue(pixel: 50),
        duration: Duration(milliseconds: 200));
    super.initState();
  }
  getmyorders(){
    API.pickeduporders().then((value) {
      setState(() {
        orders=pickuporderslist.length;
      });
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => StoreNearSeeAll()));
      } else if (_selectedIndex == 2) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FullCart(
              a: c,
            )));
      } else if (_selectedIndex == 3) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Favourites(c)));
      } else if (_selectedIndex == 4) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Setting(c, 'Paypal')));
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  void _expand() {
    _controller.expand();
  }

  Widget two;

  // Widget three = Container(
  //   decoration: BoxDecoration(
  //     boxShadow: [
  //       BoxShadow(
  //           color: Color.fromRGBO(0, 0, 0, 0.05),
  //           offset: Offset(0, -3),
  //           blurRadius: 10)
  //     ],
  //     borderRadius: BorderRadius.only(
  //         topRight: Radius.circular(24), topLeft: Radius.circular(24)),
  //   ),
  //   child: Padding(
  //     padding: EdgeInsets.only(bottom: 30.0),
  //     child: Container(
  //       width: 250,
  //       height: 29,
  //       decoration: BoxDecoration(
  //         color: Color.fromRGBO(60, 111, 102, 1),
  //         borderRadius: BorderRadius.circular(25.0),
  //       ),
  //       child: Center(
  //           child: new Text("SEARCH",
  //               style: const TextStyle(
  //                   color: Colors.white,
  //                   fontFamily: 'aveh',
  //                   letterSpacing: 2.2,
  //                   fontSize: 15.0))),
  //     ),
  //   ),
  // );

  Widget one;
  static Widget topheader = Container(
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Find your product',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'aveh',
                      color: darkGrey),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'Search through more than 1000+ shops',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'aveb', color: darkGrey),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
  static Widget topheaders = Container(
    child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]),
              borderRadius: BorderRadius.circular(10), color: Colors.white),
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
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 15, right: 15),
                hintText: "What are you looking for?",
                hintStyle:robr),
          ),
        )
    ),
    // Column(
    //   children: <Widget>[
    //     Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 16.0),
    //       child: Center(
    //         child: Column(
    //           children: <Widget>[
    //             Text(
    //               'Find a shop',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 30,
    //                   fontFamily: 'aveh',
    //                   color: darkGrey),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
    //               child: Text(
    //                 'Search a shop with 5 km radius',
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                     fontSize: 14, fontFamily: 'aveb', color: darkGrey),
    //               ),
    //             ),
    //             Container(
    //               height: 40.0,
    //               padding: EdgeInsets.only(bottom: 10.0),
    //               margin: EdgeInsets.symmetric(horizontal: 16.0),
    //               decoration: BoxDecoration(
    //                   border: Border(
    //                       bottom: BorderSide(color: Colors.black, width: 1))),
    //               child: TextField(
    //                 cursorColor: darkGrey,
    //                 decoration: InputDecoration(
    //                   hintText: 'Search',
    //                   hintStyle: TextStyle(
    //                     fontFamily: 'aveb',
    //                   ),
    //                   contentPadding: EdgeInsets.zero,
    //                   border: InputBorder.none,
    //                   suffixIcon: SvgPicture.asset(
    //                     'assets/search_icon.svg',
    //                     fit: BoxFit.scaleDown,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
  );
  Widget _getLowerLayer() {
    return Container(
      height: 340,
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 140.0,
            padding: EdgeInsets.only(top: 10.0),
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 1))),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  List<Product> tempList = List<Product>();
                  products.forEach((product) {
                    if (product.name.toLowerCase().contains(value)) {
                      tempList.add(product);
                    }
                  });
                  setState(() {
                    searchResults.clear();
                    searchResults.addAll(tempList);
                  });
                  return;
                } else {
                  setState(() {
                    searchResults.clear();
                    searchResults.addAll(products);
                  });
                }
              },
              cursorColor: darkGrey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                suffixIcon: SvgPicture.asset(
                  'assets/search_icon.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Flexible(
            child: Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: true,
                child: Container(
                  child: GridView.builder(
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: searchResults.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: ListTile(
                            //   onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>ViewProductPage(product: searchResults[index],))),
                            title: Text(searchResults[index].name),
                          ))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getUpperLayer(context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, -3),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
        ),
        child: Container(
          color: Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => AdvanceFilters())),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 50,
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Center(
                      child: new Text("ADVANCE FILTERS",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'aveh',
                              //letterSpacing: 2.2,
                              fontSize: 13.0))),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 111, 102, 1),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Center(
                    child: new Text("What are you looking for?",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'aveh',
                            // letterSpacing: 2.2,
                            fontSize: 13.0))),
              )
            ],
          ),
        ));
  }

  Widget _search(context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              offset: Offset(0, -3),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24), topLeft: Radius.circular(24)),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromRGBO(60, 111, 102, 1),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Center(
            child: new Text("What are you looking for?",
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'aveh', fontSize: 15.0))),
      ),
    );
  }
  waitactivity(int index) async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.success == 'true'){
        pr.hide();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryScreen(index: index)),
        );
      }
      else{
        waitactivity(index);
      }
    });
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
    //             width: 15),
    //           Container(
    //             width: MediaQuery.of(context).size.width / 2,
    //             child: Center(
    //               child: Text(
    //                   globaladdressvar.toString(),
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

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => order_tracking()));

          },
          child: Text(orders.toString(),style: TextStyle(fontSize: 18),),
          backgroundColor: green,
        ),
      ),
      body: WillPopScope(
        onWillPop: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => MapSearch())),
        child: SafeArea(
          //   child: SingleChildScrollView(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: backgroundColor,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Container(
                      child: Image.asset(
                        'assets/Icons-icon-home.png',
                        color: isActive
                            ? Color.fromRGBO(60, 111, 102, 1)
                            : Colors.black,
                      )),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      child: Image.asset(
                        'assets/Symbols.png',
                        color: Colors.black,
                      )),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      child: Image.asset(
                        'assets/Icons-icon-shopping-bag.png',
                        color: Colors.black,
                      )),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      child: Image.asset(
                        'assets/Icons-icon-bookmark.png',
                        color: Colors.black,
                      )),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      child: Image.asset(
                        'assets/Icons-icon-settings.png',
                        color: Colors.black,
                      )),
                  title: Text(''),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: backgroundColor,
                //  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     // appBar,
                      globalAppbar(),
                      SizedBox(
                        height: 5,
                      ),

                      //slider

                      Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        // width:  MediaQuery.of(context).size.width/1,
                        child: PageView.builder(
                          itemCount: bannerlist.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 1,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(30)),
                                  child: Image.network(
                                    bannerlist[index].image,
                                    fit: BoxFit.fill,
                                  )),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      Center(
                        child: Container(

                          width: size.width / 1.15,
                          child: one,
                        ),
                      ),
                      SizedBox(height: 15,),
                      //category
                      heading(text: 'Category', onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CatSeeAll()),
                            );


                      }),
                      Container(
                          height: size.height / 4,
                          width: size.width,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              scrollDirection: Axis.horizontal,
                              itemCount: vendorcatlist.length  ,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                   child:InkWell(
                                     onTap: (){
                                       pr.show();
                                       API.VedonCategoryID(vendorcatlist[index].id.toString());
                                       waitactivity(index);
                                     },
                                     child: Container( child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          vendorcatlist[index].image==null?"https://upload.wikimedia.org/wikipedia/commons/3/32/Flag_of_Pakistan.svg": vendorcatlist[index].image,
                                          fit: BoxFit.fill,
                                          width: 165,
                                          height: size.height/6,
                                        ),
                                      ),
                                    ),),),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 4),
                                      child: Text(
                                        vendorcatlist[index].name,
                                        style: robr,
                                      ),
                                    ),
                                  ],
                                );
                              })),

                      //featured store
                      heading(text: 'Featured Stores', onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FeatureSeeAll()),
                        );
                      }),
                      Container(
                          height: size.height / 3.6,
                          width: size.width,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              scrollDirection: Axis.horizontal,
                              itemCount: FeatureShoplist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return
                                Padding(
                                  padding: const EdgeInsets.all(4.5),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) => MainPage(0,0,FeatureShoplist[index].id , FeatureShoplist[index].name , FeatureShoplist[index].image)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: 165,
                                      height: MediaQuery.of(context).size.height / 3.6,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(bottom: 2),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10)),
                                              child: Image.network(
                                                FeatureShoplist[index].image,
                                                fit: BoxFit.fill,
                                                width: 165,
                                                height: size.height/7,
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
                                                    child:  Text(FeatureShoplist[index].name, style: robr),
                                                    width: 100,
                                                  ),

                                                  Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                    size: 18,
                                                  )
                                                ]),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8.0),
                                            child: Text('', style: robr10),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8.0, bottom: 5),
                                            child: RatingBar(
                                              unratedColor: Colors.grey[300],
                                              initialRating: double.parse(FeatureShoplist[index].rating.toString()) ,
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
                                    ),
                                  ),
                                );

                              })),

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
                                child: PageView.builder(
                                  itemBuilder: (context, position) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width / 1,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              position % 2 == 0
                                                  ? 'assets/rectangle.jpg'
                                                  : 'assets/rectangle.jpg',
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    );
                                  },
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      heading(text: 'Store Near You', onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StoreNearSeeAll()),
                        );
                      }),
                      two,
                      SizedBox(height: 12),
                    ],
                  ),
                )),
          ),
        ),

        //),
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
              InkWell(
                onTap: onTap,child:  Text(('See all'),
                  style: TextStyle(color: Color(0xFFC3C6F66), fontSize: 14)),),
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
