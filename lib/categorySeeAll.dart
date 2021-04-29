import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_mile/main.dart';
import 'package:last_mile/profile/profile.dart';
import 'credentials/loginPage.dart';
import 'credentials/signUpPage.dart';
import 'customization/colors.dart';
import 'customization/index.dart';
import 'orders/orderDetails.dart';
import 'shops/shopCard.dart';
import 'package:last_mile/global.dart';
import 'package:last_mile/components/style.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/categoryScreen.dart';

import 'package:progress_dialog/progress_dialog.dart';
class CatSeeAll extends StatefulWidget {

  @override
  _CatSeeAllState createState() => _CatSeeAllState();
}

class _CatSeeAllState extends State<CatSeeAll> {
  ProgressDialog pr;

  @override
  void initState() {
    pr = ProgressDialog(context);
    super.initState();
  }

  waitactivity(int index) async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.success == 'true'){
        pr.hide();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryScreen(index: index,)),
        );
      }
      else{
        waitactivity(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget appBar = Card(
      elevation: 5,
      child: Container(
        height: kToolbarHeight + MediaQuery.of(context).padding.top / 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                  width: 15),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                  child: Text(
                    globaladdressvar.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'aveb',
                        letterSpacing: 2.2),
                    maxLines: 1,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {




                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                child: CircleAvatar(
                  child:  ClipRRect(
                    borderRadius: new BorderRadius.circular(100.0),
                    child:Image.network("https://upload.wikimedia.org/wikipedia/commons/3/32/Flag_of_Pakistan.svg"),
                  ),),
                radius: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
    return SafeArea(
        child: Scaffold(
            body: Container(

              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:SingleChildScrollView(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  globalAppbar(),
                  Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: 50,
                        //width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 15, right: 15),
                              hintText: "What are you looking for?",
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      )),
                  Padding(padding: EdgeInsets.only(left: 20,bottom: 5 ),
                      child:Text('Categories', style: sansb22,)
                  ) ,
                  Padding(padding: EdgeInsets.only(left: 15,),child:   SizedBox(
                    height: MediaQuery.of(context).size.height ,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: GridView.builder(
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: vendorcatlist.length,
                        itemBuilder: (_, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child:InkWell(
                                  onTap: (){
                                    pr.show();
                                    API.VedonCategoryID(vendorcatlist[index].id.toString());
                                    waitactivity(index);
                                  },
                                  child: Container( child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      vendorcatlist[index].image==null?"https://upload.wikimedia.org/wikipedia/commons/3/32/Flag_of_Pakistan.svg": vendorcatlist[index].image,
                                      fit: BoxFit.fill,
                                      width: 165,
                                      height: 150,
                                    ),
                                  ),
                                  ),),),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 4),
                                child: Text(
                                  vendorcatlist[index].name,
                                  style: robr,
                                ),

                              )],
                          );
                        }),
                  ),)
                ],
              ),
              ),
            )));
  }
}

class globalAppbar extends StatelessWidget {
  static void _showDialog(BuildContext context) {
    // flutter defined function

    if (MyApp.sharedPreferences.getString('token') != null) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => OrderDetails(adr:globaladdressvar)));
    } else {
      if (!Platform.isIOS) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Sign in',
                        style: sansb22,
                      ),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.0, bottom: 20.0, right: 20),
                      child: Text(
                        'Already have an account?',

                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: lightblack,
                            fontFamily: 'roboto'),
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.only(top: 10.0, bottom: 0.0,right: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromRGBO(60, 111, 102, 1),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => LoginPage())),
                              child: Center(
                                child: new Text("Login".toUpperCase(),
                                    style: const TextStyle(
            color: green,
            letterSpacing: 2.2,
            fontFamily: 'sansb',
            fontSize: 15.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 10.0,right: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(60, 111, 102, 1),
                              border: Border.all(
                                color: Color.fromRGBO(60, 111, 102, 1),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => SignUpPage())),
                              child: Center(
                                child: new Text("Sign up".toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 2.2,
                                        fontFamily: 'sansb',
                                        fontSize: 15.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
SizedBox(height: 5,)

                  ],
                )
              ],
            );
          },
        );
      } else {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return CupertinoAlertDialog(



//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24),bottomRight: Radius.circular(24),bottomLeft: Radius.circular(24))),
//            <Widget>
              actions: [
                CupertinoDialogAction(child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Sign in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0, fontFamily: 'aveh', color: Colors.black),
                    ),
                    Spacer(),
                    Icon(Icons.cancel,size: 30,),
                  ],
                ),

                  onPressed: () {
                    Navigator.pop(context);
                  },

                ),
                // CupertinoDialogAction(
                //
                //   isDefaultAction: true,
                //   child: Container(
                //     width: MediaQuery.of(context).size.width / 1.5,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: green,
                //       border: Border.all(color: green),
                //       borderRadius: BorderRadius.circular(25.0),
                //     ),
                //     child: Center(
                //         child: new Text("CONTINUE AS GUEST",
                //             style: const TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 15.0,
                //                 letterSpacing: 2.2,
                //                 fontFamily: 'aveb'))),
                //   ),
                //   // onPressed: () => Navigator.of(context)
                //   //               .push(MaterialPageRoute(builder: (_) => OrderDetails(adr:globaladdressvar))),
                // ),

                CupertinoDialogAction(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Already have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                          color: lightblack,
                          fontFamily: 'aveh'),
                    ),
                  ),
                ),

                CupertinoDialogAction(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(60, 111, 102, 1),
                      border: Border.all(
                        color: Color.fromRGBO(60, 111, 102, 1),
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                        child: new Text("Login".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.2,
                                fontFamily: 'aveb',
                                fontSize: 15.0))),
                  ),
                  onPressed:() => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => LoginPage())),
                ),

                CupertinoDialogAction(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(60, 111, 102, 1),
                      border: Border.all(
                        color: Color.fromRGBO(60, 111, 102, 1),
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                        child: new Text("Sign up".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.2,
                                fontFamily: 'aveb',
                                fontSize: 15.0))),

                  ),
                  onPressed:() => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SignUpPage())),
                ),

                // usually buttons at the bottom of the dialog
