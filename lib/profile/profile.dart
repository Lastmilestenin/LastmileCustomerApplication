import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last_mile/PaymentCard/PaymentCardSelect.dart';
import 'package:last_mile/apiclasses/API.dart';
import 'package:last_mile/components/style.dart';
import 'package:last_mile/credentials/loginPage.dart';
import 'package:last_mile/customization/colors.dart';
import 'package:last_mile/global.dart';
import 'package:last_mile/main.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../adresses.dart';
import '../orders/ordersHistory.dart';
import 'orderHistory.dart';


class Profile extends StatefulWidget {
  var name,image,number,email;
  Profile({Key key, this.name, this.image,this.number,this.email}) : super(key: key);



  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  ProgressDialog pr;
  int index;
  void initState() {
    pr = ProgressDialog(context);
    super.initState();
    init();
  }
  void init(){
    API.getuseloc(getlocationsURL+ userid);
    waitactivity2();
  }
  waitactivity2() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.success == 'true'){
        print('data updated');
        setState(() {
          ListBuilder();
        });
      }
      else{
        waitactivity2();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(

        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: (){

              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_backspace_outlined,color: Colors.black,)),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: SingleChildScrollView(
          child: Column(
            children: [
            
              CircleAvatar(
                radius: 78,
                child:  ClipRRect(
                  borderRadius: new BorderRadius.circular(100.0),
                  child:Image.network(widget.image==null?"https://upload.wikimedia.org/wikipedia/commons/3/32/Flag_of_Pakistan.svg":widget.image),
                ),),
              SizedBox(height: 10,),
              //featured stores list

              Text(widget.name==null?"Name":widget.name,style: robrb22,),
              Text(widget.email==null?"Email":widget.email,style: robr),
              Text(widget.number==null?"03351222222":widget.number,style: robr),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0,0,18,0),
                child: Row(
                  children: [
                    Text('Addresses'.toUpperCase(),style: sansb18heading),
                    Spacer(),
                    InkWell(
                        onTap: ()async{
                            await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddressChange()),
                          ).then((value) {
                            setState(() {
                              index=value['key1'];
                            });

                            });
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (_) => AddressChange()));
                        },
                        child: Text('Change',style: robrgreen)),

                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height/5.8,
                  child: ListBuilder()),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Divider(),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Text('Payment method'.toUpperCase(),style: sansb18heading),
                    Spacer(),
                    Text('Master Card',style: robrgreen,),
                    Text('-',style: robrgreen,),
                    InkWell(
                        onTap: (){},
                        child: Text('Change',style: robrgreen)),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Divider(),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Text('Your Subscription'.toUpperCase(),style: sansb18heading,),
                    Spacer(),
                    InkWell(
                        onTap: (){

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => YourSubscription()),
                          // );
                        },
                        child: Text('Manage',style: robrgreen)),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Divider(),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Text('Payment History'.toUpperCase(),style: sansb18heading),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => PaymentCardDetails(getSelectedpayment: getSelectedpayment,)));
                        },
                        child: Text('View',style: robrgreen)),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Divider(),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Text('Order History'.toUpperCase(),style: sansb18heading),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          // pr.show();
                          // API.OrderDetailsApi(userid);
                          // waitactivity();

                          },
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) => OrderHistory()));

                          },
                            child: Text('View',style: robrgreen)
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Divider(),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                    child: InkWell(

                      onTap: (){
                        FirebaseAuth.instance.signOut();
                        MyApp.sharedPreferences.clear();
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));

                      },
                      child: Text('Logout',style: TextStyle(
                          fontSize: 18,color: green,
                          fontFamily: 'roboto')),
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget ListBuilder(){

    return  Padding(
      padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
      child:  new Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: addresslist.length,

            itemBuilder: (_, _index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                      color: index==_index?Color(0xFFE4E4E4):Colors.white,
                          ),

                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Container(width: 200, child: Text(addresslist[_index].address.toString(),textAlign: TextAlign.start, style: TextStyle(fontSize: 15.0,color: Colors.black),maxLines: 3,)),
                            ),
                            // Spacer(),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: <Widget>[
                            //     Text(address2,style: TextStyle(fontSize: 12.0,color: Colors.black),),
                            //     Radio(
                            //       value: index,
                            //       groupValue: addresslist[index].slected,
                            //       //  onChanged: radioButtonChanges(id),
                            //       onChanged: (val) =>
                            //           setState(() {
                            //             for(int i = 0; i< addresslist.length; i++){
                            //               if(i != index){
                            //                 addresslist[i].slected = -1;
                            //               }
                            //               else{
                            //                 addresslist[index].slected = val;
                            //                 choose = addresslist[index].address;
                            //                 selcted_address=addresslist[index].id;
                            //               }
                            //             }
                            //             //if(value==1){
                            //             // }
                            //             // else{
                            //             //   addresslist[index].slected=1;
                            //             // }
                            //           }),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void  getSelectedpayment(String paymentflag){
    setState(() {
      if(paymentflag == 'cash'){
        selectpaymenttype = paymentflag;
      }else{
        selectpaymenttype = 'card';
        selectedcardindex = paymentflag;
      }
    });

  }

  waitactivity() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.success == 'true'){
        pr.hide();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderHis()),
        );
      }
      else{
        waitactivity();
      }
    });
  }

}
