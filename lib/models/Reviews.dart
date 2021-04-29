class Reviews{
  String variantid;
  String image;
  String name;
  double ratings;
  String date;
  String review;

  Reviews({this.image,this.name, this.ratings,this.date,this.review,this.variantid});
}
class vandorcatmodel{
  int id;
  String image;
  String name;


  vandorcatmodel({this.id,this.image,this.name});
}

class vandorcatidmodel{
  int id;
  String image;
  String name;
  String rating;

  vandorcatidmodel({this.id,this.image,this.name,this.rating});
}
class Featureshopmodel{
  int id;
  String image;
  String name;
  var rating;
  var lat;
  var long;

  Featureshopmodel({this.id,this.image,this.name,this.rating,this.lat,this.long});
}
class Bannermodel{

  String image;

  Bannermodel({this.image});
}
class OrderDetailsModel{

  String image;

  OrderDetailsModel({this.image});
}