
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:last_mile/category/category_card.dart';
import 'package:last_mile/models/laundry.dart';

import 'laundry_card.dart';





class LaundryListPage extends StatefulWidget {
  @override
  _LaundryListPagePageState createState() => _LaundryListPagePageState();
}

class _LaundryListPagePageState extends State<LaundryListPage> {
  final SwiperController swiperController = SwiperController();


  List<Laundry> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = laundry;
  }


  @override
  Widget build(BuildContext context) {


    double cardHeight = MediaQuery.of(context).size.height;
    double cardWidth = MediaQuery.of(context).size.width/2.2;
    if(laundry==null)
      laundry = [];
    return   Container(
     // padding: EdgeInsets.symmetric(vertical: 20.0),
      height: cardHeight,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: laundry.length,
          itemBuilder: (_, index) {
            return LaundryCard(
              ind: index,
              product: laundry[index],
            );
          }
      ),
    );
  }
}
