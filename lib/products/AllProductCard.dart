import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:last_mile/carts/cart.dart';
import 'package:last_mile/components/style.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/models/product.dart';

class AllProductCard extends StatefulWidget {
  Product product;
  final int ind;

  AllProductCard({this.ind, this.product});
  @override
  AllProductCards createState() => AllProductCards();
}

class AllProductCards extends State<AllProductCard> {
  // final int ind;
  // Product product;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);
    super.initState();
    //img(image);
  }

  //AllProductCards(this.product,this.ind);
  String img(image) {
    return image;
  }

  void picture(image) {
    index = 0;
    image = widget.product.image;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Carts(
            product: widget.product,
            category: null,
            inds: 1,
            indexes: widget.ind,
            laund: 0,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 12.0, bottom: 15,
        ),
        //  padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
            onTap: () => setState(() {
                  picture(widget.product.image[0]);
                }),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              // width: 165,
            //   height: 10,

                // padding: EdgeInsets.all(12.0,),
        //        height: MediaQuery.of(context).size.height/4 ,
//                  decoration: BoxDecoration(
//
//                    color: Colors.white,
//                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Container(
                            //  height: 180,
                            //   width: 75,

//                            child: Image.asset('assets/vase-2.png'),
                            child: Image.network(
                          widget.product.image[0],
                          fit: BoxFit.fill,
                         // width: 165,
                          height: 110,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(widget.product.name, style: robr),
                              width: 100,
                            ),
                          ]),
                    ),

                    // Padding(
                    //                            padding: EdgeInsets.only(top:8.0,left: 8,right: 8),
                    //                            child: Container(
                    //                              height: 30,
                    //                              child: Text(
                    //                              widget.product.name,
                    //                              maxLines: 3,
                    //                              textAlign: TextAlign.left,
                    //                              style: robr12,
                    //                            ),
                    //                          ),),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, bottom: 4, top: 4),
                      child: Text("\$" + widget.product.price[0].toString(),
                          style: robr10),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top:8.0,left: 8),
                    //   child: Text(
                    //     "\$"+widget.product.price[0].toString(),
                    //     textAlign: TextAlign.left,
                    //     style: robr12,
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: RatingBar(
                        unratedColor: Colors.grey[300],
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        // itemPadding: EdgeInsets.all(15.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color(0xFF69CF02),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ))));
  }
}
