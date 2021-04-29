import 'package:last_mile/category/categoryList.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/categorySeeAll.dart';
import 'package:last_mile/credentials/contactUs.dart';
import 'package:last_mile/customization/AboutUs.dart';
import 'package:last_mile/decors/Decors.dart';
import 'package:last_mile/main.dart';
import 'package:last_mile/orders/DeliveryStatus.dart';
import 'package:last_mile/products/AllProductCard.dart';
import 'package:last_mile/products/Allproduct_list.dart';
import 'package:last_mile/products/Categories.dart';
import 'package:last_mile/products/Categories.dart';
import 'package:last_mile/search/SearchPage.dart';
import 'package:last_mile/customization/accountPage.dart';
import 'package:last_mile/search/advancefilters.dart';
import 'package:last_mile/carts/cartListing.dart';
import 'package:last_mile/carts/fullCart.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/laundry/laundry_list.dart';
import 'package:last_mile/models/Reviews.dart';
import 'package:last_mile/models/categories.dart';
import 'package:last_mile/models/product.dart';
import 'package:last_mile/products/product_list.dart';
import 'package:last_mile/reviews/reviewPage.dart';
import 'package:last_mile/search/searchFile.dart';
import 'package:last_mile/shops/showCart.dart';
import 'package:last_mile/storeNearSeeAll.dart';
import 'FeaturedSeeAll.dart';
import 'components/style.dart';
import 'ftrProductSeeAll.dart';
import 'global.dart';
import 'services/ServicesProvided.dart';
import 'Settings.dart';
import 'favourites/favourites.dart';
import 'category/cateogry_listPage.dart';
import 'customization/colors.dart';
import 'models/Decor.dart';
import 'profile/profile.dart';

class MainPage extends StatefulWidget {
  static List<Product> productlist = new List();

  var a;
  var b;
  int c;
  var name;
  var handlevar = "";
  Product products;
  Decor decor;
  MainPage(this.a, this.b, this.c, this.name, this.handlevar);
  @override
  _MainPageState createState() =>
      _MainPageState(a, b, c, this.name, this.handlevar);
}

