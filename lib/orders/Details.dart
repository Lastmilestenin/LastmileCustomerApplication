import 'package:flutter/material.dart';
import 'package:last_mile/orders/orderDetails.dart';
import 'package:last_mile/global.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Details extends StatefulWidget {
  final getUserDetails;
  Details({Key key, this.getUserDetails}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  ProgressDialog pr;


  void initState() {
    pr = ProgressDialog(context);
    super.initState();
  }


  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }else
      {
        pr.show();
        setState(() {
          widget.getUserDetails(_first.text,_last.text,_email.text,_phone.text);
        });
        Future.delayed(
            const Duration(
                milliseconds: 5000), () {
          pr.hide();
          Navigator.pop(context);
        });
      }
    _formKey.currentState.save();
  }
  TextEditingController _first = TextEditingController();
  TextEditingController _last = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  //TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [

                       InkWell(
                            onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => OrderDetails())),

                         child: Container(
                             child: Icon(Icons.arrow_back)
                         ),
                       ),

                    Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        padding: EdgeInsets.only(right: 24),
                        child: Center(
                          child: Text(
                            "Details",
                            style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: TextStyle(fontSize: 18, fontFamily: 'aveh'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 160,
                          child: TextFormField(
                              controller: _first,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter a valid password!';
                                }
                                return null;
                              },
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'aveb',
                                  letterSpacing: 2.2),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true)),
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 18, fontFamily: 'aveh'),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Your Email';
                        }
                        return null;
                      },
                      controller: _email,
                      style: TextStyle(
                          fontSize: 15, fontFamily: 'aveb', letterSpacing: 2.2),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 18, fontFamily: 'aveh'),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your phone number';
                        }
                        return null;
                      },
                      controller: _phone,
                      style: TextStyle(
                          fontSize: 15, fontFamily: 'aveb', letterSpacing: 2.2),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)),
                ),
                // SizedBox(
                //   height: 8,
                // ),
                // Text(
                //   "Address",
                //   style: TextStyle(fontSize: 18, fontFamily: 'aveh'),
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   height: 50,
                //   child: TextFormField(
                //       // validator: (value) {
                //       //   if (value.isEmpty) {
                //       //     return 'Enter your address';
                //       //   }
                //       //   return null;
                //       // },
                //      // controller: _address,
                //       style: TextStyle(
                //           fontSize: 15, fontFamily: 'aveb', letterSpacing: 2.2),
                //       decoration: InputDecoration(
                //           border: InputBorder.none,
                //           fillColor: Color(0xfff3f3f4),
                //           filled: true)),
                // ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: InkWell(
                      onTap: _submit,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 45,
                        margin: EdgeInsets.only(bottom: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(60, 111, 102, 1),
                          border: Border.all(
                            color: Color.fromRGBO(60, 111, 102, 1),
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text(
                          'SAVE',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'aveh',
                              letterSpacing: 2.2,
                              fontSize: 15.0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}