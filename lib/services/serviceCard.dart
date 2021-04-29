

import 'package:calendarro/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:last_mile/customization/calendar.dart';
import 'package:last_mile/mainPage.dart';
import 'package:last_mile/models/Decor.dart';
import 'package:calendarro/calendarro.dart';

import '../orders/DeliveryStatus.dart';
import '../customization/colors.dart';
import '../models/Services.dart';

class ServiceCard extends StatefulWidget {
  final Services service;


  const ServiceCard({Key key, this.service}) : super(key: key);
  @override
  ServiceCards createState() => ServiceCards(this.service);

}
class ServiceCards extends State<ServiceCard> {

  final Services service;

  ServiceCards(this.service);

  String day ='Day';
  String week ='Week';
  String month ='Month';

  Color hexToColor(int rgb) => new Color(0xFF000000 + rgb);
 static DateTime selected;

  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            //  primarySwatch: buttonTextColor,//OK/Cancel button text color
              primaryColor: const Color.fromRGBO(60, 111, 102, 1),
              canvasColor: const Color.fromRGBO(60, 111, 102, 1),//Head background
              accentColor: const Color.fromRGBO(60, 111, 102, 1),//selection color
            //dialogBackgroundColor: Colors.white,//Background color
          ),
          child: child,
        );
      },
    );

   setState(() {
     if(selected != null)
     {
       day =selected.day.toString();
       week = selected.weekday.toString();
       month = selected.month.toString();
     }
   });
  }

  Calendarro monthCalendarro;
  var startDate = DateUtils.getFirstDayOfCurrentMonth();
  var endDate = DateUtils.getLastDayOfNextMonth();


  @override
  Widget build(BuildContext context) {

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24),bottomRight: Radius.circular(24),bottomLeft: Radius.circular(24))),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 20),
                      child: Text('Select by',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
                        child: InkWell(
                          onTap: () => _showDateTimePicker(),
                          child: Container(

                            width: MediaQuery.of(context).size.width /1.5,
                            height: 50,
                            decoration: BoxDecoration(
                              color: green,
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(25.0),
                            ),

                            child: Center(
                                child: new Text(day,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.0))),



                          ),
                        )
                    ),


                    Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
                      child: Container(

                        width: MediaQuery.of(context).size.width /1.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(60, 111, 102, 1),
                          border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                        child: InkWell(
                          onTap: () {
                            _showDateTimePicker();

                           },
                          child: Center(
                              child: new Text(week,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0))),
                        ),



                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10),
                      child: Container(

                        width: MediaQuery.of(context).size.width /1.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(60, 111, 102, 1),
                          border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                        child: InkWell(
                          onTap: () => _showDateTimePicker(),
                          child: Center(
                              child: new Text(month,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.0))),
                        ),



                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      );
    }
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
            width: MediaQuery.of(context).size.width/1.4,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(8.0,),
            child: InkWell(
                onTap: () {},

//                 =>   Navigator.of(context)
//                    .push(MaterialPageRoute(builder: (_) => MainPage(0,0,1))),
              child: Card(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Container(
                        padding: EdgeInsets.all(2.0,),
                        height: MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(

                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 200,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.black,
                              ),
                              child: Center(
                                child: Image.asset(service.image),
                              ),
                            ),


                            Row(
                          //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top:0.0,left: 4.0),
                                    child: Text(
                                      service.name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16.0,color: lightblack,fontFamily: 'aveb'),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(top:0.0),
                                    child: IconButton(
                                        icon: Icon(Icons.favorite,color: Colors.red,size: 25.0,)
                                    ),
                                  ),
                                ],
                              ),
                            Padding(
                                padding: EdgeInsets.only(top:0.0,left: 4.0),
                                child: Text(
                                  service.deliverytime,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 10.0,color: lightblack,fontFamily: 'aveb'),
                                ),
                              ),



                            Padding(
                              padding: EdgeInsets.only(top:4.0,),
                              child: Row(
                                children: <Widget>[
                                  RatingBar(
                                    initialRating: service.ratings,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemSize: 15,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.green,
                                      size: 10,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                 InkWell(
                                     onTap: ()=>  _showDialog(),
//                                         Navigator.of(context)
//                                         .push(MaterialPageRoute(builder: (_) => Calendar())),
                                   child:  Container(
                                     height: 40,
                                     width: 45,
                                     decoration: BoxDecoration(
                                       color: Colors.black,
                                       borderRadius: BorderRadius.only(
                                           topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(10)),

                                     ),
                                     child:Image.asset("assets/calender1.png",),
                                   ),
                                 )
                                ],
                              )
                            ),


                          ],
                        )



                    )
                ),
              ),
            )
        )
    );
  }
}


class CustomWeekdayLabelsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Text("M", textAlign: TextAlign.center)),
        Expanded(child: Text("T", textAlign: TextAlign.center)),
        Expanded(child: Text("W", textAlign: TextAlign.center)),
        Expanded(child: Text("T", textAlign: TextAlign.center)),
        Expanded(child: Text("F", textAlign: TextAlign.center)),
        Expanded(child: Text("S", textAlign: TextAlign.center)),
        Expanded(child: Text("S", textAlign: TextAlign.center)),
      ],
    );
  }
}
