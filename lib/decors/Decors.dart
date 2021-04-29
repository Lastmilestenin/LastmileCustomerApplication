//import 'package:flutter/material.dart';
//import 'package:last_mile/models/Decor.dart';
//
//import 'DecorListing.dart';
//import 'DecorsCard.dart';
//
//
//class DecorList extends StatefulWidget {
//  @override
//  _DecorListPageState createState() => _DecorListPageState();
//
//}
//class _DecorListPageState extends State<DecorList> {
//
//  List<Decor> searchResults;
//  TextEditingController searchController = TextEditingController();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    searchResults = decors;
//
//  }
//  @override
//  Widget build(BuildContext context) {
//
//    if(decors==null)
//      decors = [];
//    return   SizedBox(
//      height: MediaQuery.of(context).size.height/4,
//      width: MediaQuery.of(context).size.width,
//      child: ListView.builder(
//          scrollDirection: Axis.horizontal,
//          itemCount: decors.length,
//          itemBuilder: (_, index) {
//            return DecorCard(
//              ind: index,
//              product: decors[index],
//
//
//            );
//          }
//      ),
//    );
//  }
//}
//
//
