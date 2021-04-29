import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global.dart';
import '../main.dart';
import 'CreditCard.dart';


class PaymentCardDetails extends StatefulWidget {
  final getSelectedpayment;
  PaymentCardDetails({Key key, this.getSelectedpayment}) : super(key: key);
  @override
  _PaymentCardDetailsState createState() => _PaymentCardDetailsState();
}

class _PaymentCardDetailsState extends State<PaymentCardDetails> {
  int _groupValue1 = -1;
  int _groupValue2 = -1;
  var visible = false;

  void setisselected(var index, var newvalue) {
    setState(() {
      for (int i = 0; i < credit.length; i++) {
        if (i == index) {
          credit[i].isselected = newvalue;
        } else {
          credit[i].isselected = -1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
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
          title: Text('Select a Payment Method',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,fontFamily: 'aveb',color: Colors.black),),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 5.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),

                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white,),
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                    child: Column(
                      children: <Widget>[
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     children: <Widget>[
                        //       Container(
                        //         child: Radio(
                        //           value: 1,
                        //           activeColor: Colors.green,
                        //           groupValue: _groupValue1,
                        //           onChanged: (newValue) => setState(() {
                        //             selectpaymenttype = "cash";
                        //             setState(() {
                        //               widget.getSelectedpayment("cash");
                        //             });
                        //             _groupValue1 = newValue;
                        //             visible = false;
                        //
                        //             _groupValue2 = -1;
                        //             Future.delayed(
                        //                 const Duration(milliseconds: 500), () {
                        //               Navigator.pop(context);
                        //               // Navigator.pop(context);
                        //               // Navigator.of(context)
                        //               //     .push(MaterialPageRoute(builder: (_) => FoodCheckout()));
                        //             });
                        //           }),
                        //         ),
                        //       ),
                        //       Container(
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 8.0),
                        //           child: Column(
                        //             crossAxisAlignment:
                        //             CrossAxisAlignment.start,
                        //             children: <Widget>[
                        //               Text(
                        //                 'Cash',
                        //                // style: AppFonts.monm,
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Spacer(),
                        //       Container(
                        //         child: Icon(
                        //           Icons.attach_money,
                        //           color: Colors.green[500],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Divider(
                        //
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Radio(
                                  value: 1,
                                  activeColor: Colors.green,
                                  groupValue: _groupValue2,
                                  onChanged: (newValue) => setState(() {
                                    selectpaymenttype = "card";
                                    //widget.getSelectedpayment("card");
                                    // setState(() {
                                    //   widget.getSelectedpayment("payment");
                                    // });
                                    _groupValue2 = newValue;
                                    visible = true;
                                    _groupValue1 = -1;
                                    Future.delayed(
                                        const Duration(milliseconds: 500),
                                            () {});
                                  }),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Credit or Debit Card',
                                        //  style: AppFonts.monm,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Icon(
                                  Icons.credit_card,
                                  color: Color.fromRGBO(60, 111, 102, 1),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Visibility(
                visible: visible,
                child: Container(
                  color: Colors.white,
                  height: credit.length*68.0,
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: credit.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Radio(
                                        toggleable: true,
                                        value: 1,
                                        groupValue: credit[index].isselected,
                                        activeColor: Colors.green,
                                        onChanged: (newValue) => setState(() {
                                          //setState(() {
                                          if (selectedcardindex !=
                                              index.toString()) {
                                            setisselected(index, newValue);
                                            selectedcardindex =
                                                index.toString();
                                            MyApp.sharedPreferences.setString(
                                                "selectedcardindex",
                                                selectedcardindex.toString());
                                            widget.getSelectedpayment(
                                                selectedcardindex.toString());
                                            //});
                                            credit[index].isselected = newValue;
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 500), () {
                                              Navigator.pop(context);
                                            });
                                          } else {
                                            widget.getSelectedpayment(
                                                selectedcardindex);

                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 200), () {
                                              Navigator.pop(context);
                                            });
                                          }
                                        }),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              credit[index].cardNumber,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "Card Holder | " +
                                                  credit[index].cardHolderName,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Icon(
                                        Icons.credit_card,
                                        color: Color.fromRGBO(60, 111, 102, 1),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0,top:4.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MasterCard()));
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
                      child: new Text("ADD CARD",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0))),



                ),
              ),
            ),
          ),
        ),
        // bottomNavigationBar:
        // Container(
        //   padding: EdgeInsets.only(bottom: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "SELECT ANY CARD",
        //         style: TextStyle(
        //
        //             color: Color(0xff454545),
        //             fontFamily: "Open Sans Bold",
        //             fontSize: 12.0,fontWeight: FontWeight.bold),
        //       ),
        //       // SizedBox(height: 10,)
        //
        //     ],
        //   ),
        // ),
      ),
    );
  }
}