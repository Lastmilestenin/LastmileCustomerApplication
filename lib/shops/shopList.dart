import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_mile/customization/splashscreen.dart';

import 'package:last_mile/models/product.dart';
import 'package:last_mile/products/productCard.dart';
import 'package:last_mile/shops/shopCard.dart';
import 'package:last_mile/shops/shopListing.dart';

import '../customization/colors.dart';
import '../global.dart';
import '../global.dart';
import '../models/shops.dart';





class ShopList extends StatefulWidget {
  @override
  _ShopListPageState createState() => _ShopListPageState();

}
class _ShopListPageState extends State<ShopList> {

  List<Shops> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = shops;

  }
  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height/3.5;
    double cardWidth = MediaQuery.of(context).size.width/2.2;

    if(vendorList==null)
      shops = [];
// shops near you card
    return   SizedBox(
      height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width/1,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 20, top: 5),
          scrollDirection: Axis.vertical,

          itemCount: vendorList.length,
          itemBuilder: (_, index) {
            return ShopCard(
              vendor: vendorList[index],
              shop: shops[index],
            );
          }
      )
    );
  }
}
// return   SizedBox(
// height: MediaQuery.of(context).size.height/1.95,
// width: MediaQuery.of(context).size.width/1.1,
// child: GridView.builder(
// gridDelegate:
// new SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,childAspectRatio: 0.9,),
// scrollDirection: Axis.vertical,
// itemCount: vendorList.length,
// itemBuilder: (_, index) {
// return ShopCard(
// vendor: vendorList[index],
// shop: shops[index],
// );
// }
// ),
// );


