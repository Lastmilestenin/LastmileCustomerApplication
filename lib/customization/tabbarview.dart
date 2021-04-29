

import 'package:flutter/material.dart';
import 'package:last_mile/reviews/reviewList.dart';

import '../category/category_card.dart';


class TabView extends StatelessWidget {


  final TabController tabController;
  final String desc;

  TabView({Key key, this.tabController,this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 9);
    return TabBarView(
        //physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          Column(children: <Widget>[

            Flexible(
              child: Container(
              child: Text(desc,
              textAlign: TextAlign.center,),
            ))
          ]),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[

              Flexible(child: ReviewList())
            ]),
          ),
        ]);
  }

}
