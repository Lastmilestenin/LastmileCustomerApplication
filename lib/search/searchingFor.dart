import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last_mile/classes/Distance.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/customization/splashscreen.dart';
import 'package:last_mile/search/SearchPage.dart';
import 'package:last_mile/mainPage.dart';
import 'package:location/location.dart';
import 'package:rubber/rubber.dart';

import '';
import '../customization/colors.dart';
import '../global.dart';
import '../models/product.dart';
import 'package:last_mile/apiclasses/API.dart';


void main() => runApp(MapSearch());

class MapSearch extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MapSearch> with SingleTickerProviderStateMixin{
  Completer<GoogleMapController> _controller = Completer();

  // static LatLng _center = const LatLng(24.7955456,67.0564352);
  GoogleMapController _controllermap;

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = SplashScreen.center;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
  List<Product> searchResults = [];

  TextEditingController searchController = TextEditingController();

  RubberAnimationController _controller1;

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
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
  void initState() {
    searchController.text = globaladdressvar;
    API.BannerImages().then((value) {
      setMarkers();
    });
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
        lowerBoundValue: AnimationControllerValue(pixel: 400),
        duration: Duration(milliseconds: 0));


    super.initState();

  }

  setMarkers(){

    Marker resultMarker = Marker(
      markerId: MarkerId('Current location'),
      infoWindow: InfoWindow(
        title: 'Current location',
      ),
      position: LatLng(SplashScreen.center.latitude,
          SplashScreen.center.longitude),
//      onDragEnd: ((newPosition) {
//        setState(() {
//          SplashScreen.center = newPosition;
//          getAddress(newPosition);
//          setState(() {
//            searchController.text = globaladdressvar;
//          });
//        });
//      }),
    );
    setState(() {
      _markers.add(resultMarker);
    });
    for(var data in  vendorList){
      if(Distance.distance(SplashScreen.center.latitude, SplashScreen.center.longitude, double.parse(data.latitude), double.parse(data.longitude))
          <50000000000)
      {
        Marker resultMarker = Marker(
          markerId: MarkerId(data.id.toString()),
          infoWindow: InfoWindow(
            title: "${data.name}",
          ),
          position: LatLng(double.parse(data.latitude),
              double.parse(data.longitude)),
        );
        setState(() {
          _markers.add(resultMarker);
        });
      }
    }
  }


  Widget _getLowerLayer() {
    return GoogleMap(
      padding: EdgeInsets.only(top:30),
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: SplashScreen.center,
        zoom: 15.0,
      ),
      mapType: _currentMapType,
      markers: _markers,
      onCameraMove: _onCameraMove,
    );
  }

  Widget _getUpperLayer() {
    return Container(
      height: MediaQuery.of(context).size.height*0.47,
      //height: MediaQuery.of(context).size.height/1.7,
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
                      const EdgeInsets.only( right: 20,left: 20),
                      child: Text(
                        'Select your location from the map',textAlign: TextAlign.center,
                        style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25.0,fontFamily: 'aveh'),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 20,left: 20),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>SearchPage(0))),
                        child: Container(

                          width: MediaQuery.of(context).size.width /2.2,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(60, 111, 102, 1),
                            border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Center(
                              child: new Text("SEARCH BY SHOPS",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'aveh',
                                    //  letterSpacing: 1.1,
                                      fontSize: 13.0))),


                        ),
                      ),
                      // InkWell(
                      //   onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>SearchPage(1))),
                      //   child: Container(
                      //
                      //     width: MediaQuery.of(context).size.width /2.2,
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //       color: green,
                      //       borderRadius: BorderRadius.circular(25.0),
                      //     ),
                      //     child: Center(
                      //         child: new Text("SEARCH BY PRODUCTS",
                      //             style: const TextStyle(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w400,
                      //                 fontStyle: FontStyle.normal,
                      //                 fontFamily: 'aveh',
                      //                // letterSpacing: 1.1,
                      //                 fontSize: 13.0))),
                      //
                      //
                      //   ),
                      // ),
                    ],
                  ),
                )
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

        body:  Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: GoogleMap(
                padding: EdgeInsets.only(top:30),
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: SplashScreen.center,
                  zoom: 15.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove: _onCameraMove,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height/2.1,
                  //height: MediaQuery.of(context).size.height/1.7,
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
                  //  physics: NeverScrollableScrollPhysics(),
//          controller: _scrollController,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.only( right: 20,left: 20),
                                child: Text(
                                  'Select your location \n from the map',textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25.0,fontFamily: 'aveh'),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 20,left: 20),
                                child: Text(
                                  'Move the pin on the map to find your location and select the delivery address.',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14.0,color: Colors.grey,fontFamily: "aveb",wordSpacing:1.5,height: 1.4),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
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
                                      fontSize: 14,
                                      color: lightblack

                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
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
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>SearchPage(0))),
                                child: Container(

                                  width: MediaQuery.of(context).size.width /1.4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(60, 111, 102, 1),
                                    border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Center(
                                      child: new Text("SEARCH BY SHOPS",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'aveh',
                                              //  letterSpacing: 1.1,
                                              fontSize: 13.0))),


                                ),
                              ),

                              // InkWell(
                              //   onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>SearchPage(1))),
                              //   child: Container(
                              //
                              //     width: MediaQuery.of(context).size.width /1.4,
                              //     height: 50,
                              //     decoration: BoxDecoration(
                              //       color: Color(0xFFdfe8e6),
                              //       borderRadius: BorderRadius.circular(25.0),
                              //     ),
                              //     child: Center(
                              //         child: new Text("SEARCH BY PRODUCTS",
                              //             style: const TextStyle(
                              //                 color: Colors.black,
                              //                 fontWeight: FontWeight.w400,
                              //                 fontStyle: FontStyle.normal,
                              //                 fontFamily: 'aveh',
                              //                 // letterSpacing: 1.1,
                              //                 fontSize: 13.0))),
                              //
                              //   ),
                              // ),
                             // SizedBox(height: 5,),
                              SizedBox(height: 15,),
                            ],
                          ),

                        ],
                      )


                    ],
                  ),

                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}