import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last_mile/Map.dart';
import 'package:last_mile/adresses.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/classes/Distance.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/customization/splashscreen.dart';
import 'package:last_mile/search/searchingFor.dart';
import 'package:location/location.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rubber/rubber.dart';

import '../global.dart';

class AddnewAddress extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AddnewAddress> with SingleTickerProviderStateMixin{
  GoogleMapController _controllermap;
  Completer<GoogleMapController> _controller = Completer();
  ProgressDialog pr;

  //static  LatLng _center1 ;
  //static  LatLng _center=LatLng(33.652100, 75.123398) ;
  final Set<Marker> _markers = {};

//  static LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;
  final _formKey = GlobalKey<FormState>();
  LatLng a;
  /*void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }*/

  TextEditingController searchController = TextEditingController() ;

  TextEditingController NoteController = TextEditingController() ;


  RubberAnimationController _controller1;

  void initState() {
    pr = ProgressDialog(context);
    searchController.text = globaladdressvar;
//    setState(() {
//      final location = new Location();
//
//      location.onLocationChanged().listen((LocationData cLoc){
//        SplashScreen.center = LatLng(cLoc.latitude, cLoc.longitude);
//
//      });
//    });

    _controller1 = RubberAnimationController(
        vsync: this,
        halfBoundValue: AnimationControllerValue(percentage: 0),
        upperBoundValue: AnimationControllerValue(percentage: 0),
        lowerBoundValue: AnimationControllerValue(pixel: 350),
        duration: Duration(milliseconds: 0));
    setMarkers(SplashScreen.center.latitude,
        SplashScreen.center.longitude);
    super.initState();
  }

  setMarkers(var lat,var lng) async {
    Marker resultMarker = Marker(
      draggable: true,
      markerId: MarkerId('Current location'),
      infoWindow: InfoWindow(
        title: 'Current location',
      ),
      position: LatLng(lat, lng),
      // onDragEnd: ((newPosition) async{
      //   //var a = SplashScreen.center;
      // //  SplashScreen.center = newPosition;
      //     await Future.delayed(const Duration(seconds: 1), (){
      //         setState(() {
      //
      //         });
      //     });
      //
      // }),
    );
    setState(() {
      _markers.add(resultMarker);

      searchController.text = globaladdressvar;
    });

    await Future.delayed(const Duration(seconds: 2), (){
      setState(() {
        searchController.text = globaladdressvar;
      });
    });

  }
  void _onCameraMove(CameraPosition position) {
    SplashScreen.center = position.target;
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: true,
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
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20),
                      child: Text( "Write a title about this Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Padding(
                        padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                        child: InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromRGBO(60, 111, 102, 1),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.normal),
                                      validator: (text) {
                                      if (text == null || text.isEmpty) {
                                      return "Title feild is empty";
                                      }
                                      return null;
                                      },
                                      controller: NoteController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 1,
                                      decoration: new InputDecoration.collapsed(
                                        hintText: "Ex This is my Address and Home .. "),
                                      ),



                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color:  Color.fromRGBO(60, 111, 102, 1),
                          border: Border.all(
                            color:  Color.fromRGBO(60, 111, 102, 1),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.pop(context);
                              pr.show();
                              API.AddAddress(NoteController.text,globaladdressvar,a.longitude,a.longitude,userid);
                              waitaddtocart();


                            }
                          },
                          child: Center(
                              child: new Text( "Add this Address?",
                            style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'aveh',
                            letterSpacing: 2.2,
                            fontSize: 15.0)
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
  waitaddtocart() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (API.success == 'true') {
        pr.hide();
        Get.snackbar(
          "Added",
          "Addresses Added Successfully",
          icon: Icon(Icons.delete),
          shouldIconPulse: true,
          barBlur: 20,
          dismissDirection: SnackDismissDirection.HORIZONTAL,
          isDismissible: true,
          duration: Duration(seconds: 4),

        );

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AddressChange()));

      } else if (API.success == 'error') {
        Get.snackbar(
          "Error",
          "Some thing went wrong",
          icon: Icon(Icons.delete),
          shouldIconPulse: true,
          barBlur: 20,
          dismissDirection: SnackDismissDirection.HORIZONTAL,
          isDismissible: true,
          duration: Duration(seconds: 4),
        );
      } else {
        waitaddtocart();
      }
    });
  }
  void _onMapCreated(GoogleMapController controller) {
    _controllermap = controller;
    _controllermap.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: SplashScreen.center,
          zoom: 15.0,
        ),
      ),
    );
    _controller.complete(controller);
  }
  Widget _getLowerLayer() {
    return GoogleMap(padding: EdgeInsets.only(top: 30),
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      zoomControlsEnabled: false,
      initialCameraPosition: CameraPosition(
        target: SplashScreen.center ,
        zoom: 15.0,
      ),
      mapType: _currentMapType,
      markers: _markers,
      onCameraMove: _onCameraMove,
      onTap: (latlng){
        print(latlng.toString());
        setMarkers(latlng.latitude,latlng.longitude);
        a=new LatLng(latlng.latitude,latlng.longitude);
        getAddress(a);
      },
    );
  }

  Widget _getUpperLayer() {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, -3),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          color: Colors.white),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
//          controller: _scrollController,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                      const EdgeInsets.only( bottom: 8.0,right: 20,left: 20),
                      child: Text(
                        'Select your location from the map',textAlign: TextAlign.center,
                        style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25.0,fontFamily: 'aveh'),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only( bottom: 8.0,right: 20,left: 20),
                      child: Text(
                        'Move the pin on the map to find your location and select the delivery address.',textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0,color: Colors.grey,fontFamily: "aveb",wordSpacing:1.5,height: 1.4),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                      child: TextField(
                        enabled: false,
                        maxLines: 2,
                        controller: searchController,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontFamily: 'aveb',
                            fontSize: 16,
                            color: lightblack
                        ),
                        decoration: InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyle(
                            fontFamily: 'aveb',
                          ),
                          suffixIcon: SvgPicture.asset('assets/search_icon.svg', fit: BoxFit.scaleDown,),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top:20.0,bottom: 20.0),
                    child: InkWell(
                      onTap:(){
                        _showDialog();
                      //  Navigator.of(context).push(MaterialPageRoute(builder:(_)=>MapSearch()));
                      },
                      child: Container(

                        width: MediaQuery.of(context).size.width /1.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(60, 111, 102, 1),
                          border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Center(
                            child: new Text("Add this Address",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'aveh',
                                    letterSpacing: 2.2,
                                    fontSize: 15.0)
                            )),


                      ),
                    )
                ),

              ],
            ),
          )


        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height*0.58,
                child: _getLowerLayer()),
            Align(
              alignment: Alignment.bottomCenter,
              child: _getUpperLayer(),
            )
          ],
        ),
      ),
    );
  }
}