
// order details k liye ye 2 model banaye hain
class Orders{

  var orderno;
  var placedOn;
  var amount;
  var status;
  var details;

  Orders({this.orderno,this.placedOn, this.amount,this.status,this.details});
}

class Ordersdetails{

  var orderno;
  var quantity;
  var amount;
  var status;

  Ordersdetails({this.orderno,this.quantity, this.amount,this.status,});
}
//*******************************************

//picked up jo orders hain ye unkay model hain

class pickedup{

  var checkorderid;
  var status;
  var driverid;

  var orderno;
  var price;
  var des_lat;
  var des_lng;

  pickedup({this.checkorderid, this.status, this.driverid, this.orderno,
      this.price, this.des_lat, this.des_lng});
}
