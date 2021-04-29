import 'package:flutter/material.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/models/Orders.dart';


import 'orderStatus.dart';


class OrderinprogressDetails extends StatefulWidget {

  final int ind;

  const OrderinprogressDetails({this.ind});
  @override
  _OrderinprogressDetailsState createState() => _OrderinprogressDetailsState();
}

class _OrderinprogressDetailsState extends State<OrderinprogressDetails> {
  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      padding: EdgeInsets.only(top:20.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.of(context).pop(),),

          Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Text('ORDER HISTORY',style: TextStyle(fontSize: 13,fontFamily: 'aveb',color: lightblack),),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.grey[200]), ),

        ],
      ),
    );
    return Scaffold(

      body: Container(

        color: Colors.grey[200],


        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              appBar,
              Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:Container(
                        padding: EdgeInsets.all(0.0,),
                        height: MediaQuery.of(context).size.height/1.15,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24), topLeft: Radius.circular(24)),

                        ),
                        child: ListView.builder(

                            scrollDirection: Axis.vertical,
                            itemCount: inprogressList[widget.ind].details.length,
                            itemBuilder: (_, index) {
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
                                              child: Text("Order No: "+inprogressList[widget.ind].details[index].orderno.toString(),style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'aveb'),),
                                            ),
                                            Spacer(),
                                            InkWell(


                                              onTap: (){


                                                Navigator.of(context).push(
                                                    new MaterialPageRoute(
                                                      builder: (BuildContext context) => new OrderStatus(status:  inprogressList[widget.ind].details[index].status.toString()),

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
                                                    child: Text('Quantity:',style: TextStyle(fontSize: 14.0,color: Colors.black,fontFamily: 'aveb'),),
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
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10.0,top: 10.0),
                                                    child: Text(inprogressList[widget.ind].details[index].quantity,style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10.0,top: 10.0),
                                                     child: Text(inprogressList[widget.ind].details[index].amount.toString(),style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10.0,top: 10.0),
                                                    child: Text(inprogressList[widget.ind].details[index].status.toString(),style: TextStyle(fontSize: 14.0,color: lightblack,fontFamily: 'aveb'),),
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
                        ),
                      )
                  ),
                ],
              ),





            ],
          ),
        ),
      ),
    );
  }
}
