import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';

import '../global.dart';
import '../main.dart';

class MasterCard extends StatefulWidget {
  @override
  _MasterCardState createState() => _MasterCardState();
}

class _MasterCardState extends State<MasterCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // get creditcard => null;

  void onModelChange(CreditCardModel model) {
    setState(() {
      cardNumber = model.cardNumber;
      expiryDate = model.expiryDate;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Container(
padding: EdgeInsets.only(right:45),
          child: Center(
            child: Text(
          'Add Card',
          style: TextStyle(color: Colors.grey,fontSize: 14),
          ),
          ),
        ),
        leading: InkWell
          (onTap: () {
          Navigator.pop(context);
        },
            child: Icon(Icons.arrow_back,color: Colors.black,)),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              height: 196,
              width: MediaQuery.of(context).size.width / 1.05,
              animationDuration: Duration(milliseconds: 1500),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(onCreditCardModelChange: onModelChange),
              ),
            ),
            Container(
              height: 45,
              width: 240,
              margin: EdgeInsets.only(bottom: 4),
              child: new RaisedButton(
                color: Color.fromRGBO(60, 111, 102, 1),
                child: Text(
                  credircardbuttontex,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  credit.add(
                    CreditCardModel(
                      cardHolderName: cardHolderName,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      expiryDate: expiryDate,
                      isCvvFocused: isCvvFocused,
                      isselected: -1,
                    ),
                  );

                  final String encodedData =
                      CreditCardModel.encodeMusics(credit);
                  MyApp.sharedPreferences.setString("creditcard", encodedData);

                  Navigator.pop(context);
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
