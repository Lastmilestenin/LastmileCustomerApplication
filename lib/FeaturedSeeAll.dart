import 'package:flutter/material.dart';
import 'package:last_mile/profile/profile.dart';
import 'categorySeeAll.dart';
import 'customization/index.dart';
import 'shops/shopCard.dart';
import 'package:last_mile/global.dart';
import 'package:last_mile/components/style.dart';

class FeatureSeeAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // Widget appBar = Card(
    //   elevation: 5,
    //   child: Container(
    //     height: kToolbarHeight + MediaQuery.of(context).padding.top / 4,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15),
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           InkWell(
    //             child: Icon(Icons.arrow_back),
    //             onTap: () {
    //               Navigator.pop(context);
    //             },
    //           ),
    //           SizedBox(width: 15),
    //           Container(
    //             width: MediaQuery.of(context).size.width / 2,
    //             child: Center(
    //               child: Text(
    //                 globaladdressvar.toString(),
    //                 style: TextStyle(
    //                     fontSize: 13,
    //                     fontWeight: FontWeight.w300,
    //                     fontFamily: 'aveb',
    //                     letterSpacing: 2.2),
    //                 maxLines: 1,
    //               ),
    //             ),
    //           ),
    //           Spacer(),
    //           InkWell(
    //             onTap: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => Profile()),
    //               );
    //             },
    //             child: CircleAvatar(
    //               backgroundImage: AssetImage('assets/rectangle.jpg'),
    //               radius: 25.0,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return SafeArea(
        child: Scaffold(
            body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            globalAppbar(),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 50,
                  //width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: new InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 15, right: 15),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  'Featured Stores',
                  style: sansb22,
                )),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1.1,
                child: GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: vendorList.length,
                    itemBuilder: (_, index) {
                      return vendorList[index].feature == "1"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => CategoryScreen()),
                                      // );
                                    },
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          vendorList[index].image == null
                                              ? "https://upload.wikimedia.org/wikipedia/commons/3/32/Flag_of_Pakistan.svg"
                                              : vendorList[index].image,
                                          fit: BoxFit.fill,
                                          width: 165,
                                          height: 130,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 4),
                                  child: Text(
                                    vendorList[index].name,
                                    style: robr,
                                  ),
                                )
                              ],
                            )
                          : Container();
                    }),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
