

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/models/Purchased.dart';
import 'package:last_mile/models/favourite.dart';


class PurchasedCard extends StatefulWidget {
  final Purchased product;
  final int ind;

  const PurchasedCard({Key key,this.ind, this.product}) : super(key: key);
  @override
  FavouriteCards createState() => FavouriteCards(this.product,this.ind);

}
class FavouriteCards extends State<PurchasedCard> {
  final int ind;
  final Purchased product;
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


                child: Container(
                    padding: EdgeInsets.all(8.0,),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(

                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left:0.0),
                          child: Container(
                            height: 100,
                            width: 90,
                            child: Image.asset(

                                      product.image,
                                      fit: BoxFit.fill,
                                    ),

                            ),
                          ),


                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top:8.0,),
                            child: Text(
                              product.name,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),
                            ),
                          ),
                        ),
                      ],
                    )



                )
            )
        )
    );
  }
}



