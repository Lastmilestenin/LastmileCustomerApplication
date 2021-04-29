import 'package:flutter/material.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/products/AllProductCard.dart';

import '../global.dart';

class Categories extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {

  TabController _tabController;


  void initState() {

  //  initialize();
    _tabController = new TabController(vsync: this, length: categori.length);

    super.initState();
  }
  // void mainatinlength()
  // {
  //   for (int i = 0; i<MainPage.productlist.length;i++)
  //   {
  //     if(cat==MainPage.productlist[i].categoryname.toString())
  //       {
  //           selectcat.add(i);
  //       }
  //   }
  // }
  void initialize() {
    // categori.add("See all");
    for (int i = 0; i<MainPage.productlist.length;i++)
      {
        if(categori.contains(MainPage.productlist[i].categoryname))
          {

          }
        else
          {
            categori.add(MainPage.productlist[i].categoryname);
          }
      }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.405;
    final double itemWidth = size.width / 1.465;

    return MaterialApp(
      home: DefaultTabController(
        length: categori.length,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "All PRODUCTS" ,style:TextStyle(fontSize: 15,color:Colors.black,  fontFamily: 'aveb'),
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              onTap: (value) {
                setState(() {
                  catt=categori[value];
                  selectcat=new List();
                  for (int i = 0; i<MainPage.productlist.length;i++)
                  {
                    if(catt==MainPage.productlist[i].categoryname.toString())
                    {
                      selectcat.add(i);
                    }
                  }
                });
              setState(() {

              });
                print(categori[value]);
              },

              indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
              indicatorColor: Color.fromRGBO(60, 111, 102, 1),
              labelPadding: EdgeInsets.symmetric(horizontal: 25.0),
              labelColor: Color.fromRGBO(60, 111, 102, 1),
              unselectedLabelColor: Colors.grey[400],
              isScrollable: false,
              tabs: List<Widget>.generate(categori.length, (int index){

                return new Tab(child: Text(categori[index].toString()),);

              }),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: List<Widget>.generate(categori.length, (int index){
              print(categori[index]);
              return  catt=="See all" ? Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / 400),
                    children: List.generate(MainPage.productlist.length, (index) {
                      return  AllProductCard(
                          ind: index,
                          product: MainPage.productlist[index]
                      );
                    }),
                  ),
                ),
              ):Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / 400),
                   //   products.where((product) => product.tag == 'chicken').length
                    children: new List.generate(selectcat.length, (index) {
                      print(MainPage.productlist[selectcat[index]].name);
                      return new AllProductCard(
                          ind: index,
                          product: MainPage.productlist[selectcat[index]]
                      );
                    }
                    ),

                  ),

                ),
              );

            }),
          )
        ),
      ),
    );
  }
}

class CategoriesList  extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // final List<Map> myProducts =
  // List.generate(4, (index) => {"id": index, "name": "Product $index"})
  //     .toList();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.375;
    final double itemWidth = size.width / 1.465;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          children: List.generate(MainPage.productlist.length, (index) {
            return AllProductCard(
                ind: index,
                product: MainPage.productlist[index]
            );
          }),

        ),

      ),
    );
  }
}