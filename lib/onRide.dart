import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const CameraPosition _kInitialPosition =
CameraPosition(target: LatLng(-33.852, 151.211), zoom: 11.0);

class onRidePage extends StatefulWidget {
  @override
  _onRidePageState createState() => _onRidePageState();
}

class _onRidePageState extends State<onRidePage> {

  LatLng _lastTap;
  LatLng _lastLongPress;
  TabController _controller;

  @override
  void initState() {
    super.initState();
  }

  GoogleMapController mapController;
  void onMapCreated(GoogleMapController controller) async {
    setState(() {
      mapController = controller;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  child: GoogleMap(
                    onMapCreated: onMapCreated,
                    initialCameraPosition: _kInitialPosition,
                    onTap: (LatLng pos) {
                      setState(() {
                        _lastTap = pos;
                      });
                    },
                    onLongPress: (LatLng pos) {
                      setState(() {
                        _lastLongPress = pos;
                      });
                    },
                  ),
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu,size: 25,color: Color(0xFF145c73)),
                      Container(
                        height: 35,width: 35,
                        decoration: BoxDecoration(

                         borderRadius: BorderRadius.circular(30),
                          color: Colors.white
                        ),
                        child: Center(child: Icon(Icons.gps_not_fixed,size: 18,color: Color(0xFF145c73)))
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height*0.43,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: size.height*0.02,),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.gps_fixed,size: 15,color: Color(0xFF145c73)),
                              SizedBox(width: 10,),
                              Text("You are on ride",style: TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                        Container(
                          height: size.height*0.0005,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            height: 0,
                            thickness: 1,
                            color: Colors.black38,
                          ),
                        ),

                        SizedBox(height: size.height*0.015,),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: size.width*0.45,

                                  child: Column(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: Image.asset("assets/dp.png"),
                                      ),
                                      Text("Neil Smith",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                      RatingBar(
                                        itemSize: 14,
                                        initialRating: 3.6,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.only(right: 3),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width*0.45,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: Image.asset("assets/sedan.jpeg",height: 20,width: 100,),
                                      ),
                                      Container(
                                        width: 100,
                                          child: Text("Audi-R8 Yellow\nAbc N15\nUS 08 5510",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                        SizedBox(height: size.height*0.015,),
                        Container(
                          width: size.width*0.95,
                          child: Text("Due to peek hours, charges will be twice on availability of providers",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        SizedBox(height: size.height*0.03,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Center(
                            child: Row(
                              children: [
                                GestureDetector(
                                    child: Container(
                                        height: 50,
                                        width: size.width*0.45,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF145c73),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        child: Center(
                                          child: Text("Call",
                                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                          ),
                                        )
                                    )
                                ),
                                Spacer(),
                                GestureDetector(
                                    child: Container(
                                        height: 50,
                                        width: size.width*0.45,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF145c73),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        child: Center(
                                          child: Text("Share Ride",
                                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                          ),
                                        )
                                    )
                                ),
                              ],
                            ),
                          )
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
