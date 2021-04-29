import 'dart:collection';
import 'dart:ffi';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:last_mile/Controllers/databasehelper.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/widget/bezierContainer.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../customization/colors.dart';
import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';
  String selectDate;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _fnameController = new TextEditingController();
  final TextEditingController _lnameController = new TextEditingController();
  final TextEditingController _birthdayController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();

  String uid;

  ProgressDialog pr;

  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty &&
          _emailController.text.trim().toLowerCase().contains('@') &&
          _passwordController.text.trim().isNotEmpty && _nameController.text.trim().isNotEmpty &&
      _fnameController.text.trim().isNotEmpty && _lnameController.text.trim().isNotEmpty &&
      selectDate != null && _phoneController.text.trim().isNotEmpty)
      {
        databaseHelper.registerData(_nameController.text.trim(),_fnameController.text.trim(),
            _lnameController.text.trim(),
            selectDate.trim(),_emailController.text.trim().toLowerCase(),
            _passwordController.text.trim(), _phoneController.text.trim()).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check email or password'
                'And make sure all Fields are filled';
          }else{
            _registerAccount();
          }
        });
      }
      else{
        _showDialog();
      }
    });
  }
  void _registerAccount() async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;

      if (user != null) {
        Map<String, Object> createDoc = new HashMap();
        createDoc['Name'] = _nameController.text;
        createDoc['Email'] = _emailController.text;
        createDoc['Password'] = _passwordController.text;
        createDoc['PhoneNo'] = _phoneController.text;
        createDoc['FatherName'] = _fnameController.text;
        createDoc['LastName'] = _lnameController.text;
        createDoc['BirthDay'] = _birthdayController.text;
        createDoc['uid']=user.uid;

        FirebaseDatabase.instance
            .reference()
            .child("Customers")
            .child(user.uid)
            .set(createDoc);

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
      } else {
        _showDialog();
        print("failde");
      }
    }catch(e){
      Fluttertoast.showToast(
          msg:  e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      pr.hide();
      // print(e.toString());
    }
  }

  void initState() {
    pr = ProgressDialog(context);

    // TODO: implement initState

    super.initState();
  }

  final format = DateFormat("yyyy-MM-dd");
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
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
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
                style: TextStyle(fontSize: 15 , fontFamily: 'sansb' , letterSpacing: 2.2),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
          ):
          title == 'Phone Number'?
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            child: TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 15 , fontFamily: 'aveb' , letterSpacing: 2.2),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
          ):
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            child: TextField(
              //enabled: false,
              controller: controller,
              style: TextStyle(fontSize: 15 , fontFamily: 'roboto' , letterSpacing: 2.2),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                 // labelText: Text(a==null?'fguy':a),
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }




  Widget _submitButton() {
    return InkWell(
      onTap:
      //_registerAccount,
      _onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width/1.5,
        height: 45,
        margin: EdgeInsets.only(bottom: 5),

        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromRGBO(60, 111, 102, 1),
          border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Text(
          'Register Now'.toUpperCase(),
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                fontFamily: 'sansb',
                letterSpacing: 2.2,
                fontSize: 15.0),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(

        height: 25,
        padding: EdgeInsets.only(left: 15,right: 15,bottom: 5),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 15 , fontFamily: 'roboto', decoration: TextDecoration.underline),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
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
        _entryField("Username",_nameController),
        _entryField("First Name",_fnameController),
        _entryField("Last Name",_lnameController),

        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 10.0, left: 12.0),
            child: Text('Birthday', style: TextStyle(fontSize: 20 , fontFamily: 'sansb'),),
          ),
        ),

        SizedBox(
          height: 10,
        ),

        InkWell(
          onTap: dateField,
          child: Container(
            width: MediaQuery.of(context).size.width/1.2,
            child: TextField(
              enabled: false,
                style: TextStyle(fontSize: 15 , fontFamily: 'aveb' , letterSpacing: 2.2),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
          ),
        ),
        // DateTimeField(
        //   format: format,
        //   decoration: InputDecoration(
        //       border: InputBorder.none,
        //       fillColor: Color(0xfff3f3f4),
        //       filled: true),
        //   onShowPicker: (context, currentValue) {
        //     return showDatePicker(
        //         context: context,
        //         firstDate: DateTime(1900),
        //         initialDate: currentValue ?? DateTime.now(),
        //         lastDate: DateTime(2100));
        //   },
        // ),



        _entryField("Email id",_emailController),
        _entryField("Password",_passwordController),
        _entryField("Phone Number",_phoneController),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: SingleChildScrollView(
          child: Container(
            height: height,
            child: Column(
              children: [
                _title(),
                Container(
                  height: height/1.6,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[



                        _emailPasswordWidget(),
                        SizedBox(height: 10,)


                      ],
                    ),
                  ),

                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // height: 80,
                      child: Column(
                        children: [
                          _submitButton(),
                          SizedBox(height: 10,),
                          _loginAccountLabel(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
                        child: Text('Make Sure All Fields are correct!',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0,color: lightblack, fontFamily: 'aveh'),),
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
            content: Text("Make Sure All Fields are correct!"),



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

  Widget dateField(){
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2050, 12, 1),
        theme: DatePickerTheme(
            headerColor: green,
            backgroundColor: Color(0xfff3f3f4),
            itemStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
        onChanged: (date) {
          print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
          setState(() {
            selectDate = "${date.toLocal()}".split(' ')[0];
          });
        }, onConfirm: (date) {
          print('confirm $date');
          setState(() {
            selectDate = "${date.toLocal()}".split(' ')[0];
    //        year = selectDate.split('-');


            //  _selectTime(context);
          });
        }, currentTime: DateTime.now(), locale: LocaleType.en);

  }

}



class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date field (${format.pattern})'),
      DateTimeField(
        format: format,

        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }

}