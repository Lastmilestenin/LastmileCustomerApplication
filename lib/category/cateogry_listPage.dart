
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:last_mile/category/category_card.dart';


import 'categoryListing.dart';
import '../customization/colors.dart';
import '../models/category.dart';


class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final SwiperController swiperController = SwiperController();


  List<Category> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = categories;
  }


  @override
  Widget build(BuildContext context) {


    double cardHeight = MediaQuery.of(context).size.height/3.5;
    double cardWidth = MediaQuery.of(context).size.width/2.2;
    if(categories==null)
      categories = [];
    return   SizedBox(
      height: cardHeight,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (_, index) {
            return CategoryCard(
              ind: index,
              product: categories[index],
            );
          }
      ),
    );
  }
}
