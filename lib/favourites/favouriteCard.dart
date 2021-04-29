

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_mile/models/favourite.dart';


class FavouriteCard extends StatefulWidget {
  final Favourite product;
  final int ind;

  const FavouriteCard({Key key,this.ind, this.product}) : super(key: key);
  @override
  FavouriteCards createState() => FavouriteCards(this.product,this.ind);

}
class FavouriteCards extends State<FavouriteCard> {
  final int ind;
  final Favourite product;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);


    super.initState();
    //img(image);

  }
  FavouriteCards(this.product,this.ind);
  

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            padding: EdgeInsets.all(8.0,),
            child: InkWell(

                child: Card(
                  elevation: 0,
//                    padding: EdgeInsets.all(8.0,),
//                    height: MediaQuery.of(context).size.height/1.05,
//                    decoration: BoxDecoration(
//
//                      color: Colors.white,
//                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left:0.0),
                          child: Container(
                            height: 100,
                            width: 90,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(product.image),
                            )


                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:8.0,),
                              child: Text(
                                product.name,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400,color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:8.0,),
                              child: Text(
                                '\$${product.price ?? 0.0}',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),
                              ),
                            ),
                          ],
                        ),


                      ],
                    )



                )
            )
        )
    );
  }
}



