import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_mile/RidePriceDistance.dart';
import 'package:last_mile/credentials/signUpPage.dart';
import 'package:last_mile/customization/splashscreen.dart';
import 'package:last_mile/onRide.dart';
import 'package:last_mile/rideservice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:universal_html/html.dart';
import 'Map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static SharedPreferences sharedPreferences;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initi();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme: ThemeData(
        fontFamily: 'aveh'
      ),
      home: SplashScreen(),
      //home: onRidePage(),
      //home: DistancePrice(),
    );
  }

  initi()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
}

/*Button color change to the same color when they are one after another
throughout the whole application.

Check the navigation to the subscriptions page, make sure that the four
square button always goes to deliver dashboard/status.

Place subscription page on the side bar on the left.

Change logo and Last Mile color scheme on sign up and login pages.

Place the fields discussed on sign up page - username last name first name
password and email and date of birth.

Place the navigation below buttons on all pages except the following pages:

Sign up, sign in, payment pages, delivery information page, the payment
payment page.

Place a button on for default delivery address in the delivery address
details*/