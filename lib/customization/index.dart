import 'package:geocoder/geocoder.dart';
import 'package:last_mile/models/Cart.dart';
import 'package:last_mile/models/Orders.dart';
import 'package:last_mile/models/favourite.dart';
import 'package:last_mile/apiclasses/API.dart';
import '../main.dart';

int index = 0;
var image;
int indo;
var vendorname;
var vendorid;
var vendorimage;
List<Orders> inprogressList = new List();
List<Ordersdetails> OrdersdetailsList = new List();
//jo order track hongy ye wo orders hain
List<pickedup> pickuporderslist = new List();





var vendorrating;
var shippingmethod = 'one';
var shippingprice = 0.0;
var globalshippingtype = '(Free)';
var globaladdressvar;
var latitude;
var longitude;
var selcted_address;


List<CartModel> globalcart = CartModel.decodeMusics(MyApp.sharedPreferences.getString("cart"));
List<Favourite> globalfav = Favourite.decodeMusics(MyApp.sharedPreferences.  getString("fav"));
List<String> globaluseraddress = new List();
List<int> globalcartcount = new List();

 getAddress(var value)async{
  latitude=value.latitude;
  longitude=value.longitude;
  final coordinates = new Coordinates(
      value.latitude, value.longitude);

  var addresses = await Geocoder.local.findAddressesFromCoordinates(
      coordinates);


  var first = addresses.first;

  return globaladdressvar = first.addressLine;

}