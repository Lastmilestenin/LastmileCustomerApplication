import 'dart:collection';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_mile/Controllers/databasehelper.dart';
import 'package:last_mile/Map.dart';

import 'package:last_mile/credentials/signUpPage.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/customization/splashscreen.dart';
import 'package:last_mile/orders/orderDetails.dart';
import 'package:last_mile/search/SearchPage.dart';
import 'package:last_mile/widget/bezierContainer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:last_mile/global.dart';
import '../customization/colors.dart';
import '../main.dart';
import '../mainPage.dart';
import 'package:progress_dialog/progress_dialog.dart';


class LoginPage extends StatefulWidget {
//  LoginPage({Key key, this.title}) : super(key: key);
//
//  final String title;
  static bool _isLoading = false;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';
  ProgressDialog pr;


  void initState() {
    pr = ProgressDialog(context);
    super.initState();
  }
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  _onPressed(){
    pr.show();
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty &&
          _emailController.text.trim().toLowerCase().contains('@') &&
          _passwordController.text.trim().isNotEmpty )
      {
        databaseHelper.loginData(_emailController.text.trim().toLowerCase(),
            _passwordController.text.trim()).whenComplete((){
          if(databaseHelper.status){
            pr.hide();
            _showDialog();
            msgStatus = 'Check email or password';
          }else{
            signIn(_emailController.text, _passwordController.text);
            //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Maps()), (Route<dynamic> route) => false);
          }
        });
      }
      else{
        _showDialog();
      }
    });
  }



   Widget _backButton() {
     return InkWell(
       onTap: () {
         Navigator.pop(context);
       },
       child: Container(
         padding: EdgeInsets.symmetric(horizontal: 10),
         child: Row(
           children: <Widget>[
             Container(
               padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
               child: Icon(Icons.keyboard_arrow_left, color: advancegreen),
             ),
             Text('Back',
                 style: TextStyle(fontSize: 12,color: advancegreen, fontWeight: FontWeight.w500))
           ],
         ),
       ),
     );
   }

  Widget _entryField(String title,TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 20 , fontFamily: 'sansb'),
          ),
          SizedBox(
            height: 10,
          ),
         title == 'Password'?
         Container(
           width: MediaQuery.of(context).size.width/1.2,
           child: TextField(
               controller: controller,
               obscureText: true,
               style: TextStyle(fontSize: 15 , fontFamily: 'roboto' , letterSpacing: 2.2),
               decoration: InputDecoration(
                   border: InputBorder.none,
                   fillColor: Color(0xfff3f3f4),
                   filled: true)),
         ):
         Container(
           width: MediaQuery.of(context).size.width/1.2,
           child: TextField(
               controller: controller,
               style: TextStyle(fontSize: 15 , fontFamily: 'aveb' , letterSpacing: 2.2),
               decoration: InputDecoration(
                   border: InputBorder.none,
                   fillColor: Color(0xfff3f3f4),
                   filled: true)),
           ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: _onPressed,
      // emailController.text == "" || passwordController.text == "" ? null : () {
      //   setState(() {
      //     _isLoading = true;
      //   });
      //   signIn(emailController.text, passwordController.text);
      // },
      child: Container(
        width: MediaQuery.of(context).size.width/1.5,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(60, 111, 102, 1),
            border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
            borderRadius: BorderRadius.circular(10.0),
          ),
        child: Text(
          'Login'.toUpperCase(),
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                fontFamily: 'sansb',
                letterSpacing: 2.2,
                fontSize: 15.0)
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or' , style: TextStyle(fontFamily: 'aveb', fontSize: 15),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width/1.5,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'aveh',
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Login with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 2.2,
                      fontFamily: 'sansb',
                      fontWeight: FontWeight.w400),
              maxLines: 2,),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 15, decoration: TextDecoration.underline, fontFamily: 'roboto'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color.fromRGBO(60, 111, 102, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'roboto'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      width: 200,
      height: 100,
      child: Image.asset('assets/finallogo.png'),
    );
  }
  Widget _emailPasswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _entryField("Email id",_emailController),
        _entryField("Password", _passwordController),
      ],
    );
  }

   signIn(String email, pass) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

     Map data = {
       'email': email,
       'password': pass
     };
     var jsonResponse = null;
     var response = await http.post("http://thelastmile.shop/public/api/login", body: data);
     if(response.statusCode == 200) {
       jsonResponse = json.decode(response.body);
       if(jsonResponse != null) {
         setState(() {
           LoginPage._isLoading = false;
         });
         MyApp.sharedPreferences.setString("token", jsonResponse['success']['token']);
         var user = jsonResponse['success']['user'];
         MyApp.sharedPreferences.setString('username', user['name']);
         MyApp.sharedPreferences.setString('useremail', user['email']);
         MyApp.sharedPreferences.setString('userid', user['id'].toString());
         userid=MyApp.sharedPreferences.getString("userid").toString();
         var userdetail = jsonResponse['success']['user']['detail'];
         MyApp.sharedPreferences.setString('userphone', userdetail['phone'].toString());
         MyApp.sharedPreferences.setString('userimage', userdetail['image'].toString());
         _signInWithEmailAndPassword();
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (_) => OrderDetails(globaladdressvar)));

       }
     }
     else {
       setState(() {
         LoginPage._isLoading = false;
       });
       print(response.body);
     }
   }
  void _signInWithEmailAndPassword() async {

    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      if(user != null){
        pr.hide();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>SearchPage(0)));
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg:  e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Failed to sign in with Email & Password");
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Failed to sign in with Email & Password"),
      // ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: LoginPage._isLoading ? Center(child: CircularProgressIndicator()) : Container(
            color: backgroundColor,
            height: height,
            child: Stack(
              children: <Widget>[
//              Positioned(
//                  top: -height * .15,
//                  right: -MediaQuery.of(context).size.width * .4,
//                  child: BezierContainer()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        _title(),
                        SizedBox(height: 1),
                        _emailPasswordWidget(),
                        SizedBox(height: 1),
                        _submitButton(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'aveb')),
                        ),
                        _divider(),
                        _facebookButton(),
                        SizedBox(height: 2),
                        _createAccountLabel(),
                      ],
                    ),
                  ),
                ),
                Positioned(top: 40, left: 0, child: _backButton()),
              ],
            ),
          )),
    );
  }
  void _showDialog(){


    if (!Platform.isIOS) {
      showDialog(
          context:context ,
          builder:(BuildContext context){
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24),bottomRight: Radius.circular(24),bottomLeft: Radius.circular(24))),
//            title: new Text('Failed'),
//            content:  new Text('Check your email or password'
//                'And make sure all Fields are filled'),
              actions: <Widget>[
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20),
                        child: Text('Failed',textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0 , fontFamily: 'aveh'),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20),
                        child: Text('Check Email and Password!',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0,color: lightblack, fontFamily: 'aveh'),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            width: MediaQuery.of(context).size.width /1.5,
                            height: 40,
                            decoration: BoxDecoration(
                              color: green,
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(25.0),
                            ),

                            child: Center(
                                child: new Text("CLOSE",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        letterSpacing: 2.2,
                                        fontFamily: 'aveb'
                                    ))),



                          ),
                        ),
                      ),
                    ],
                  ),
                ),
//              new RaisedButton(
//
//                child: new Text(
//                  'Close',
//                ),
//
//                onPressed: (){
//                  Navigator.of(context).pop();
//                },
//
//              ),
              ],
            );
          }
      );
    }
    else {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return CupertinoAlertDialog(
            title: Text("Failed"),
            content: Text("Check Email and Password!"),



//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24),bottomRight: Radius.circular(24),bottomLeft: Radius.circular(24))),
//            <Widget>
            actions: [
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
                      child: new Text("Close".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.2,
                              fontFamily: 'aveb',
                              fontSize: 15.0))),
                ),
                onPressed:() => Navigator.pop(context),
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