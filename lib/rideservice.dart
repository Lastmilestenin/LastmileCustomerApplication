import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const CameraPosition _kInitialPosition =
CameraPosition(target: LatLng(-33.852, 151.211), zoom: 11.0);

class RidePage extends StatefulWidget {
  @override
  _RidePageState createState() => _RidePageState();
}

class _RidePageState extends State<RidePage> with SingleTickerProviderStateMixin{

  LatLng _lastTap;
  LatLng _lastLongPress;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
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
                  margin: EdgeInsets.only(top: 80,left: 10),
                  height: size.height*0.12,
                  width: size.width*0.95,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.gps_fixed,size: 20,color: Color(0xFF145c73),),
                                Container(height: size.height*0.025,
                                  margin: EdgeInsets.symmetric(vertical: 3),
                                  child: VerticalDivider(
                                    width: 0,
                                    thickness: 1,
                                    color: Colors.black45,
                                  ),
                                ),
                                Icon(Icons.gps_not_fixed,size: 20,color: Color(0xFF145c73)),
                              ],
                            ),
                            SizedBox(width: size.width*0.01,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Address 1",style: TextStyle(fontSize: 16),),
                                SizedBox(height: size.height*0.033,),
                                Text("Address 2",style: TextStyle(fontSize: 16),)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back,size: 25,),
                      Icon(Icons.menu_sharp,size: 25,)
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height*0.35,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: size.height*0.02,),
                        // new Container(
                        //   height: 51,
                        //   child: new TabBar(
                        //     indicatorColor: Colors.black45,
                        //     labelColor: Colors.black,
                        //     labelStyle: TextStyle(
                        //       fontSize: 12,
                        //       fontFamily: 'opsb',),
                        //     unselectedLabelColor: Colors.grey,
                        //     unselectedLabelStyle: TextStyle(
                        //       fontSize: 12,
                        //       fontFamily: 'opsb',),
                        //     controller: _controller,
                        //     tabs: [
                        //       new Tab(
                        //         text: "Sedan",
                        //         icon: Image.asset("assets/sedan.jpeg",height: 20,width: 100,),
                        //       ),
                        //       new Tab(
                        //         text: "Mini",
                        //         icon:
                        //           Image.asset("assets/sedan.jpeg",height: 20,width: 100,),
                        //       ),
                        //       new Tab(
                        //         text: "Suv",
                        //         icon: Image.asset("assets/sedan.jpeg",height: 20,width: 100,),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(height: 8,),
                        Container(
                          height: size.height*0.1,
                          child: Row(
                            children: [
                              Container(
                                width: size.width*0.3,
                                child: Column(
                                  children: [
                                    Icon(Icons.monetization_on,size: 30,color: Color(0xFF145c73),),
                                    Text("\$ 150.00",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              Container(height: 40,
                                margin: EdgeInsets.only(bottom: 25),
                                child: VerticalDivider(
                                  width: 0,
                                  thickness: 1,
                                  color: Colors.black45,
                                ),
                              ),
                              Container(
                                width: size.width*0.3,
                                child: Column(
                                  children: [
                                    Icon(Icons.money,size: 30,color: Color(0xFF145c73),),
                                    Text("Cash",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              Container(height: 40,
                                margin: EdgeInsets.only(bottom: 25),
                                child: VerticalDivider(
                                  width: 0,
                                  thickness: 1,
                                  color: Colors.black45,
                                ),
                              ),
                              Container(
                                width: size.width*0.3,
                                child: Column(
                                  children: [
                                    Icon(Icons.watch_later_outlined,size: 30,color: Color(0xFF145c73),),
                                    Text("ETA : 9 min",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 60,
                          width: size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                  child: Container(
                                    height: 50,
                                    width: size.width*0.78,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF145c73),
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Center(
                                      child: Text("Ride Now",
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                      ),
                                    )
                                  )
                              ),
                              Spacer(),
                              Container(
                                child: Icon(Icons.calendar_today,color: Colors.white,),
                                decoration: BoxDecoration(
                                    color: Color(0xFF145c73),
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                height: 50,
                                width: 50,

                              )
                            ],
                          ),
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
  bool valuefirst = false;
  bool valuesecond = false;
}