String timelines = 'Gifts Collection';
String deal = 'Featured Products';

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  var a;
  var b;
  int c;
  var handlevar;
  var name;
  bool isActive = true;
  TabController _tabController;

  // List<Product> product;
  TabController bottomTabController;
  _MainPageState(this.a, this.b, this.c, this.name, this.handlevar);

  static Widget cat = CategoryListPage();
  Widget pro = ProductList();

  Widget AllPro = AllPrroductList();

  @override
  void initState() {
    super.initState();
    getVendorprodects();

    bottomTabController = TabController(length: 5, vsync: this);

    if (a == 1) {
      bt = bottom();
    } else {
      bt = bts;
    }

    if (c == 1) {
      deal = 'Deals';
      timelines = 'Laundry';

      tabBar = null;
      cat = null;
      pro = LaundryListPage();
      productsview = null;
      productsviews = null;
    } else {
      pro = ProductList();
      cat = CategoryListPage();
      timelines = 'Gifts Collection';
      timelines = 'Gifts Collection';
      deal = 'Featured Products';
      tabBar = Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Clothing Deals',
              style: TextStyle(
                  fontSize: 20.0, fontFamily: 'aveh', color: lightblack),
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
              padding: const EdgeInsets.only(top: 3),
              child: Image.asset("assets/doublearrow.png"),
            )
          ],
        ),
      );
    }
  }

  void initialize() {
    categori.clear();
    categori.add("See all");
    for (int i = 0; i < MainPage.productlist.length; i++) {
      if (categori.contains(MainPage.productlist[i].categoryname)) {
      } else {
        categori.add(MainPage.productlist[i].categoryname);
      }
    }

    _tabController = new TabController(vsync: this, length: categori.length);
  }

  waitactivity() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (API.success == 'true') {
        setState(() {
          pro = ProductList();
          AllPro = AllPrroductList();
          catt = "See all";
          initialize();
        });
      } else {
        waitactivity();
      }
    });
  }

  getVendorprodects() async {
    API.getVendorprodects(c.toString());
    waitactivity();
  }

  getaddresses() async {
    API.getVendorprodects(c.toString());
    waitactivity();
  }

  var bt;
  Widget bts = null;
  Widget bottom() {
    return Container(
      height: 60,
      color: Color.fromRGBO(60, 111, 102, 1),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            handlevar == "handle"
                ? Text(
                    'You already have this item in cart ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'aveb',
                        fontSize: 13.0),
                  )
                : handlevar == "error"
                    ? Text(
                        'Error ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      )
                    : Text(
                        'Items in cart: ' + globalcart.length.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
            Spacer(),
            InkWell(
              onTap: () => bottomsheet(),
              child: Text('View cart', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  void bottomsheet() {
    // Product product;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0),
                child: Text(
                  'ORDER DETAILS',
                  style: TextStyle(
                      fontSize: 20.0, fontFamily: 'aveh', color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: globalcart.length,
                      itemBuilder: (_, index) {
                        indo = index;
                        return ShowCarts(
                          cart: globalcart[index],
                        );
                      }),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 60.0),
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => FullCart(cart: globalcart[0], a: c))),
//                        Navigator.of(context)
//                        .push(MaterialPageRoute(builder: (_) => FullCart(cart: cart[2],),)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(60, 111, 102, 1),
                        border: Border.all(
                          color: Color.fromRGBO(60, 111, 102, 1),
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                          child: new Text("VIEW FULL CART",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'aveh',
                                  letterSpacing: 2.2,
                                  fontSize: 15.0))),
                    ),
                  )),
            ],
          );
        });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget drawers() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [0.1, 0.4, 2.1],
                colors: [
                  Colors.black87,
                  Colors.brown[700],
                  Colors.orange[700],
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70.0)),
                  child: CircleAvatar(
                    backgroundImage: MyApp.sharedPreferences
                                .getString('userimage') !=
                            null
                        ? NetworkImage(
                            MyApp.sharedPreferences.getString('userimage'))
                        : NetworkImage(
                            "https://isaca-gwdc.org/wp-content/uploads/2016/12/male-profile-image-placeholder.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    MyApp.sharedPreferences.getString('username') != null
                        ? MyApp.sharedPreferences.getString('username')
                        : 'Username',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, fontFamily: 'aveh'),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Promotions',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Categories',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CategoryListPages()));
            },
          ),
          ListTile(
            title: Text(
              'Account',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ProfilePage(c)));
            },
          ),
          ListTile(
            title: Text(
              'Subscription',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ServicesProvided(c)));
            },
          ),
          ListTile(
            title: Text(
              'Settings',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => Setting(c, 'Paypal')));
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Contact Us',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ContactUs()));
            },
          ),
          ListTile(
            title: Text(
              'About App',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => AboutUs()));
            },
          ),
          ListTile(
            title: Text(
              'Reviews',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ReviewPage()));
            },
          ),
          ListTile(
            title: Text(
              'Tips At Start',
              style:
                  TextStyle(color: lightGrey, fontSize: 14, fontFamily: 'aveb'),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
            trailing: Switch(
              value: NotificationisSwitched,
              onChanged: (value) {
                setState(() {
                  NotificationisSwitched = value;
                  if (NotificationisSwitched == false) {
                    notiEnable = 'Disable';
                  } else {
                    notiEnable = 'Enable';
                  }
                });
              },
              activeTrackColor: Color.fromRGBO(60, 111, 102, 1),
              activeColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () => _scaffoldKey.currentState.openDrawer(),
            child: IconButton(
                icon: Icon(
              Icons.menu,
              color: Colors.black,
            )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              'STORE',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'aveb'),
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage(1))),
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => AdvanceFilters())),
                icon: SvgPicture.asset(
                  'assets/Symbols.svg',
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget topHeader() {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              vendorname,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'aveh',
                                  color: darkGrey),
                            ),
                            RatingBar(
                              initialRating: double.parse(vendorrating),
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
                                size: 5,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    deal,
                                    style: TextStyle(
                                        fontSize: 20.0, color: lightblack),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            )
          ],
        ));
  }

  static Widget tabBar = Padding(
    padding: EdgeInsets.all(16.0),
    child: Row(
      children: <Widget>[
        Text(
          'Clothing Deals',
          style:
              TextStyle(fontSize: 20.0, fontFamily: 'aveh', color: lightblack),
        ),
        Spacer(),
        Text(
          'See All',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'aveh',
            color: green,
          ),
        )
      ],
    ),
  );

  Widget tabBars() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Text(
            'Decors',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
          Spacer(),
          Text('See All')
        ],
      ),
    );
  }

  Widget productsview = Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: tabBar,
      ));
  Widget productsviews = Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: cat,
      ));

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

  bool NotificationisSwitched = false;
  String notiEnable = 'Disable';
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
    //               child: Text(
    //                 globaladdressvar.toString(),
    //                 style: TextStyle(
    //                     fontSize: 13,
    //                     color: Colors.black,
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
    //previous appbar
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
    //             onTap: () {
    //               // Navigator.push(
    //               //   context,
    //               //   MaterialPageRoute(builder: (context) => Profile()),
    //               // );
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
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.405;
    final double itemWidth = size.width / 1.465;

    return WillPopScope(
        onWillPop: () {
          MainPage.productlist.clear();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => SearchPage(0)));
        },
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            drawer: drawers(),
            backgroundColor: Color(0xFFF7F7F7),
            bottomSheet: bt,
            bottomNavigationBar: BottomNavigationBar(
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
              color: backgroundColor,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     // appBar,
                      globalAppbar(),

                      Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        // width:  MediaQuery.of(context).size.width/1,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(30)),
                              child: Image.network(widget.handlevar,
                                fit: BoxFit.fill,
                              )),
                        ),
                        // child: PageView.builder(
                        //   itemBuilder: (context, position) {
                        //     return
                        //   },
                        // ),
                      ),
                      // details
                      Padding(
                        padding: const EdgeInsets.only(top:20.0,left: 20,right: 20, bottom: 10),
                        child: Container(

                          height: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name.toString(),
                                style: sansb22,
                              ),
                              RatingBar(
                                unratedColor: Colors.grey[300],
                                initialRating: double.parse(b.toString()),
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
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'A ONE-STOP COMPLETE HOME SOLUTION  ',
                                    maxLines: 1,
                                    style: robr10,
                                  )),
                              Container(

                                width: size.width/1.1,
                                child: Text(
                                  'Time: 10:00 am - 11:00 pm Location: ABC Road, Karachi Pakistan',maxLines: 1,
                                  style: robr10,
                                ),
                              ),
                              Text(
                               a.toString()==null?'Location: ABC Road, Karachi Pakistan': "Address : "+a.toString(),
                               maxLines: 1, style: robr10,
                              ),
                            ],
                          ),
                        ),
                      ),

                      //search
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, ),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey[200]),
                                  color: Colors.white),
                              height: 50,
                              width: MediaQuery.of(context).size.width / 1.15,
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
                          )),

