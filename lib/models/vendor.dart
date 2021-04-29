class Vendor{
   var _id, _name, _email, _latitude, _longitude, _address , _image , _rating,_feature,_opentime,_closetime;

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }

  get image => _image;

  set image(value) {
    _image = value;
  }

   get feature => _feature;

   set feature(value) {
     _feature = value;
   }

   get opentime=> _opentime;
   set opentime(value){
     _opentime = value;
   }

   get closetime=> _closetime;
   set closetime(value){
     _closetime = value;
   }


  get id => _id;

  set id(value) {
    _id = value;
  }

  get name => _name;

  get address => _address;

  set address(value) {
    _address = value;
  }

  get longitude => _longitude;

  set longitude(value) {
    _longitude = value;
  }

  get latitude => _latitude;

  set latitude(value) {
    _latitude = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  set name(value) {
    _name = value;
  }


// Vendor({this.id, this.name, this.email, this.latitude, this.longitude,
  //     this.address});

  // factory Vendor.fromJson(Map<String, dynamic> json) {
  //   return Vendor(
  //     id: json['records']['id'],
  //     name: json['records']['name'],
  //     email:json['records']['email'],
  //     latitude:json['records']['locations']['latitude'],
  //     longitude:json['records']['locations']['longitude'],
  //     address:json['records']['locations']['address'],
  //   );
  // }
}

