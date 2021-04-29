import 'package:flutter/material.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/models/product.dart';
import 'package:last_mile/products/AllProductCard.dart';
import 'package:last_mile/products/productCard.dart';
import 'package:shimmer/shimmer.dart';

import 'productlisting.dart';

class AllPrroductList extends StatefulWidget {
  @override
  _AllPrroductListState createState() => _AllPrroductListState();
}

class _AllPrroductListState extends State<AllPrroductList> {

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //searchResults = products;

  }
  bool _enabled = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.3;
    final double itemWidth = size.width / 1.465;
    if(MainPage.productlist.length == 0){
      return Container(
        height: MediaQuery.of(context).size.height/4,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: _enabled,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100.0,
                          height: 70.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ],
                    ),
                  ),
                  itemCount: 5,
                ),
              ),
            ),
//            Padding(
//              padding: const EdgeInsets.symmetric(vertical: 8.0),
//              child: FlatButton(
//                  onPressed: () {
//                    setState(() {
//                      _enabled = !_enabled;
//                    });
//                  },
//                  child: Text(
//                    _enabled ? 'Stop' : 'Play',
//                    style: Theme.of(context).textTheme.button.copyWith(
//                        fontSize: 18.0,
//                        color: _enabled ? Colors.redAccent : Colors.green),
//                  )),
//            )
          ],
        ),
      );
    }
    else{
      return  Container(
        height: MediaQuery.of(context).size.height/3,
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / 450),
            children: List.generate(MainPage.productlist.length, (index) {
             return AllProductCard(
                  ind: index,
                  product: MainPage.productlist[index]
             );
            }),
            // scrollDirection: Axis.vertical,
            // itemCount: MainPage.productlist.length,
            // itemBuilder: (_, index) {
            //   return AllProductCard(
            //     ind: index,
            //     product: MainPage.productlist[index],
            //   );

        ),
      );
    }
  }
}