//featured products
                      heading(text: 'Featured Products', onTap: () {     Navigator.push(
                        context, MaterialPageRoute(builder: (context) => FeatureProductsSeeAll()),
                      );}),

                      pro,
                      // all products

                      heading(
                          text: 'All Products',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Categories()),
                            );
                          }),
                      DefaultTabController(
                        length: categori.length,

                        child: TabBar(

                          onTap: (value) {
                            setState(() {
                              catt = categori[value];
                              selectcat = new List();
                              for (int i = 0;
                                  i < MainPage.productlist.length;
                                  i++) {
                                if (catt ==
                                    MainPage.productlist[i].categoryname
                                        .toString()) {
                                  selectcat.add(i);
                                }
                              }
                            });
                            setState(() {});
                            print(categori[value]);
                          },

                        //  indicatorPadding: EdgeInsets.symmetric(horizontal: 0,),
                          indicator: UnderlineTabIndicator(

                          insets: EdgeInsets.symmetric(horizontal:60.0),
                            borderSide:
                              BorderSide(color:  Color.fromRGBO(60, 111, 102, 1),)

                      ),
                          indicatorColor: Color.fromRGBO(60, 111, 102, 1),
                        //  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                          labelColor: Color.fromRGBO(60, 111, 102, 1),
                          unselectedLabelColor: Colors.grey[400],
                          isScrollable: false,
                          tabs: List<Widget>.generate(categori.length,
                              (int index) {
                            return new Tab(
                              child: Text(categori[index].toString()),
                            );
                          }),
                        ),
                      ),

                      Container(
                          height: 400,
                          child: TabBarView(

                            controller: _tabController,
                            physics: NeverScrollableScrollPhysics(),
                            children: List<Widget>.generate(categori.length,
                                (int index) {
                              print(categori[index]);
                              return catt == "See all"
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height/2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GridView.count(
                                          crossAxisCount: 2,
                                          childAspectRatio: (itemWidth / 300),
                                          children: List.generate(
                                              MainPage.productlist.length,
                                              (index) {
                                            return AllProductCard(
                                                ind: index,
                                                product: MainPage
                                                    .productlist[index]);
                                          }),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height:
                                          MediaQuery.of(context).size.height/2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GridView.count(
                                          shrinkWrap: true,
                                          crossAxisCount: 2,
                                          childAspectRatio: (itemWidth / 300),
                                          //   products.where((product) => product.tag == 'chicken').length
                                          children: new List.generate(
                                              selectcat.length, (index) {
                                            print(MainPage
                                                .productlist[selectcat[index]]
                                                .name);
                                            return new AllProductCard(
                                                ind: index,
                                                product: MainPage.productlist[
                                                    selectcat[index]]);
                                          }),
                                        ),
                                      ),
                                    );
                            }),
                          ))

                      // Padding(
                      //   padding: const EdgeInsets.only(right: 20,left: 20, top: 5),
                      //   child: Container(
                      //     height: MainPage.productlist.length==2?360:620,
                      //     width: MediaQuery.of(context).size.width,
                      //     child:
                      //     //CategoriesList(),
                      //     AllPro,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
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
        horizontal: 30.0,vertical: 15
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
              InkWell(onTap:
                onTap,
                child: Text(('See all'),
                    style: TextStyle(color: Color(0xFFC3C6F66), fontSize: 14)),
              ),
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
