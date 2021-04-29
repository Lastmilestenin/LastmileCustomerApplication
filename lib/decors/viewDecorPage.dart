
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_mile/decors/DecorListing.dart';
import 'package:last_mile/decors/decor_option.dart';
import 'package:last_mile/models/Decor.dart';
import 'package:last_mile/products/product_option.dart';

import '../search/SearchPage.dart';
import '../customization/color_list.dart';
import '../customization/colors.dart';
import '../models/product.dart';
import '../products/moreProduct.dart';



class ViewDecorPage extends StatefulWidget {
  final Decor decor;

  ViewDecorPage({Key key, this.decor}) : super(key: key);

  @override
  _ViewProductPageState createState() => _ViewProductPageState(decor);
}

class _ViewProductPageState extends State<ViewDecorPage> {
  final Decor decor;

  _ViewProductPageState(this.decor);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int active;

  ///list of product colors
  List<Widget> colors() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(
        InkWell(
          onTap: () {
            setState(() {
              active = i;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Transform.scale(
              scale: active == i ? 1.2 : 1,
              child: Card(
                elevation: 3,
                color: Colors.primaries[i],
                child: SizedBox(
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Widget description = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        decor.name,
        maxLines: 5,
        semanticsLabel: '...',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
      ),
    );

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: yellow,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkGrey),
          actions: <Widget>[
            IconButton(
              icon: new SvgPicture.asset('assets/search_icon.svg', fit: BoxFit.scaleDown,),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage(1))),
            )
          ],
          title: Text(
            'Headphones',
            style: const TextStyle(
                color: darkGrey,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                fontSize: 18.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                DecorOption(
                  _scaffoldKey,
                  decor: decor,
                ),
                description,
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Flexible(
                      child: ColorList([
                        Colors.red,
                        Colors.blue,
                        Colors.purple,
                        Colors.green,
                        Colors.yellow
                      ]),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {

                          },
                          //elevation: 0,
                          //backgroundColor: Colors.transparent
                        );
                      },
                      constraints:
                      const BoxConstraints(minWidth: 45, minHeight: 45),
                      child: Icon(Icons.favorite,
                          color: Color.fromRGBO(255, 137, 147, 1)),
                      elevation: 0.0,
                      shape: CircleBorder(),
                      fillColor: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                  ]),
                ),
                MoreProducts()
              ],
            ),
          ),
        ));
  }
}
