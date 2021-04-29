import 'package:flutter/material.dart';
import 'package:last_mile/carts/cartProducts.dart';

import 'colors.dart';
import '../models/Cart.dart';


class AboutUs extends StatelessWidget {


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
            child: Text('About App',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.grey[100]), ),

        ],
      ),
    );


    return Scaffold(
      //  appBar: appBar,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.grey[100]

        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:80.0),
              child: Container(
                height: MediaQuery.of(context).size.height/1.096,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24), topLeft: Radius.circular(24))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      textAlign: TextAlign.center,style: TextStyle(fontSize: 25.0),),
                  )),
            ),
            appBar
          ],
        )
      ),
    );
  }


}
