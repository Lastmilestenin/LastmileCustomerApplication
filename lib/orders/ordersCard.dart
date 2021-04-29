import 'package:flutter/material.dart';
import 'package:last_mile/carts/cartProducts.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/orders/orderStatus.dart';

import '../Map.dart';
import '../models/Cart.dart';
import '../models/Orders.dart';
import 'orderinprogressdetails.dart';


class OrdersCard extends StatelessWidget {

final Orders orders;
final int ind;

  const OrdersCard({Key key,this.ind, this.orders}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: const EdgeInsets.only(left: 0.0),

          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0,top: 10.0),
                        child: Text("Order No: "+orders.orderno,style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'aveb'),),
                      ),
                      Spacer(),
                      InkWell(


                        onTap: (){


                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) => new OrderinprogressDetails(ind:ind),
                              )
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0,top: 20.0),
                          child: Text('View Details',style: TextStyle(fontSize: 14.0,color: lightbrown,fontFamily: 'aveb'),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:10.0,bottom:10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20.0,top: 10.0),
                              child: Text('Placed On:',style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'aveb'),),
//                    Padding(
//                      padding: EdgeInsets.only(left: 10.0),
//                      child: Text(orders.placedOn,style: TextStyle(fontSize: 15.0,color: Colors.black),),
//                    ),

                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0,top: 10.0),
                              child: Text('Amount:',style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'aveb'),),
//                    Padding(
//                      padding: EdgeInsets.only(left: 10.0),
//                      child: Text(orders.placedOn,style: TextStyle(fontSize: 15.0,color: Colors.black),),
//                    ),

                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:10.0,left: 10.0,bottom: 10.0),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10.0,top: 10.0),
                            //   child: Text(orders.placedOn,style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0,top: 10.0),
                              child: Text('\$${orders.amount ?? 0.0}',style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
                            ),
                
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(endIndent: 20.0,indent: 20.0,)
                ],
              ),
            ),
          ),
    );
  }


}
