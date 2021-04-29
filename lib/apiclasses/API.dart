import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:last_mile/address/addresslist.dart';
import 'package:last_mile/classes/Distance.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/customization/splashscreen.dart';
import 'package:last_mile/models/Cart.dart';
import 'package:last_mile/models/Orders.dart';
import 'package:last_mile/models/product.dart';
import 'package:flutter/material.dart';
import 'package:last_mile/models/vendor.dart';
import 'package:last_mile/orders/orderDetails.dart';
import '../global.dart';
import '../main.dart';
import 'package:last_mile/models/Reviews.dart';
import '../mainPage.dart';
import 'package:http/http.dart' as http;

class API{
  static var success = "false";

  static Future OrderDetailsApi(String uid)async{
    String vendorUrl= "http://thelastmile.shop/public/api/userOrders";
    String url =vendorUrl+uid.toString();
    Dio dio = new Dio();
    dio.get(url).then((response) {
      if(response.statusCode == 200){
        bannerlist.clear();
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];
        records.forEach((v) {
          OrderDetailsList.add(OrderDetailsModel(
              image: v['image']
          ));
        });
      }
      else{
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }




  static Future BannerImages()async{
    String vendorUrl= "http://thelastmile.shop/public/api/banners";
    String url =vendorUrl;
    Dio dio = new Dio();
    dio.get(url).then((response) {
      if(response.statusCode == 200){
        bannerlist.clear();
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];
        records.forEach((v) {
          bannerlist.add(Bannermodel(
              image: v['image']
          ));
        });
      }
      else{
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }
  static Future VedonCategoryID(String id)async{
    success = "false";
    String vendorUrl= "http://thelastmile.shop/public/api/vendorCategory/";
    String url =vendorUrl+id.toString();
    Dio dio = new Dio();
    dio.get(url).then((response) {
      if(response.statusCode == 200){
        vendorcatidlist.clear();
        Map<String, dynamic> data = response.data;
        var records = data['records']['vendors'];
        records.forEach((v) {
          if(Distance.distance(SplashScreen.center.latitude, SplashScreen.center.longitude, double.parse(v['locations'][0]['latitude'].toString()), double.parse(v['locations'][0]['longitude'].toString())) <7000){
            vendorcatidlist.add(vandorcatidmodel(
                id: v['id'],
                name: v['name'],
                image: v['detail']['image']
            ));
          }

        });
        success = "true";
      }
      else{
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  static Future VedonCategory()async{
    String vendorUrl= "http://thelastmile.shop/public/api/vendorCategory";
    String url =vendorUrl;
    Dio dio = new Dio();
    dio.get(url).then((response) {
      if(response.statusCode == 200){
        vendorcatlist.clear();
        Map<String, dynamic> data = response.data;
        var records = data['records'];
        records.forEach((v) {
          vendorcatlist.add(vandorcatmodel(
            id: v['id'],
            name: v['name'],
            image: v['image']
          ));
        });
      }
      else{
        throw Exception('Failed to Fetch Vendors');
      }
    });
  }

  static Vendordata(){
    success = "false";
    String vendorUrl= "http://thelastmile.shop/public/api/vendors";
    String url =vendorUrl;
    Dio dio = new Dio();
    dio.get(url).then((response) {
      if(response.statusCode == 200){
        vendorList.clear();
        //print(response.data.toString());
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];

        records.forEach((v) {
          var vid = v['id'];
          var vname = v['name'];
          var vemail = v['email'];
          var vlocations = v['locations'];
          var vdetails = v['detail'];
          var vreviews = v['reviews'];
          var vlatitude;
          var vlongitude;
          var vaddress;
          var image;
          var rating = "0.0";
          var feature;
          var opentime;
          var closetime;
          vlocations.forEach((v) {
            vlatitude = v['latitude'];
            vlongitude = v['longitude'];
            vaddress = v['address'];
          });
          image = vdetails['image'];
          feature=vdetails['featured'];
          opentime=vdetails['opening_time'];
          closetime=vdetails['closing_time'];

          vreviews.forEach((v){
            rating = v['rating']??"0.0";
          });

          success = "true";
          Vendor vendor = new Vendor();
          vendor.id = vid;
          vendor.name = vname;
          vendor.email = vemail;
          vendor.latitude = vlatitude;
          vendor.longitude = vlongitude;
          vendor.address = vaddress;
          vendor.image = image;
          vendor.rating = rating;
          vendor.feature=feature;
          vendor.opentime=opentime;
          vendor.closetime=closetime;
          if(vendor.feature=="1"){
            if(Distance.distance(SplashScreen.center.latitude, SplashScreen.center.longitude, double.parse(vendor.latitude), double.parse(vendor.longitude)) <7000)
            {
              FeatureShoplist.add(Featureshopmodel(
                  id: vendor.id,
                  image: vendor.image,
                  name: vendor.name,
                  rating: vendor.rating,
                  lat: vendor.latitude,
                  long: vendor.longitude
              ));
            }
          }
          if(Distance.distance(SplashScreen.center.latitude, SplashScreen.center.longitude, double.parse(vendor.latitude), double.parse(vendor.longitude)) <7000){
            vendorList.add(vendor);
          }
        });
        // Vendor.fromJson(jsonDecode(response.data));
        // var a = response.data;
        // print(a.toString());
      }
      else{
        success = "true";
        throw Exception('Failed to Fetch Vendors');
      }
    });

  }

  static inprogressorder()async{
    success = "false";
    String url = "http://thelastmile.shop/api/orderDetail/" +
        userid.toString();

    Dio dio = new Dio();
    var response = await dio.get(url);
    var amount;
    if (response.statusCode == 200) {
      inprogressList.clear();

      Map<String, dynamic> data = response.data;
      var records = data['success']['success']['orders'];
      for(Map i in records){
        amount = i['price'].toString();
        var dt=i['details'];
        OrdersdetailsList=new List();
        for(Map l in dt)
          {
            OrdersdetailsList.add(Ordersdetails(
              orderno:l['id'],
              amount: l['total_price'],
              status: l['status'],
              quantity: l['quantity'],
            ));
          }


        inprogressList.add(
            Orders(
              amount: amount,
              orderno: i['order_id'],
              placedOn: data['success']['created_at'],
              status: i['status'],
              details: OrdersdetailsList,
            )
        );
      }
      success = "true";
      }
  }

  static Future pickeduporders()async{
    success = "false";
    String url = "http://thelastmile.shop/api/pickedupOrders/" +
        userid.toString();
    Dio dio = new Dio();
    var response = await dio.get(url);
    var amount;
    if (response.statusCode == 200) {
      pickuporderslist.clear();
      Map<String, dynamic> data = response.data;
      var records = data['success'];

      for(Map i in records)
        {

          pickuporderslist.add(pickedup(
            checkorderid: i['order_id'],
            status:i['status'],
            driverid: i['driver_id'],
            orderno:i['orders']['order_id'],
            price: i['orders']['price'],
            des_lat: i['orders']['latitude'],
            des_lng: i['orders']['longitude'],


          ));

        }
      success = "true";
    }

  }

  static getVendorprodects(var vendorid) {
    success = "false";
    String url = "http://thelastmile.shop/public/api/product/" +
        vendorid.toString();
    Dio dio = new Dio();
    dio.get(url).then((response) {
      if (response.statusCode == 200) {
        MainPage.productlist.clear();

        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];

        var pprice = new List();
        var pimage = new List();
        var pdesr = new List();
        var prating = new List() ;
        var pid = new List();
        var fav = new List();
        Reviews r=new Reviews(date: "",image: "", name: "", ratings: 0,review: "");
        records.forEach((v) {
          var variants = v['variants'];

          variants.forEach((v){
            pprice.add(v['price']);
            pimage.add(v['image']);
            pdesr.add(v['description']);
            pid.add(v['id']);
            fav.add(false);
            if(v['reviews'].length == 0){
              prating.add('0.0');
            }
            var pvreviews = v['reviews'];

            pvreviews.forEach((vr){
              if(vr['rating'] == null){
                prating.add('0.0');
              }
              else{
                var  vr=v['reviews'];
                for(Map i in vr){
                  r=new Reviews(date: "",image: "", name: "", ratings: 0,review: "");
                  prating.add(i['rating']);
                  r.ratings=double.parse(i['rating']);
                  String str=i['created_at'];
                  r.date = str.substring(0,10) + ' ' + str.substring(11,16);
                  r.review=i['text'];
                  r.variantid=i['product_variant_id'];
                  r.name='Mike Vector';
                  r.image='assets/placeholder.png';
                }
                review.add(r);
              }
            });
          });

          Product product = new Product();
          product.id = pid;
          product.fav = fav;
          product.name = v['name'];
          //des.add(pdesc);
          product.desc = pdesr;
          //imag.add('assets/vase-1.png');
          product.image = pimage;
          //pric.add(double.parse(pprice));
          product.price = pprice;
          product.vid = v['vendor_id'];
          product.ratings = prating;
          product.totalRatings = '12';
          product.categoryname=v['category']['title'];
          product.status=v['featured'];
          product.subscription=v['subscription'];

          MainPage.productlist.add(product);
          pprice = new List();
          pimage = new List();
          pdesr = new List();
          prating = new List();
          pid = new List();
          fav = new List();
          success = "true";
        });
      }
    });
  }


  static getuseloc(var url){
    success = "false";
    Dio dio = new Dio();
    dio.get(url).then((response) {
      if (response.statusCode == 200) {
        addresslist.clear();
        Map<String, dynamic> data = response.data;
        var records = data['success']['records'];
        for (Map i in records) {

          addresslist.add(addressList(
            id: i['id'],
            address: i['address'],
            lat: i['latitude'],
            lng:i['longitude'] ,
            title: i['title'],
            slected: -1,
          ));
          success = "true";
        }

      }
    }).catchError((e){
      if(e.error is SocketException){
        getuseloc( url);
      }
      else{
        success = "true";
      }
    });


  }


  static checkout(var url, var totalAmount, var cardNumber,var tax,var address,var expiryMonth,var expiryYear,var cvc) {

    success = "false";
    Dio dio = new Dio();

    FormData formData = new FormData.fromMap({
      'userId': userid,
      'totalAmount': totalAmount,
      'tax': tax,
      'cartItems': CartModel.encodeMusics(globalcart),
      'address_id':selcted_address??null,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'number': cardNumber,
      'exp_month': expiryMonth,
      'exp_year': expiryYear,
      'cvc': cvc,


    });
    dio.post(
      url,
      data: formData,
      options: Options(
        contentType: "application/json",
      ),
    )
        .then((response) {

      print(response);
      print(month);
      Map<String, dynamic> data = response.data;
      var records = data['error'];
      print(month.toString());
      print(records);

      if (response.statusCode == 200) {

        print(data);
        success = "true";
        // inprogressorder();
      }
      else{
        print(response.statusCode );
      }
      //print(response.data);
    }).catchError((e){
      print(e.error);
      print(e);

      if(e.error is SocketException){
        print(e.error);
        print(e);


        checkout(url, totalAmount, cardNumber,tax,address,expiryMonth,expiryYear,cvc);
      }
      else{
        success = "error";
      }
    });
  }

  static Addtocart(var id, name , qty, price) async{
    success = "false";
    String Url= "http://thelastmile.shop/public/api/cart";
    FormData formData = new FormData.fromMap({
      'id': id,
      'name': name.toString(),
      'qty': qty,
      'price': price,
    });

    Dio dio = new Dio();
    try {
      dio.post(Url, data: formData).then((response){
        Map<String, dynamic> data = response.data;
        var status = data['success'];
        if(status != null){
          success = "true";
          print('done');
        }
        else{
          success = "error";
          print('error');
        }
      });

    }catch (e) {
      success = "error";
      print('Error: $e');
    }
  }

  static AddAddress(var title, address , latitude, longitude,id) async{
    success = "false";
    String Url= "http://thelastmile.shop/public/api/userlocationstore/"+id.toString();
    FormData formData = new FormData.fromMap({
      'title': title,
      'address':address,
      'latitude': latitude,
      'longitude': longitude,
    });

    Dio dio = new Dio();
    try {
      dio.post(Url, data: formData).then((response){
        Map<String, dynamic> data = response.data;
        var status = data['success'];
        if(status != null){
          success = "true";
          print('done');
        }
        else{
          success = "error";
          print('error');
        }
      });

    } catch (e) {
      success = "error";
      print('Error: $e');
    }
  }

}