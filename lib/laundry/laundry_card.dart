import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_mile/carts/cart.dart';
import 'package:last_mile/category/categoryListing.dart';
import 'package:last_mile/models/laundry.dart';

import '../customization/index.dart';



class LaundryCard extends StatefulWidget {
  final Laundry product;
  final int ind;

  const LaundryCard({Key key,this.ind, this.product}) : super(key: key);
  @override
  LaundryCards createState() => LaundryCards(this.product,this.ind);

}
class LaundryCards extends State<LaundryCard> {
  final int ind;
  final Laundry product;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);


    super.initState();
    //img(image);

  }
  LaundryCards(this.product,this.ind);
  String img(image)
  {


    return image;

  }
  Widget cards(context){
    int a = product.image.length;
    if(a == 2){
      return Padding(
        padding: const EdgeInsets.only(top:14.0),
        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                  image = product.image[index];
                  return image;
                  //img(image);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 1;
                  image = product.image[index];
                  // img(image);
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[1],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
        ]),
      );
    }
    else if(a ==3)
    {
      return Padding(
        padding: const EdgeInsets.only(top:14.0),
        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 1;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[1],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 2;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[2],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
        ]),
      );
    }
    else if(a == 4)
    {
      return Padding(
        padding: const EdgeInsets.only(top:14.0),
        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 1;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[1],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 2;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[2],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 3;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[3],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),

        ]),
      );
    }
    else if(a > 4)
    {
      return Padding(
        padding: const EdgeInsets.only(top:14.0),
        child: Row(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 1;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[1],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 2;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[2],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 3;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[3],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child:   GestureDetector(
              onTap: (){
                setState(() {
                  index = 4;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: 50,
                width: 50,
                child: Image.asset(
                  product.image[4],
                  fit: BoxFit.fill,

                ),
              ),
            ),
          ),
        ]),
      );
    }
    else
    {
      return
        Padding(
          padding: EdgeInsets.only(right: 5.0),
          child:   GestureDetector(
            onTap: () {
              setState(() {
                index = 0;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              height: 50,
              width: 50,
              child: Image.asset(
                product.image[0],
                fit: BoxFit.fill,

              ),
            ),
          ),
        );
    }

  }

  void picture(image)
  {
    index = 0;
    image= product.image[index];
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        context: context,
        builder: (BuildContext bc){
          return Carts(product:null,category: null,laundry:laundry[ind],inds: 2,indexes: ind,laund: 1,);
        }


    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
            padding: EdgeInsets.all(12.0,),
            child: InkWell(
                onTap: () =>

                    setState(() {
                      picture(image);
                    }),

                child: Container(

                  child: Stack(
                    children: <Widget>[

                      Container(
                     //   padding: EdgeInsets.symmetric(vertical: 10.0),
                        margin: const EdgeInsets.only(top: 10),
                        color: Colors.white,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  stops: [0.1,0.4, 2.1],
                                  colors: [
                                    Colors.black87,
                                    Colors.brown[700],
                                    Colors.orange[700],
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(

                                      height: MediaQuery.of(context).size.height/3.5,
                                      width: 330,
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 150,
                                            child: Padding(
                                              padding: EdgeInsets.only(top:8.0,left: 18.0),
                                              child: Text(
                                                product.name,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top:18.0,left: 18.0),
                                            child: Text(
                                              product.desc[0],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 15.0,color: Colors.white),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top:18.0,left: 18.0),
                                            child: Text(
                                              '\$${product.price[0] ?? 0.0}',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      Positioned(
                          child: Padding(
                            padding: EdgeInsets.only(left:180.0),
                            child: Hero(
                              tag: product.image,
                              child: Image.asset(
                                product.image[0] ?? '',

                                width: 150,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                      ),
                    ],

                  ),
                )
            )
        )
    );
  }
}






/* child: Container(

        child: Stack(
          children: <Widget>[

            Container(
              margin: const EdgeInsets.only(top: 10),
              color: Colors.white,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        stops: [0.1,0.4, 2.1],
                        colors: [
                          Colors.black87,
                          Colors.brown[700],
                          Colors.orange[700],
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(

                            height: MediaQuery.of(context).size.height/4.2,
                            width: 330,
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  child: Padding(
                                    padding: EdgeInsets.only(top:8.0,left: 18.0),
                                    child: Text(
                                      category.name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top:18.0,left: 18.0),
                                  child: Text(
                                    category.weight,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15.0,color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top:18.0,left: 18.0),
                                  child: Text(
                                    category.price,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  )
              ),
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(left:180.0),
                child: Hero(
                  tag: category.image,
                  child: Image.asset(
                    category.image ?? '',

                    width: 150,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ),
          ],

        ),
      )*/