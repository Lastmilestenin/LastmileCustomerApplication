import 'package:flutter/material.dart';
import 'package:last_mile/components/style.dart';


import '../customization/colors.dart';

class Voucher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          title: Text('Eatdoori Kesiserstr', style:TextStyle(color: Colors.black),),
        ),
        body: Container(
margin: EdgeInsets.all(18),
      height: size.height,
      width: size.width,

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery'),
        Row(
          children: [
            Icon(Icons.location_on_sharp,size: 15),
            SizedBox(width: 5,),Text('Home (WillimeemerstraBe 13, Eg)')
          ],
        ),
        Text('\nOrder Status'),
        Row(
          children: [
            Icon(Icons.shopping_bag_outlined,  size: 15,),SizedBox(width: 5,),
            Text('Order Delivered'),
          ],
        ),

            Text('\nTotal in EUR'),
            Row(
              children: [
                Icon(Icons.shopping_bag_outlined,size: 15),SizedBox(width: 5,),
                Text('31,30'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){},
              child:   Center(
                child: Container(
                  width: size.width/1.1,
                  height: size.height/14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ), child: Center(child: Text('Rate the order', style: TextStyle(
                  color: green,
                ),)),
                ),
              ),
            ),

            InkWell(
              onTap: (){},
              child:   Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    width: size.width/1.1,
                    height: size.height/14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: green,
                    ), child: Center(child: Text('Order again',)),
                  ),
                ),
              ),
            ),
Text('\nYour order\n', style: robrb,),
        Row(
          children: [
            Text('Order item\n'),
            Spacer(),
            Text('28,40'),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 150,child: Text('Samosa', maxLines: 2,)),

            Text('5,60'),
            Text('x1'),
            Text('5,60'),

          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 150,
                  child: Text('Kharai paneer Naanwhich', maxLines: 2,)),

              Text('11,40'),
              Text('x1'),
              Text('560'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 150,
                child: Text('Chicken Tikka masala', maxLines: 2,)),

            Text('11,40'),
            Text('x1'),
            Text('560'),


          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:15.0),
          child: Divider(),
        ),

            Row(
              children: [
                Text('Delivery : home(Wwilleeememserstble 13, eg)'),


                Spacer(),
                Text('2,30'),


              ],
            ),

        Row(
          children: [
            Text(
              '\nBase delivery fee\n'
            ),
            Spacer(), Text(
                '1,90'
            ),
          ],
        ),
            Row(
              children: [
                Text(
                    'Extra charge for a long delivery distance(1.7 km)',
                ), Spacer(),Text(
                    '1,90'
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Divider(
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20.0),
              child: Row(
                children: [
                  Text('Subtotal'), Spacer(),Text(
                      '31,30'
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20.0),
              child: Row(
                children: [
                  Text('Total'),Spacer(), Text(
                      '31,30'
                  ),
                ],
              ),
            ),

            Divider(),
            SizedBox(height: 15),
            Text('Paymentt details\n'),
            Row(
              children: [
                Text('Card'), Text('1,90'),
                Spacer(),
                Text('31,30'),
              ],
            ),
            Text('0.8.03.21, 19:25'),
SizedBox(height: 20,),
InkWell(
  onTap: (){},
  child:   Center(
    child: Container(
        width: size.width/1.1,
        height: size.height/14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: green,
        ), child: Center(child: Text('Rate the order',)),
    ),
  ),
),
            Text('\nVenue info\n'),
            Text('eatDori Kaisetrti'),
            Text('+496922354'),

            Text('\nOrder Info\n'),
            Text('Order ID: 45d4654sg568h5d7d'),
            Text('Timestamp: 0.8.03.21, 19:25'),
            Text('Service Provider: Wolt, support@wolt.com'),SizedBox(height: 20,),
            InkWell(
              onTap: (){},
              child:   Center(
                child: Container(
                  width: size.width/1.1,
                  height: size.height/14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: green,
                  ), child: Center(child: Text('Send the receipt to my email',)),
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
