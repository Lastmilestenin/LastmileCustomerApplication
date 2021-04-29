import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/components/style.dart';
import 'package:last_mile/services/TrackDriver.dart';

import 'categorySeeAll.dart';
import 'customization/colors.dart';
import 'customization/index.dart';

class order_tracking extends StatefulWidget {
  @override
  _order_trackingState createState() => _order_trackingState();
}

class _order_trackingState extends State<order_tracking> {
  Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      print("time");
      API.pickeduporders().then((value) {
        setState(() {
          ListBuilder();
        });
      });
    });

    super.initState();

  }

  Widget ListBuilder(){
    return  ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount:pickuporderslist.length,
        itemBuilder: (_, index) {
          return index==0?
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0,top: 10.0),
                        child: Text("Order No: "+pickuporderslist[index].orderno.toString(),style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'aveb'),),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) => TrackDriver(index:index),

                              )
                          );
                        },
                        child:pickuporderslist[index].status=="pickedup"? Padding(
                          padding: EdgeInsets.only(right: 20.0,top: 20.0),
                          child: Text('Track Order',style: TextStyle(fontSize: 14.0,color: lightbrown,fontFamily: 'aveb'),),
                        ):Container()
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
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 20.0,top: 10.0),
//                                             child: Text('Quantity:',style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'aveb'),),
// //                    Padding(
// //                      padding: EdgeInsets.only(left: 10.0),
// //                      child: Text(orders.placedOn,style: TextStyle(fontSize: 15.0,color: Colors.black),),
// //                    ),
//
//                                           ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0,top: 10.0),
                              child: Text('Amount:',style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'aveb'),),
//

                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0,top: 10.0),
                              child: Text('Status:',style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'aveb'),),
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
                            //   child: Text("01",style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0,top: 10.0),
                              child: Text(pickuporderslist[index].price.toString(),style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0,top: 10.0),
                              child: Text(pickuporderslist[index].status.toString().toString(),style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
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
          ):
          pickuporderslist[index].checkorderid==pickuporderslist[index-1].checkorderid?
          Container():
          Padding(
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
                          child: Text("Order No: "+pickuporderslist[index].orderno.toString(),style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'aveb'),),
                        ),
                        Spacer(),
                        InkWell(


                          onTap: (){
                            Navigator.of(context).push(
                                new MaterialPageRoute(
                                  builder: (BuildContext context) => TrackDriver(index:index),

                                )
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.0,top: 20.0),
                            child: Text('Track Order',style: TextStyle(fontSize: 14.0,color: lightbrown,fontFamily: 'aveb'),),
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
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 20.0,top: 10.0),
//                                             child: Text('Quantity:',style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'aveb'),),
// //                    Padding(
// //                      padding: EdgeInsets.only(left: 10.0),
// //                      child: Text(orders.placedOn,style: TextStyle(fontSize: 15.0,color: Colors.black),),
// //                    ),
//
//                                           ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0,top: 10.0),
                                child: Text('Amount:',style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'aveb'),),
//

                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0,top: 10.0),
                                child: Text('Status:',style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'aveb'),),
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
                              //   child: Text("01",style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
                              // ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0),
                                child: Text(pickuporderslist[index].price.toString(),style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0,top: 10.0),
                                child: Text(pickuporderslist[index].status.toString().toString(),style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
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
    );
  }
  @override
  void dispose() {
   _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              globalAppbar(),
              pickuporderslist.length!=0?Expanded(
                child:ListBuilder(),
              ):Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      " NO Order is Picked UP yet",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'aveb',
                          letterSpacing: 2.2),
                    ),
                  ),
                ),
              )
            ],
          ),

        ),

      ),
    );
  }


}
