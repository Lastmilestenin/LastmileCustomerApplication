import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/credentials/loginPage.dart';
import 'package:last_mile/main.dart';
import 'package:last_mile/models/vendor.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Map.dart';
import '../global.dart';
import 'index.dart';

class SplashScreen extends StatefulWidget {

  static LatLng center;
  @override
  static String tok;
  static List<String> toke = new List();
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences sharedPreferences,vPre;
  Response response;
  String _message = '';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  Future initi()async{
    sharedPreferences = await SharedPreferences.getInstance();
    userid=sharedPreferences.getString("userid").toString();
    if(userid != null){
      API.inprogressorder();
    }
  }

  @override
  void initState() {
    initi().then((value) {
      try{
        userid=sharedPreferences.getString("userid").toString();
      }catch(e){
        print(e.toString());

      }
    });

    final location = new Location();
    var _locationData = location.getLocation();
    _locationData.then((value) {
      setState(() {
        SplashScreen.center = LatLng(value.latitude, value.longitude);
      });
      Vendordata();
      getAddress(value);
    });
    super.initState();

  }
  void startTime()  {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Maps(),));
      });
    });
    // var _duration = new Duration(seconds: 4);
    // return new Timer(_duration, read());
  }
  read() async {
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Maps(),));
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.getString(key);
    // if(value == null){
    //   // Navigator.of(context).push(
    //   //     new MaterialPageRoute(
    //   //       builder: (BuildContext context) => new LoginPage(),
    //   //     )
    //   // );
    //
    //   Navigator.of(context).push(
    //       new MaterialPageRoute(
    //         builder: (BuildContext context) => new Maps(),
    //       )
    //   );
    //
    // }else{
    //   Navigator.of(context).push(
    //       new MaterialPageRoute(
    //         builder: (BuildContext context) => new Maps(),
    //       )
    //   );
    // }
  }
  // void navigationPage() {
  //
  //   Navigator.of(context).push(MaterialPageRoute(builder:(_)=>LoginPage()));
  // }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/finallogo.png'),
      ),
    );
  }
  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => SplashScreen.tok = token);
  }
  void getMessage() {
    var platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      _firebaseMessaging
          .requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
      _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
      });
    }
    else{
      _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
            print('received message');
            setState(() => _message = message["notification"]["body"]);
          }, onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
        setState(() => _message = message["notification"]["body"]);
      }, onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
        setState(() => _message = message["notification"]["body"]);
      });
    }

  }
  waitactivity() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.success == 'true'){
        API.VedonCategory().then((value) {
          startTime();
        });

      }
      else{
        waitactivity();
      }
    });
  }
  void Vendordata() {
    API.Vendordata();
    waitactivity();
  }
  // Future<Vendor> fetchVendor() async {
  //   final response = await http.get(vendorUrl);
  //
  //   if (response.statusCode == 200) {
  //     vPre = await SharedPreferences.getInstance();
  //     return Vendor.fromJson(jsonDecode(response.body)
  //     );
  //
  //   } else {
  //     throw Exception('Failed to Fetch Vendors');
  //   }
  // }
}
/*

class DeleteCheck extends StatefulWidget{

  final offsetBool;
  final double widthSlide;

  DeleteCheck({
    Key key,
    this.offsetBool,
    this.widthSlide
  }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MyDeleteCheck();
  }
}

class _MyDeleteCheck extends State<DeleteCheck> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(widget.widthSlide, 0.0), end: Offset.zero)
        .animate(_controller);

    _offsetFloat.addListener((){
      setState((){});
    });

    _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height100 = MediaQuery.of(context).size.height;
    double width100 = MediaQuery.of(context).size.width;
    return new SlideTransition(
        position: _offsetFloat,
        child: Container(
            color: Colors.cyan,
            width: 0.525*width100-3.0,
            child: Text("hello there sailor")
        )
    );
  }
}*/
