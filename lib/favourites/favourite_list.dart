import 'package:flutter/material.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/favourites/favouriteCard.dart';
import 'package:last_mile/favourites/favouritelisting.dart';
import '../main.dart';
import '../products/productlisting.dart';
import '../models/favourite.dart';



class FavouriteList extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();

}
class _ProductListPageState extends State<FavouriteList> {

  List<Favourite> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = globalfav;

  }
  @override
  Widget build(BuildContext context) {
    if(globalfav == null)
      globalfav = [];
    if(globalfav.length == 0){
      return Center(child: Image.asset('assets/emptyfolder.png' , width: 200, height: 200,));
    }
    else{
      return  SizedBox(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: globalfav.length,
            itemBuilder: (_, index) {
              return Dismissible(
                key: ObjectKey(globalfav[index]),
                background: Container(color: Colors.red),
                direction: DismissDirection.horizontal,
                child: FavouriteCard(
                  ind: index,
                  product: globalfav[index],
                ),
                onDismissed: (directioon){
                  var save = globalfav[index];

                  globalfav.removeWhere((element) => element.unique ==  globalfav[index].unique);
                  final String encodedData = Favourite.encodeMusics(globalfav);
                  MyApp.sharedPreferences.setString("cart", encodedData);

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Item deleted"),
//                    action: SnackBarAction(
//                        label: "UNDO",
//                        onPressed: () {
//                          //To undo deletion
////                          setState(() {
////                            globalcart.insert(index, save);
////                          });
//
//                        })
                  ));
                },
              );
            }
        ),
      );
    }
  }
}


