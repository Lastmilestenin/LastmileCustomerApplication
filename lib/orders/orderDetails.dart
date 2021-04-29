import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:last_mile/PaymentCard/PaymentCardSelect.dart';
import 'package:last_mile/adresses.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/carts/cartProducts.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/main.dart';
import 'package:last_mile/orders/Details.dart';
import 'package:last_mile/orders/orderStatus.dart';
import 'package:last_mile/carts/fullCart.dart';
import 'package:last_mile/search/SearchPage.dart';
import 'package:last_mile/search/searchFile.dart';
import 'package:progress_dialog/progress_dialog.dart';


import '../global.dart';
import '../models/Cart.dart';
class OrderDetails extends StatefulWidget {

  OrderDetails({Key key, this.adr, }) : super(key: key);
  String adr;
  @override
  _OrderDetails createState() => _OrderDetails(this.adr);
}

class _OrderDetails extends State<OrderDetails> {

 //Initial definition of radio button value
  String adr;
  _OrderDetails(this.adr);
  String choice;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FirebaseAuth _auth = FirebaseAuth.instance;
  ProgressDialog pr;

  var subtotal = 0.0, shipping=0.0 , total=0.0;
  generatecost(){
    for(var cost in globalcart){
      subtotal += double.parse(cost.price.toString());
    }

    setState(() {
      subtotal;
      shipping = shippingprice;
      total = subtotal+ shipping;
    });
  }
  @override
  void initState() {
    subtotal = 0.0;
    shipping=0.0 ;
    total=0.0;
    pr = ProgressDialog(context);
    generatecost();
    _registerOnFirebase();
    setState(() {
      _radioValue = "one";
    });
    super.initState();
  }

