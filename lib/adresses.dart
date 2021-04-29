import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:last_mile/address/addresslist.dart';
import 'package:last_mile/global.dart';
import 'package:last_mile/orders/orderDetails.dart';
import 'package:last_mile/widget/AddnewAddress.dart';
import 'package:shimmer/shimmer.dart';
import 'customization/index.dart';
import 'orders/DeliveryStatus.dart';
import 'carts/cartListing.dart';
import 'customization/colors.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'favourites/favourites.dart';
import 'carts/fullCart.dart';
import 'mainPage.dart';

class AddressChange extends StatefulWidget {

  @override
  _AddressChangeState createState() => _AddressChangeState();
}

class _AddressChangeState extends State<AddressChange> {


  int _selectedIndex = 0;
  String address = '';
  String address1 = '';
  String address2 = '';
  var _radioValue;
  String choice;
  String a1 = 'R88 Block 16/ Fedral B Area Karachi / Pakistan';
  String a2 = '1A Block 8/ Gulshan Karachi / Pakistan';

  String a3 = 'T65 Block 18/ Nazimabad Karachi / Pakistan';
  String choose = 'R88 Block 16/ Fedral B Area Karachi / Pakistan';
bool _enabled = true;
  radioButtonChanges(var value) {
    setState(() {
      _radioValue = value;
     //Debug the choice in console
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();

  }
  void init(){
    API.getuseloc(getlocationsURL+ userid);
    waitactivity();
  }
  waitactivity() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.success == 'true'){
        print('data updated');
        setState(() {
          ListBuilder();
        });
      }
      else{
        waitactivity();
      }
    });
  }

Widget ListBuilder(){

    return  Padding(
      padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
      child:  Container(

        height: MediaQuery.of(context).size.height/1.5,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: addresslist.length,

            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Container(width: 200, child: Text(addresslist[index].address.toString(),textAlign: TextAlign.start, style: TextStyle(fontSize: 15.0,color: Colors.black),)),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            // Text(address2,style: TextStyle(fontSize: 12.0,color: Colors.black),),
                            Radio(
                              value: index,
                              groupValue: addresslist[index].slected,
                              //  onChanged: radioButtonChanges(id),
                              onChanged: (val) =>
                                  setState(() {
                                    for(int i = 0; i< addresslist.length; i++){
                                      if(i != index){
                                        addresslist[i].slected = -1;
                                      }
                                      else{
                                        _radioValue=val;
                                        addresslist[index].slected = val;
                                        choose = addresslist[index].address;
                                        selectedaddress=addresslist[index].address;
                                        selcted_address=addresslist[index].id;
                                      }
                                    }
                                    //if(value==1){
                                    // }
                                    // else{
                                    //   addresslist[index].slected=1;
                                    // }
                                  }),
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey,thickness: 3,),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
}

  Widget addresscard(String address , var id){
    return Padding(
      padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Container(width: 200, child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Text(address.toString(),textAlign: TextAlign.start, style: TextStyle(fontSize: 15.0,color: Colors.black),))),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(address2,style: TextStyle(fontSize: 12.0,color: Colors.black),),
                  Radio(
                    value: id,
                    groupValue: id,
                  //  onChanged: radioButtonChanges(id),
                    onChanged: (id) {
                      print("Radio id");
                      radioButtonChanges(id);
                    },

                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      padding: EdgeInsets.only(top:10.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context,_radioValue);
              } ,
          ),

          Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Text('Change Your Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.transparent), ),

        ],
      ),
    );
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            leading: InkWell(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black38,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text('Change Your Address',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,fontFamily: 'aveb',color: Colors.black),),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(

              children: <Widget>[
                Column(
                  children: <Widget>[
                   // appBar,
                    ListBuilder(),
                  ],
                ),
                Positioned.fill(
                  bottom: 10.0,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: (){
                            final data = { "key1" : _radioValue, "key2" : choose };
                            Navigator.pop(context,data);
                            //Navigator.pop(context,_radioValue,choose);
                          },
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (_) => OrderDetails(adr:choose))),
                          child: Container(
                            margin: EdgeInsets.only(left: 15.0),
                            width: MediaQuery.of(context).size.width*0.38,
                            height: 50,
                            decoration: BoxDecoration(
                              color: green,
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(25.0),
                            ),

                            child: Center(
                                child: new Text("Set Address",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.0))),
                          ),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: ()=>Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => AddnewAddress())),
                          child: Container(
                            margin: EdgeInsets.only(right: 15.0),
                            width: MediaQuery.of(context).size.width*0.38,
                            height: 50,
                            decoration: BoxDecoration(
                              color: green,
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Center(
                                child: new Text("Add Address",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
}
