

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/products/product_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../carts/cart.dart';
import '../customization/index.dart';
import 'productlisting.dart';
import 'package:last_mile/components/style.dart';
import '../models/product.dart';



class ProductCard extends StatefulWidget {
  final Product product;
  final int ind;

  const ProductCard({Key key,this.ind, this.product}) : super(key: key);
  @override
  ProductCards createState() => ProductCards(this.product,this.ind);

}
class ProductCards extends State<ProductCard> {
  final int ind;
  final Product product;
  @override
  void initState() {
    // TODO: implement initState

   // img(image);
    super.initState();
    //img(image);

  }
  ProductCards(this.product,this.ind);
String img(image)
{


    return image;

}


  void picture(image)
  {
    index = 0;
     image= product.image;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        context: context,
        builder: (BuildContext bc){
          return Carts(product:product,category: null,inds: 1,indexes: ind,laund: 0,);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left:8.0, right: 4),
      //  padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
            height: MediaQuery.of(context).size.height,
            width: 170,

          //  padding: EdgeInsets.all(0.0,),
          child: InkWell(
            onTap: () =>

            setState(() {
              picture(product.image[0]);
            }),
              child: Container(


                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                 // padding: EdgeInsets.all(12.0,),
//                  height: MediaQuery.of(context).size.height,
//                  decoration: BoxDecoration(
//
//                    color: Colors.white,
//                  ),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(  topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Container(
                           // height: 100,
                            // width: 100,

//                            child: Image.asset('assets/vase-2.png'),
                              child: Image.network(product.image[0],
                                fit: BoxFit.fill,

                                height: 110,
                              )

                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            8, 8, 8, 0),
                        child:  Container(
                          child:  Text( product.name, style: robr),
                          width: 100,
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(
                      //       8, 8, 8, 0),
                      //     child: Text(
                      //       product.name,
                      //       textAlign: TextAlign.left,
                      //       style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: 'aveb'),
                      //     ),
                      //   ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 8.0, top: 4,bottom: 4),
                        child: Text("\$"+product.price[0].toString(), style: robr10),
                      ),


                      // Padding(
                      //   padding: EdgeInsets.only(top:8.0,),
                      //   child: Text(
                      //     "\$"+product.price[0].toString(),
                      //     textAlign: TextAlign.left,
                      //     style: TextStyle(fontSize: 20.0,color: lightblack,fontFamily: 'aveh'),
                      //   ),
                      // ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 8.0),
                        child: RatingBar(
                          unratedColor: Colors.grey[300],
                          initialRating:3,// double.parse(vendorList[index].rating.toString()) ,
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
                          // onRatingUpdate: (rating) {
                          //   print(rating);
                          // },
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



