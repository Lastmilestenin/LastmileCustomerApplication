import 'package:credit_card/credit_card_model.dart';
import 'package:last_mile/address/addresslist.dart';
import 'package:last_mile/main.dart';
import 'package:last_mile/models/Reviews.dart';

import 'models/vendor.dart';

var selectpaymenttype = "cash";
var userid;
var choose;
var vid;
List<CreditCardModel> credit = CreditCardModel.decodeMusics(MyApp.sharedPreferences.getString("creditcard"));
var month = credit[int.parse(selectedcardindex)].expiryDate.split('/');
var credircardbuttontex = "Add Card";
var selectedcardindex = MyApp.sharedPreferences.getString("selectedcardindex");
var getlocationsURL="http://thelastmile.shop/public/api/userlocation/";
var checkouturl='http://thelastmile.shop/public/api/checkout';
List<addressList> addresslist = new List();
List<Vendor> vendorList = new List();
List<Reviews> review=new List();
List<vandorcatmodel> vendorcatlist=new List();
List<Bannermodel> bannerlist=new List();
List<OrderDetailsModel> OrderDetailsList=new List();
List<vandorcatidmodel> vendorcatidlist=new List();
List<Featureshopmodel> FeatureShoplist=new List();

String name,Email,Phone;
var selectedaddress;
List<String> categori= new List();
List<int> selectcat=new List();
String catt;