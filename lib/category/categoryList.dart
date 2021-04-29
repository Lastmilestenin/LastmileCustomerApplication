
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_mile/customization/staggered_category_card.dart';
import 'package:last_mile/products/Categories.dart';

import '../customization/colors.dart';
import '../global.dart';
import '../mainPage.dart';
import '../models/categories.dart';
import '../models/category.dart';


class CategoryListPages extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPages> {
  List<CategoryList> categories = [
    CategoryList(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Vase',
      'assets/vase-1.png',
    ),
    CategoryList(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Clothes',
      'assets/monthly.png',
    ),
    CategoryList(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'Laundry',
      'assets/clothes.png',
    ),
    CategoryList(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Watches',
      'assets/Watch-apple-watch.png',
    ),

  ];

  List<CategoryList> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = categories;
  }


  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      padding: EdgeInsets.only(top:10.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.of(context).pop(),),

          Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Text('Category',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.grey[100]), ),

        ],
      ),
    );
    return Material(
      color: Color(0xffF9F9F9),
      child: Container(
       // margin: const EdgeInsets.only(top: kToolbarHeight),
      //  padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            appBar,
            Container(

              padding: EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: TextField(
                controller:searchController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: SvgPicture.asset('assets/search_icon.svg', fit: BoxFit.scaleDown,)
                ),
                onChanged: (value) {
                  // if(value.isNotEmpty) {
                  //   List<CategoryList> tempList = List<CategoryList>();
                  //   categories.forEach((category) {
                  //     if(category.category.toLowerCase().contains(value)) {
                  //       tempList.add(category);
                  //     }
                  //   });
                  //   setState(() {
                  //     searchResults.clear();
                  //     searchResults.addAll(tempList);
                  //   });
                  //   return;
                  // } else {
                  //   setState(() {
                  //     searchResults.clear();
                  //     searchResults.addAll(categories);
                  //   });
                  // }
                },
              ),
            ),
            Flexible(
              child: ListView.builder(

                  itemCount: categori.length, itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  width: MediaQuery.of(context).size.width/1.4,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width/1.4,
                      height: MediaQuery.of(context).size.height/4.5,


                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xffFCE183),
                                Color(0xffF68D7F),
                              ]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              topRight: Radius.circular( 10.0),
                              bottomRight: Radius.circular(10.0)
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Center(
                                child: Container(

                                    child: Text(categori[index].toString(), style: TextStyle(color: Colors.white, fontSize: 18.0),
                                      maxLines: 2,

                                    ),
                                  width: MediaQuery.of(context).size.width/2.5,
                                ),
                            ),
                            Spacer(),
                            InkWell(
                              child: Container(
                                width: 110,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(26.0),
                                        bottomLeft: Radius.circular(26.0),
                                        topRight: Radius.circular( 26.0),
                                      bottomRight: Radius.circular(26.0)
                                    )
                                ),
                                child: Center(
                                  child: Text("View More", style: TextStyle(color: Color(0xffF68D7F), fontSize: 16.0),),
                                ),
                              ),
                              onTap: (){
                                // setState(() {
                                //   catt=categori[index];
                                //   selectcat=new List();
                                //   for (int i = 0; i<MainPage.productlist.length;i++)
                                //   {
                                //     if(catt==MainPage.productlist[i].categoryname.toString())
                                //     {
                                //       selectcat.add(i);
                                //     }
                                //   }
                                // });


                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Categories()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              // ListView.builder(
              //   itemCount: categori.length,
              //   itemBuilder: (_, index) => Padding(
              //     padding: EdgeInsets.symmetric(vertical: 16.0,),
              //     child: StaggeredCardCard(
              //       begin: searchResults[index].begin,
              //       end: searchResults[index].end,
              //       categoryName: searchResults[index].category,
              //       assetPath: searchResults[index].image,
              //     ),
              //   ),
              // ),
            )
          ],

        ),
      ),
    );
  }
}

