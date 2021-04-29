import 'package:flutter/material.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/models/product.dart';
import 'package:last_mile/products/productCard.dart';
import 'package:shimmer/shimmer.dart';
import 'productlisting.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();

}
class _ProductListPageState extends State<ProductList> {
  
  //List<Product> searchResults;
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
                          height: 100.0,
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
      return  Padding(
        padding: const EdgeInsets.only(left:15.0),
        child: Container(
          height: MediaQuery.of(context).size.height/3.8,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: MainPage.productlist.length,
              itemBuilder: (_, index) {
                return  MainPage.productlist[index].status=="1"?ProductCard(
                  ind: index,
                  product: MainPage.productlist[index],
                ):
                Container(
                  // height: 100,
                  //4=/width: 0,
                  //child: Center(child: Text("No item")),
                );
              }
          ),
        ),
      );
    }
      products = [];
  }
}


