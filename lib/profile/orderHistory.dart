import 'package:flutter/material.dart';
import 'package:last_mile/components/style.dart';
import 'voucher.dart';

class OrderHis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size  = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(Icons.keyboard_backspace_outlined, color: Colors.black,)
          ),
          title: Text('Order History', style:TextStyle(color: Colors.black),),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Past Orders', style: robr16),
                ),
                orderCard(text: 'Eatdori', dateTime: 'DateTime', onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Voucher()),
                  );}),
              ],
            ),
          ),
        )));
  }
}


class orderCard extends StatelessWidget {
  @override
  Function onTap;
  String text;
  String dateTime;
  orderCard ({@required this.text,@required this.dateTime, @required this.onTap});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: Colors.white,
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 10.5,

            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text),
                      Text(dateTime)
                    ],

                  ),
                  Spacer(),
                  Text('3131 '),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey,size: 15,)
                ],
              ),
            )),
      ),
    );
  }
}
