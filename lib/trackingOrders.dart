
import 'package:flutter/material.dart';
import 'package:last_mile/credentials/contactUs.dart';

class Tracking_orders extends StatefulWidget {
  @override
  _Tracking_ordersState createState() => _Tracking_ordersState();
}

class _Tracking_ordersState extends State<Tracking_orders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [

              Text("Tracking Orders"),

            ],
          ),
        )
      ),
    );
  }
}
