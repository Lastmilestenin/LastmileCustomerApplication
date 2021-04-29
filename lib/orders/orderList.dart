import 'package:flutter/material.dart';
import 'package:last_mile/customization/index.dart';
import 'package:last_mile/orders/OrderListing.dart';
import 'package:last_mile/models/Orders.dart';
import 'package:last_mile/orders/ordersCard.dart';


class OrderList extends StatefulWidget {
  @override
  _OrderListPageState createState() => _OrderListPageState();

}
class _OrderListPageState extends State<OrderList> {

  List<Orders> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = orders;

  }
  @override
  Widget build(BuildContext context) {


    return SizedBox(

      child: ListView.builder(

          scrollDirection: Axis.vertical,
          itemCount: inprogressList.length,
          itemBuilder: (_, index) {
            return OrdersCard(
              ind:index,
              orders: inprogressList[index],
            );
          }
      ),
    );
  }
}


