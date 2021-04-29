import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController msg = TextEditingController();
  Widget _entryField(String name,String title) {
    return Container(
      width: MediaQuery.of(context).size.width/1.3,
//      decoration: BoxDecoration(
//        border: Border.all(color: Colors.black),
//        borderRadius: BorderRadius.all(Radius.circular(1)),
//       // border: Border.fromBorderSide(Colors.black)
//      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Text(name,style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }
  Widget textField(TextEditingController title,String tit) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tit,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            maxLength: 200,
            controller: title,
              maxLines: 5,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      padding: EdgeInsets.only(top:10.0),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.of(context).pop(),),

          Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Text('Contact Us',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back,  color: Colors.grey[100]), ),

        ],
      ),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar,
              Container(
                height: MediaQuery.of(context).size.height/1.1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24), topLeft: Radius.circular(24)),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 10,),
                      _entryField('Ahsan','Name'),
                      SizedBox(height: 10,),
                      Divider(endIndent: 20),
                      SizedBox(height: 10,),
                      _entryField('Iqbal','Last Name'),
                      SizedBox(height: 10,),
                      Divider(endIndent: 20),
                      SizedBox(height: 10,),
                      _entryField('Ahsan12@gmail.com','Email'),
                      SizedBox(height: 10,),
                      Divider(endIndent: 20),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: textField(msg,"Details"),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(

                            width: MediaQuery.of(context).size.width /1.7,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(60, 111, 102, 1),
                              border: Border.all(color: Color.fromRGBO(60, 111, 102, 1),),
                              borderRadius: BorderRadius.circular(25.0),
                            ),

                            child: Center(
                                child: new Text("Save",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.0))),



                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
