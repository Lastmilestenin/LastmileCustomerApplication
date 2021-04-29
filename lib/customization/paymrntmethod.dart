import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_mile/Settings.dart';

import '../orders/DeliveryStatus.dart';
import '../carts/cartListing.dart';
import 'colors.dart';
import '../favourites/favourites.dart';
import '../carts/fullCart.dart';
import '../mainPage.dart';

class PaymentMethod extends StatefulWidget {

  int a;
  PaymentMethod(this.a);
  @override
  _PaymentMethodState createState() => _PaymentMethodState(this.a);
}

class _PaymentMethodState extends State<PaymentMethod> {

  int a;
  _PaymentMethodState(this.a);

  int _selectedIndex = 0;
  String address = '';
  String address1 = '';
  String address2 = '';
  String _radioValue;
  String choice;
  String choose = 'Paypal';
  String paypal = 'Paypal';
  String cod = 'Cash on delivery';
  String card = 'Card';
  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          address = 'Default Payment';
          address1 = '';
          address2 = '';
          choose = card;
          break;
        case 'two':
          choice = value;
          address1 = 'Default Payment';
          address = '';
          address2 = '';
          choose = paypal;
          break;
        case 'three':
          choice = value;
          address2 = 'Default Payment';
          address = '';
          address1 = '';
          choose = cod;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

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
            icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.of(context).pop(),),

          Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Text('Change Yor Payment',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.transparent), ),

        ],
      ),
    );
    return Scaffold(

        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
//            mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  appBar,
                  Padding(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Container(width: 200,
                                  child: Row(
                                    children: <Widget>[
                                      Container(height:20,width: 20.0, child: SvgPicture.asset('assets/visa.svg',fit: BoxFit.fill,)),
                                      Text(card,textAlign: TextAlign.start, style: TextStyle(fontSize: 15.0,color: Colors.black),),
                                    ],
                                  )
                              ),
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(address,style: TextStyle(fontSize: 12.0,color: Colors.black),),
                                Radio(
                                  value: 'one',
                                  groupValue: _radioValue,
                                  onChanged: radioButtonChanges,

                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(indent: 20.0,endIndent: 20.0,),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Container(width: 200,
                                  child: Row(
                                    children: <Widget>[
                                      Container(height:20,width: 20.0, child: SvgPicture.asset('assets/paypal.svg',fit: BoxFit.fill,)),
                                      Text(paypal,textAlign: TextAlign.start, style: TextStyle(fontSize: 15.0,color: Colors.black),),
                                    ],
                                  )
                              ),
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(address1,style: TextStyle(fontSize: 12.0,color: Colors.black),),
                                Radio(
                                  value: 'two',
                                  groupValue: _radioValue,
                                  onChanged: radioButtonChanges,

                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(indent: 20.0,endIndent: 20.0,),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Container(width: 200,
                                  child: Row(
                                    children: <Widget>[
                                      Container(height:20,width: 20.0, child: SvgPicture.asset('assets/cod.svg',fit: BoxFit.fill,)),

                                      Text(cod,textAlign: TextAlign.start, style: TextStyle(fontSize: 15.0,color: Colors.black),),
                                    ],
                                  )
                              ),
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(address2,style: TextStyle(fontSize: 12.0,color: Colors.black),),
                                Radio(
                                  value: 'three',
                                  groupValue: _radioValue,
                                  onChanged: radioButtonChanges,

                                ),
                              ],
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: ()=>Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Setting(a,choose))),
                    child: Container(

                      width: MediaQuery.of(context).size.width /1.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: green,
                        border: Border.all(color: green),
                        borderRadius: BorderRadius.circular(25.0),
                      ),

                      child: Center(
                          child: new Text("Set Payment",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.0))),



                    ),
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}