//                Center(
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20),
//                        child: Text('Sign in',textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0 , fontFamily: 'aveh'),),
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
//                          child: InkWell(
//                            onTap: () => Navigator.of(context)
//                                .push(MaterialPageRoute(builder: (_) => OrderDetails(globaladdressvar))),
//                            child: Container(
//
//                              width: MediaQuery.of(context).size.width /1.5,
//                              height: 50,
//                              decoration: BoxDecoration(
//                                color: green,
//                                border: Border.all(color: green),
//                                borderRadius: BorderRadius.circular(25.0),
//                              ),
//
//                              child: Center(
//                                child: new Text("CONTINUE AS GUEST",
//                                  style: const TextStyle(
//                                      color: Colors.white,
//                                      fontSize: 15.0,
//                                      letterSpacing: 2.2,
//                                      fontFamily: 'aveb'
//                                  )
//                                )
//                              ),
//                            ),
//                          )
//                      ),
//
//                      Padding(
//                        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20),
//                        child: Text('Already have an account?',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0,color: lightblack, fontFamily: 'aveh'),),
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
//                        child: Container(
//
//                          width: MediaQuery.of(context).size.width /1.5,
//                          height: 50,
//                          decoration: BoxDecoration(
//                            color: Color.fromRGBO(60, 111, 102, 1),
//                            border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
//                            borderRadius: BorderRadius.circular(25.0),
//                          ),
//
//                          child: InkWell(
//                            onTap: () =>
//                                Navigator.of(context)
//                                    .push(MaterialPageRoute(builder: (_) => LoginPage())),
//                            child: Center(
//                                child: new Text("Login".toUpperCase(),
//                                    style: const TextStyle(
//                                        color: Colors.white,
//                                        letterSpacing: 2.2,
//                                        fontFamily: 'aveb',
//                                        fontSize: 15.0))),
//                          ),
//                        ),
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
//                        child: Container(
//
//                          width: MediaQuery.of(context).size.width /1.5,
//                          height: 50,
//                          decoration: BoxDecoration(
//                            color: Color.fromRGBO(60, 111, 102, 1),
//                            border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
//                            borderRadius: BorderRadius.circular(25.0),
//                          ),
//
//                          child: InkWell(
//                            onTap: () =>
//                                Navigator.of(context)
//                                    .push(MaterialPageRoute(builder: (_) => SignUpPage())),
//                            child: Center(
//                                child: new Text("Sign up".toUpperCase(),
//                                    style: const TextStyle(
//                                        color: Colors.white,
//                                        letterSpacing: 2.2,
//                                        fontFamily: 'aveb',
//                                        fontSize: 15.0))),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                )
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 5,
      child: Container(
        height: kToolbarHeight + MediaQuery.of(context).padding.top / 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                  width: 15),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                  child: Text(
                    globaladdressvar.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'sansb',
                        letterSpacing: 2.2),
                    maxLines: 1,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  var token= MyApp.sharedPreferences.getString("token");
                  if(token==null){
                    _showDialog(context);
                  }else{
                    var name=MyApp.sharedPreferences.getString('username');
                    var image=MyApp.sharedPreferences.getString('userimage');
                    var number=MyApp.sharedPreferences.getString('userphone');
                    var email=MyApp.sharedPreferences.getString('useremail');


                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile(name:name,image:image,number:number,email:email)),
                    );
                  }

                },
                child: Container(
                  child: CircleAvatar(
                    child:  ClipRRect(
                      borderRadius: new BorderRadius.circular(100.0),
                      child:Image.network("https://upload.wikimedia.org/wikipedia/commons/3/32/Flag_of_Pakistan.svg"),
                    ),),
                ),
                radius: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
