import 'package:flutter/material.dart';
import 'package:last_mile/Settings.dart';
import 'package:last_mile/orders/orderStatus.dart';
import 'package:last_mile/customization/paymentPage.dart';

import 'colors.dart';
import 'faqPage.dart';

class ProfilePage extends StatelessWidget {
  int a;
  ProfilePage(this.a);
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
            child: Text('Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.grey[100]), ),

        ],
      ),
    );


    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
            EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: <Widget>[
                appBar,
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage('assets/atif.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Atif Aslam',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                           // color: transparentYellow,
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/wallet.png'),
                              onPressed:(){}
                            ),
                            Text(
                              'Wallet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/truck.png'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => OrderStatus())),
                            ),
                            Text(
                              'Shipped',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/card.png'),
                              onPressed:()=> Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => PaymentPage())),
                            ),
                            Text(
                              'Payment',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/contact_us.png'), onPressed: () {},
                            ),
                            Text(
                              'Support',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Settings'),
                  subtitle: Text('Password and Notifications'),
                  leading: Image.asset('assets/settings_icon.png', fit: BoxFit.scaleDown, width: 30, height: 30,),
                  trailing: Icon(Icons.chevron_right, color: yellow),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Setting(a,'Paypal'))),
                ),
                Divider(),
                ListTile(
                  title: Text('Help & Support'),
                  subtitle: Text('Help center and legal support'),
                  leading: Image.asset('assets/support.png'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: yellow,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('FAQ'),
                  subtitle: Text('Questions and Answer'),
                  leading: Image.asset('assets/faq.png'),
                  trailing: Icon(Icons.chevron_right, color: yellow),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => FaqPage())),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