  String _radioValue;
  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          break;
        case 'two':
          choice = value;
          break;
        case 'three':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }
  void  getUserDetails(String Fname,Lname,email,phone){
    setState(() {
      name=Fname+Lname;
      Email=email;
      Phone=phone;
    });

  }

  _registerOnFirebase() async {
    final User user = _auth.currentUser;
    if (user != null) {
      final uid = user.uid;
      _firebaseMessaging.subscribeToTopic('all');
      _firebaseMessaging.getToken().then((token) {
        final FirebaseDatabase database = FirebaseDatabase.instance;
        database.reference().child('Tokens').child(uid);
        Map<String, Object> createDoc = new HashMap();
        createDoc['token'] = token.toString();
        database.reference().child('Tokens').child(uid).set(createDoc);
      });
    }
  }
  waitforcheckout()async{

    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        pr.hide();
        setState(() {
          showAlertDialogThankyou();
           API.inprogressorder();
           setState(() {
             globalcart.clear();
           });

          // Navigator.of(context)
          //     .pushReplacement(MaterialPageRoute(builder: (_) => SearchPAge()));
        });


      }
      else if(API.success == 'error'){
        pr.hide();
        setState(() {
          showAlertDialogError();
        });


      }
      else {
        waitforcheckout();
      }
    });
  }

  showAlertDialogError() {
    // set up the buttons
    Widget no = FlatButton(
      child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text("Close", style: TextStyle(color: Colors.green)))),
      onPressed: () {

        Navigator.pop(context);
      },
    );
    // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      title: Text("Something Went Wrong ! ",

        style: TextStyle(color: Colors.green, fontSize: 14),
      ),
      actions: [
        no,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }




  showAlertDialogThankyou() {
    // set up the buttons
    Widget yes = FlatButton(
      child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text("OK", style: TextStyle(color: Colors.green)))),
      onPressed: (){
        setState(() {
          globalcart.clear();
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => SearchPage(0)));
        });

      },
    );

    // set up the AlertDialog

    AlertDialog alert = AlertDialog(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      title: Text("ThankYou \n Your Order Submitted Successfully !",

        style: TextStyle(color: Colors.green, fontSize: 14),
      ),
      actions: [

        yes,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  void  getSelectedpayment(String paymentflag){
    setState(() {
      if(paymentflag == 'cash'){
        selectpaymenttype = paymentflag;
      }else{
        selectpaymenttype = 'card';
        selectedcardindex = paymentflag;
      }
    });

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
            icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop(),),

          Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Text('ORDER DETAILS',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.grey[100]), ),

        ],
      ),
        
    );

    Widget topHeader = Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Padding(
          padding: EdgeInsets.only(top: 30.0,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'SHIPPING TO',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0,color: Colors.grey),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () async{

                     await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => AddressChange())).then((value) {
                            setState(() {
                              selectedaddress=value['key2'];
                            });
                     });

                    },
                    child: Text(
                      'Change',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0,color: Color.fromRGBO(60, 111, 102, 1),),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  width: 200,
                  child: Text(selectedaddress == null ? globaladdressvar.toString(): selectedaddress.toString(),),
                ),
              )
            ],
          )

        )
    );


    Widget lowHeader = Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'DETAILS',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0,color: Colors.grey),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Details(getUserDetails: getUserDetails,)));
                    },
                    child: Text(
                      'Change',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0,color: Color.fromRGBO(60, 111, 102, 1),),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  width: 250,
                  child: Email==null? Text(MyApp.sharedPreferences.getString('username') + '\n'+ MyApp.sharedPreferences.getString('useremail') +'\n '+ MyApp.sharedPreferences.getString('userphone'),)
                  :Text(name+" \n "+Email+" \n"+Phone),
                ),
              )
            ],
          ),
        )
    );



    Widget carts =Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top: 10.0,left: 15.0),
          child: Text('PAYMENT METHOD',style: TextStyle(color: Colors.grey,fontSize: 15.0),),
        ),

        Container(
          height: MediaQuery.of(context).size.height/7.5,
          child: Container(

              color: Colors.white,
              child: InkWell(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => PaymentCardDetails(getSelectedpayment: getSelectedpayment,)));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Row(
                        children: [
                          Text('Payment Method',style: TextStyle(fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text('Change',style:TextStyle(
                          color: Color.fromRGBO(60, 111, 102, 1),
                          ),
                          )
  ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: selectpaymenttype == "card"?
                        Row(
                          children: <Widget>[
                            Container(
                              alignment:Alignment.center,
                              child: Icon(
                                Icons.credit_card,
                                color: Colors.green[500],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left:12.0),
                              child: Text(
                                credit.isNotEmpty?
                                maskcardnumber(
                                selectedcardindex == null ? 0
                                    : int.parse(selectedcardindex)
                                )
                                //.cardNumber
                                    : "Cash on Delivery",
                               // style: AppFonts.monm,
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.green[500],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ) : Row(
                          children: [
                            Container(
                              alignment:Alignment.center,
                              child: Icon(
                                Icons.monetization_on,
                                color: Colors.green[500],
                              ),
                            ),
                            Padding(padding: const EdgeInsets.only(left:12.0)),
                            Text("Cash on Delivery",
                                //style: AppFonts.monm
                              ),
                            Spacer(),
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.green[500],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),


      ],
    );

    Widget low = Container(
    height: 169,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(24), topLeft: Radius.circular(24)),

    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
            padding: EdgeInsets.only(left: 20.0,top: 20,right: 20.0),
            child: Row(
              children: <Widget>[
                Text('SUBTOTAL',style: TextStyle(color: Colors.white),),
                Spacer(),
                Text('\$'+subtotal.toString(),style: TextStyle(color: Colors.white),),
              ],
            )
        ),
        Padding(
            padding: EdgeInsets.only(left: 20.0,top: 3,right: 20.0),
            child: Row(
              children: <Widget>[
                Text('SHIPPING',style: TextStyle(color: Colors.white),),
                Spacer(),
                Text(globalshippingtype+' - \$'+shipping.toString(),style: TextStyle(color: Colors.white),),
              ],
            )
        ),
        Container(
            padding: EdgeInsets.only(left: 20.0,top: 5,right: 20.0),
            child: Row(
              children: <Widget>[
                Text('TOTAL',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                Spacer(),
                Text('\$'+total.toString(),style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
              ],
            )
        ),
        Spacer(),
        Padding(
            padding: EdgeInsets.only(top:20.0,left: 60.0),
            child: InkWell(
              onTap:() {
                pr.show();
                var creditcardnum=credit[int.parse(selectedcardindex)].cardNumber.split(" ");
                var cvc=credit[int.parse(selectedcardindex)].cvvCode;
                if(selectedcardindex != null && adr != 0 && globalcart.length != 0) {
                  API.checkout(
                      checkouturl,
                      total.toString(),
                      creditcardnum[0] + creditcardnum[1] + creditcardnum[2] +
                          creditcardnum[3],
                      cvc,
                      adr,
                      month[0],
                      month[1],
                      credit[int.parse(selectedcardindex)].cvvCode
                  );
                  waitforcheckout();
                }
                else{
                  setState(() {
                    pr.hide();
                  });

                  Dialogpopup();

                }

              },
              child: Container(

                width: MediaQuery.of(context).size.width /1.5,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 111, 102, 1),
                  border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                  borderRadius: BorderRadius.circular(25.0),
                ),

                child: Center(
                    child: new Text("PLACE ORDER",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.0))),



              ),
            )
        ),
        SizedBox(height: 5,),
      ],
    )
);
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,

          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //     stops: [0.2, 0.1],
          //     colors: [
          //       Colors.black,
          //       Colors.grey[100],
          //     ],
          //   ),
          //
          // ),
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),

            child: Stack(

              children: <Widget>[


               Padding(
                 padding: const EdgeInsets.only(top:70.0),
                 child: SingleChildScrollView(
                   child: Container(
                        padding: EdgeInsets.all(0.0,),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.2, 0.1],
                            colors: [
                              Colors.black,
                              Colors.white
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24), topLeft: Radius.circular(24)),

                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            topHeader,

                            Divider(indent: 20,
                              endIndent: 20,color: Colors.black,),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: carts,
                            ),

                            Divider(indent: 20,
                              endIndent: 20,color: Colors.black,),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: lowHeader,
                            ),

                          ],
                        ),
                      ),
                 ),
               ),
                Positioned(
                  bottom: 1.0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: low,
                  ),
                ),
                appBar,
              ],
            ),
          ),
        ),
      ),
    );
  }

  String maskcardnumber(var index){
    var a = credit[index].cardNumber.split(' ');
    var b = a[0] + " " + a[1] + " " + a[2] + " ";
    var c = b.replaceAll(RegExp(r'\d{1}'), '*');
    c = c + a[3];
    return c;
  }
 Widget Dialogpopup(){
    return  AlertDialog(
      title: Text('AlertDialog Title'),

      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Enter Valid fields.'),

          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
 }
}
