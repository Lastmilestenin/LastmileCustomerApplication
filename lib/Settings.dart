import 'package:flutter/material.dart';
import 'package:last_mile/customization/paymrntmethod.dart';
import 'package:last_mile/adresses.dart';
import 'package:last_mile/search/SearchPage.dart';
import 'package:last_mile/storeNearSeeAll.dart';
import 'customization/colors.dart';
import 'customization/index.dart';
import 'orders/DeliveryStatus.dart';
import 'main.dart';
import 'carts/cartListing.dart';
import 'favourites/favourites.dart';
import 'carts/fullCart.dart';
import 'mainPage.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/global.dart';
import 'package:progress_dialog/progress_dialog.dart';



class Setting extends StatefulWidget {
  int a;
  String pay;
  Setting(this.a,this.pay);
  @override
  _SettingState createState() => _SettingState(this.a,this.pay);
}

class _SettingState extends State<Setting> {
  int a;
  String pay;
  _SettingState(this.a,this.pay);
  bool NotificationisSwitched = false;
  bool NewsletteisSwitched = false;
  String notiEnable= 'Disable';
  String newsEnable= 'Disable';
  int _selectedIndex = 0;
  bool isActive=true;
  ProgressDialog pr;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==0){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SearchPage(0)));
      }
      if (_selectedIndex == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => StoreNearSeeAll()));
      } else if (_selectedIndex == 2) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FullCart(
              a: 0,
            )));
      } else if (_selectedIndex == 3) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Favourites(0)));
      } else if (_selectedIndex == 4) {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (_) => Setting(c, 'Paypal')));
      }
    });
  }

  @override
  void initState() {
    userid=MyApp.sharedPreferences.getString("userid").toString();
    // TODO: implement initState
    pr = ProgressDialog(context);
    if(NotificationisSwitched == false)
    {
      notiEnable = 'Disable';
    }
    else{
      notiEnable = 'Enable';
    }
    if(NewsletteisSwitched == false)
    {
      newsEnable = 'Disable';
    }
    else{
      newsEnable = 'Enable';
    }
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      padding: EdgeInsets.only(top:20.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.of(context).pop(),),

          Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Text('Setting',style: TextStyle(fontSize: 15,fontFamily: 'sansb',color: lightblack),),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.transparent), ),

        ],
      ),
    );
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(child: Image.asset('assets/Icons-icon-home.png',color: Colors.black,)),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Container(child: Image.asset('assets/Symbols.png',color: Colors.black,)),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Container(child: Image.asset('assets/Icons-icon-shopping-bag.png',color: Colors.black,)),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Container(child: Image.asset('assets/Icons-icon-bookmark.png',color: Colors.black,)),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Container(child: Image.asset('assets/Icons-icon-settings.png',color: isActive ? Color.fromRGBO(60, 111, 102, 1)
                  : Colors.black,)),
              title: Text(''),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appBar,
            Padding(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('LANGUAGE',
                          style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'sansb')
                          ,),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text('Change',style: TextStyle(fontSize:14,color: advancegreen,)),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 10.0),
                    child: Text('English',style: TextStyle(fontSize: 14.0,fontFamily: 'aveb',color: lightblack)),
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
                        child: Text('PASSWORD',
                            style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'sansb')),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text('Change',style: TextStyle(fontSize:14,color: advancegreen,)),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 10.0),
                    child: Text('****************',style: TextStyle(fontSize: 14.0,fontFamily: 'aveb',color: lightblack)),
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
                        child: Text('LOCATION', style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'sansb'),),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: InkWell(
                          onTap:(){
                            if(userid!="null"){
                              pr.show();
                              getuserloc();
                            }

                          },
                          child: Text('Edit',style: TextStyle(fontSize:14,color: advancegreen,)
                          ),
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 10.0),
                    child: Text('Karachi, PK',style: TextStyle(fontSize: 14.0,fontFamily: 'aveb',color: lightblack)),
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
                        child: Text('RECEIVE NOTIFICATIONS', style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'sansb'),),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Switch(
                          value: NotificationisSwitched,
                          onChanged: (value) {
                            setState(() {
                              NotificationisSwitched = value;
                              if(NotificationisSwitched == false)
                              {
                                notiEnable = 'Disable';
                              }
                              else{
                                notiEnable = 'Enable';
                              }

                            });
                          },
                          activeTrackColor: Color.fromRGBO(60, 111, 102, 1),
                          activeColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 10.0),
                    child: Text(notiEnable,style: TextStyle(fontSize: 14.0,fontFamily: 'aveb',color: lightblack)),
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
                        child: Text('RECEIVE NEWSLETTER', style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'sansb'),),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Switch(
                          value: NewsletteisSwitched,
                          onChanged: (value) {
                            setState(() {
                              NewsletteisSwitched = value;
                              if(NewsletteisSwitched == false)
                              {
                                newsEnable = 'Disable';
                              }
                              else{
                                newsEnable = 'Enable';
                              }
                            });
                          },
                          activeTrackColor: Color.fromRGBO(60, 111, 102, 1),
                          activeColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 10.0),
                    child: Text(newsEnable,style: TextStyle(fontSize: 14.0,fontFamily: 'aveb',color: lightblack)),
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
                        child: Text('PREFERRED METHOD', style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'sansb'),),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: InkWell(
                            onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder: (_) => PaymentMethod(a))),
                            child: Text('Change',style: TextStyle(fontSize:14,color: advancegreen,))
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 10.0),
                    child: Text(pay,style: TextStyle(fontSize: 14.0,fontFamily: 'aveb',color: lightblack)),
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
                        child: Text('PREFERRED TIME', style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'sansb'),),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text('Edit',style: TextStyle(fontSize:14,color: advancegreen,)),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 10.0),
                    child: Text('MT( 18:00 - 20:00 )',style: TextStyle(fontSize: 14.0,fontFamily: 'aveb',color: lightblack)),
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
                        child: Text('SUBSCRIPTIONS', style: TextStyle(fontSize: 14.0,color: lightGrey,fontFamily: 'sansb'),),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text('View',style: TextStyle(fontSize:14,color: advancegreen,)),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 10.0),
                    child: Text('Manage Subscriptions',style: TextStyle(fontSize: 14.0,fontFamily: 'aveb',color: lightblack)),
                  ),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }

  waitactivity() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.success == 'true'){
        pr.hide();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AddressChange()));
      }
      else{
        waitactivity();
      }
    });
  }
  void getuserloc() {
    API.getuseloc('http://thelastmile.shop/public/api/userlocation/' );
    waitactivity();
  }
}