import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last_mile/classes/Distance.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/customization/splashscreen.dart';
import 'package:last_mile/search/SearchPage.dart';
import 'package:last_mile/search/searchingFor.dart';
import 'package:location/location.dart';
import 'package:rubber/rubber.dart';
import 'apiclasses/API.dart';
import 'customization/index.dart';
import 'models/product.dart';


void main() => runApp(Maps());

class Maps extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Maps> with SingleTickerProviderStateMixin{
  GoogleMapController _controllermap;
  Completer<GoogleMapController> _controller = Completer();

  //static  LatLng _center1 ;
  //static  LatLng _center=LatLng(33.652100, 75.123398) ;
  final Set<Marker> _markers = {};

//  static LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  /*void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }*/
  List<Product> searchResults = [];

  TextEditingController searchController = TextEditingController() ;


  RubberAnimationController _controller1;

  void initState() {
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
    API.BannerImages().then((value) {
      setMarkers(SplashScreen.center.latitude,
          SplashScreen.center.longitude);
    });

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
      // onTap: (latlng){
      // print(latlng.toString());
      // setMarkers(latlng.latitude,latlng.longitude);
      // LatLng a=new LatLng(latlng.latitude,latlng.longitude);
      // getAddress(a);
      // },
    );
  }

  Widget _getUpperLayer() {
    return Container(
      height: MediaQuery.of(context).size.height/2.4,
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
       // physics: NeverScrollableScrollPhysics(),
//          controller: _scrollController,
        children: <Widget>[


          Container(
              height: MediaQuery.of(context).size.height/2.6,
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
                        const EdgeInsets.only( bottom: 0.0,right: 20,left: 20),
                        child: Text(
                          'Select your location from the map',textAlign: TextAlign.center,
                          style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25.0,fontFamily: 'roboto'),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 20,left: 20),
                        child: Text(
                          'Move the pin on the map to find your location and select the delivery address.',textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.0,color: Colors.grey,fontFamily: "roboto",wordSpacing:1.5,height: 1.4),
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
                            fontFamily: 'roboto',
                            fontSize: 14,
                            color: lightblack
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
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
                  Spacer(),
                  InkWell(
                    onTap:(){
                      // Navigator.of(context).push(MaterialPageRoute(builder:(_)=>MapSearch()));
                      Navigator.of(context).push(MaterialPageRoute(builder:(_)=>SearchPage(0)));
                      },
                    child: Container(
                      width: MediaQuery.of(context).size.width /1.4,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(60, 111, 102, 1),
                        border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Center(
                          child: new Text("Continue",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'sansb',
                                  //  letterSpacing: 1.1,
                                  fontSize: 18.0))),
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
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
              height: MediaQuery.of(context).size.height*0.6,
                color: backgroundColor,
                child: _getLowerLayer()),
            Align(
              alignment: Alignment.bottomCenter,
              child: _getUpperLayer(),

            ),
          ],
        ),
      ),
    );
  }
}