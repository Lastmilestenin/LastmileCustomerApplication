import 'package:flutter/material.dart';
import 'package:last_mile/orders/OrderListing.dart';
import 'package:last_mile/models/Orders.dart';
import 'package:last_mile/orders/ordersCard.dart';
import 'package:last_mile/reviews/reviewListing.dart';
import 'package:last_mile/reviews/reviewsCard.dart';

import '../models/Reviews.dart';


class ReviewList extends StatefulWidget {
  @override
  _ReviewListPageState createState() => _ReviewListPageState();

}
class _ReviewListPageState extends State<ReviewList> {

  List<Reviews> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = reviews;

  }
  @override
  Widget build(BuildContext context) {


    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: reviews.length,
          itemBuilder: (_, index) {
            return ReviewsCard(
              reviews: reviews[index],
            );
          }
      ),
    );
  }
}


